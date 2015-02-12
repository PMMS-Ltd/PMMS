package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
@Transactional(readOnly = true)
class JobController {

    static responseFormats = ['html','json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	def directoryService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Job.list(params), [status: OK]
    }

	def create() {
		def username = springSecurityService.principal.username
		params.enteredBy = username
		def job = new Job(params)
		def users = directoryService.findPeopleWhere(objectClass:'inetOrgPerson')
		request.withFormat {
			html { render(view:'create', model:[jobInstance: job, users: users])}
		   json{ respond job, [status: OK]}
	   }
		//respond job, [status: OK, users: users]
	}
	def show(Job jobInstance) {
		respond jobInstance, [status: OK]
	}
    @Transactional
    def save(Job jobInstance) {
        if (jobInstance == null) {
            render status: NOT_FOUND
            return
        }

        jobInstance.validate()
        if (jobInstance.hasErrors()) {
			request.withFormat {
				form multipartForm {respond jobInstance.errors, view:'create'}
			   '*'{  render status: NOT_ACCEPTABLE}
			}
			return
        }

        jobInstance.save flush:true
		request.withFormat {
			 form multipartForm { render(view:'show', model:[jobInstance: jobInstance])}
			'*'{ respond jobInstance, [status: CREATED]}
		}
       
    }

    @Transactional
    def update(Job jobInstance) {
        if (jobInstance == null) {
            render status: NOT_FOUND
            return
        }

        jobInstance.validate()
        if (jobInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        jobInstance.save flush:true
        respond jobInstance, [status: OK]
    }

    @Transactional
    def delete(Job jobInstance) {

        if (jobInstance == null) {
            render status: NOT_FOUND
            return
        }

        jobInstance.delete flush:true
        render status: NO_CONTENT
    }
}
