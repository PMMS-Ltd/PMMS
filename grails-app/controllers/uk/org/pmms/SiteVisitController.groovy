package uk.org.pmms



import static org.springframework.http.HttpStatus.*

import java.text.DateFormat;
import java.text.SimpleDateFormat

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SiteVisitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
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
	def approveVisit() {
		def sv = SiteVisit.get(params.id)
		String username = springSecurityService.principal.username
		sv.approver = username
		sv.approved = true
		sv.approvalDate = new Date()
		sv.status = 'Approved'
		
		sv.save(flush:true, failOnError: true)
		
		request.withFormat {
			'*' {
				flash.message = "Site Visit " + sv.id + "approved by " + username + " at " + dfMedium.format(sv.approvalDate)
				flash.type = 'success'
				flash.icon = 'fa fa-check'
				redirect action:"index", method:"GET"
			}
		}
	}
	@Transactional
	def addJob() {
		def sv = SiteVisit.get(params.id)
		def job = Job.get(params.jobId)
		
		sv.addToJobs(job).save(flush:true, failOnError: true)
		render (view:"create", model:[siteVisitInstance: sv])
	}
}
