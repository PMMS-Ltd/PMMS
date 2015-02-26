package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.util.Holders
@Transactional(readOnly = true)
class NotificationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def NotificationService
	def grailsApplication
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Notification.list(params), model:[notificationInstanceCount: Notification.count()]
    }

    def show(Notification notificationInstance) {
        respond notificationInstance
    }

    def create() {
        respond new Notification(params)
    }

    @Transactional
    def save(Notification notificationInstance) {
        if (notificationInstance == null) {
            notFound()
            return
        }

        if (notificationInstance.hasErrors()) {
            respond notificationInstance.errors, view:'create'
            return
        }

        notificationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notification.label', default: 'Notification'), notificationInstance.id])
                redirect notificationInstance
            }
            '*' { respond notificationInstance, [status: CREATED] }
        }
    }

    def edit(Notification notificationInstance) {
        respond notificationInstance
    }

    @Transactional
    def update(Notification notificationInstance) {
        if (notificationInstance == null) {
            notFound()
            return
        }

        if (notificationInstance.hasErrors()) {
            respond notificationInstance.errors, view:'edit'
            return
        }

        notificationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Notification.label', default: 'Notification'), notificationInstance.id])
                redirect notificationInstance
            }
            '*'{ respond notificationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Notification notificationInstance) {

        if (notificationInstance == null) {
            notFound()
            return
        }

        notificationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Notification.label', default: 'Notification'), notificationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'notification.label', default: 'Notification'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	@Transactional
	def eventNotify() {
		NotificationService.eventNotify(recipient: '1', sender: 'docServer', message: 'Your Mailmerge is now complete!', type:'success')
		//event([namespace: 'browser', topic: 'savedTodo', data: 'Hello this is a message']) // will trigger registered browsers on 'savedTodo' topic
		//render "ok"
	}
	@Transactional
	def markAsRead(params){
		def notification = Notification.get(params.id)
		notification.messageRead = true
		notification.save()
		render "ok"
	}
	def sendNotificationEmail(){
		def sv = SiteVisit.get(1)
		sendMail {
			to "jon@pmms.org.uk"
			from "noreply@pmms.org.uk"
			subject "PMMS Approval Required - Site Visit"
			body(
				 view: "/notifications/approval",
				 model: [sv: sv, url: grailsApplication.config.grails.serverURL]
			)
		}
		render "mail sent"
		//render grailsApplication.config.grails.serverURL
	}
}
