package uk.org.pmms



import static org.springframework.http.HttpStatus.*

import java.text.DateFormat;
import java.text.SimpleDateFormat
import grails.converters.JSON
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class SiteVisitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	def NotificationService
	DateFormat dfShort = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	DateFormat dfMedium = new SimpleDateFormat("dd/MM/yyyy HH:mm", Locale.ENGLISH);
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SiteVisit.list(params), model:[siteVisitInstanceCount: SiteVisit.count()]
    }

    def show(SiteVisit siteVisitInstance) {
        respond siteVisitInstance
    }

    def create() {
		String username = springSecurityService.principal.username
		params.requester = username
        respond new SiteVisit(params)
    }

    @Transactional
    def save(SiteVisit siteVisitInstance) {
        if (siteVisitInstance == null) {
            notFound()
            return
        }
		
        if (siteVisitInstance.hasErrors()) {
            respond siteVisitInstance.errors, view:'create'
            return
        }
		
		
        siteVisitInstance.save flush:true
		
		NotificationService.approvalNotification(siteVisitInstance.id.toString())
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'siteVisit.label', default: 'SiteVisit'), siteVisitInstance.id])
				flash.type = 'success'
				flash.icon = 'fa fa-floppy-o'
                redirect action: 'index'
            }
            '*' { respond siteVisitInstance, [status: CREATED] }
        }
    }

    def edit(SiteVisit siteVisitInstance) {
        respond siteVisitInstance
    }

    @Transactional
    def update(SiteVisit siteVisitInstance) {
        if (siteVisitInstance == null) {
            notFound()
            return
        }

        if (siteVisitInstance.hasErrors()) {
            respond siteVisitInstance.errors, view:'edit'
            return
        }

        siteVisitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SiteVisit.label', default: 'SiteVisit'), siteVisitInstance.id])
				flash.type = 'info'
				flash.icon = 'fa fa-refresh'
                redirect siteVisitInstance
            }
            '*'{ respond siteVisitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SiteVisit siteVisitInstance) {

        if (siteVisitInstance == null) {
            notFound()
            return
        }

        siteVisitInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SiteVisit.label', default: 'SiteVisit'), siteVisitInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteVisit.label', default: 'SiteVisit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def events() {
		/*def c = SiteVisit.createCriteria()
		def events = c.list(){
			ge ('visitDate',dfShort.parse(params.start))
			le ('visitDate', dfShort.parse(params.end))
		}*/
		render SiteVisit.list(params) as JSON
	}
	@Transactional
	def approve() {
		def sv = SiteVisit.get(params.id)
		if (sv.status == 'Draft'){
			sv.approved = true
			sv.status = 'Approved'
			
			sv.save(flush:true, failOnError: true)
			sv.jobs.each() {
				def job = Job.get(it.id)
				job.requiresSV = false
				job.save()
			}
			request.withFormat {
				'*' {
						flash.message = "Site Visit " + sv.id + " approved at " + dfMedium.format(new Date())
						flash.type = 'success'
						flash.icon = 'fa fa-thumbs-up'
						redirect action:"index", method:"GET"
					}
			}
		}else if(sv.status == "Approved"){
			render "Site Visit has already been approved"
		}else {
			render "Site Visit approval not available"
		}
	}
	@Transactional
	def reject() {
		def sv = SiteVisit.get(params.id)
		if (sv.status == 'Draft'){
			sv.approved = false
			sv.status = 'Rejected'
			
			sv.save(flush:true, failOnError: true)
			request.withFormat {
				'*' {
					flash.message = "Site Visit " + sv.id + " Rejected at " + dfMedium.format(sv.approvalDate)
					flash.type = 'danger'
					flash.icon = 'fa fa-thumbs-down'
					redirect action:"index", method:"GET"
				}
			}
		}else if(sv.status == "Rejected"){
			render "Site Visit has already been rejected"
		}else {
			render "Site Visit rejection not available"
		}
	}
	@Transactional
	def addJob() {
		def sv = SiteVisit.get(params.id)
		def job = Job.get(params.jobId)
		
		sv.addToJobs(job).save(flush:true, failOnError: true)
		render (view:"create", model:[siteVisitInstance: sv])
	}
	def getJobs() {
		def jobs = Job.findAllByClientAndRequiresSV(Client.get(params.id), true)
		
		def getJobs = "<select id='jobsSelect' name='jobs' multiple='multiple'>"
		
		jobs.each(){
			getJobs += "<option value='"+it.id+"'>"+it.id+"</option>"	
		}
		getJobs += "</select>"
		render getJobs
	}
}
