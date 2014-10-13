package uk.org.pmms.reporting



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import uk.org.pmms.*

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class ReportTemplateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReportTemplate.list(params), model:[reportTemplateInstanceCount: ReportTemplate.count()]
    }

    def show(ReportTemplate reportTemplateInstance) {
        respond reportTemplateInstance
    }

    def create() {
        respond new ReportTemplate(params)
    }

    @Transactional
    def save(ReportTemplate reportTemplateInstance) {
        if (reportTemplateInstance == null) {
            notFound()
            return
        }

        if (reportTemplateInstance.hasErrors()) {
            respond reportTemplateInstance.errors, view:'create'
            return
        }

        reportTemplateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reportTemplate.label', default: 'ReportTemplate'), reportTemplateInstance.id])
                redirect reportTemplateInstance
            }
            '*' { respond reportTemplateInstance, [status: CREATED] }
        }
    }

    def edit(ReportTemplate reportTemplateInstance) {
        respond reportTemplateInstance
    }

    @Transactional
    def update(ReportTemplate reportTemplateInstance) {
        if (reportTemplateInstance == null) {
            notFound()
            return
        }

        if (reportTemplateInstance.hasErrors()) {
            respond reportTemplateInstance.errors, view:'edit'
            return
        }

        reportTemplateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ReportTemplate.label', default: 'ReportTemplate'), reportTemplateInstance.id])
                redirect reportTemplateInstance
            }
            '*'{ respond reportTemplateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ReportTemplate reportTemplateInstance) {

        if (reportTemplateInstance == null) {
            notFound()
            return
        }

        reportTemplateInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ReportTemplate.label', default: 'ReportTemplate'), reportTemplateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportTemplate.label', default: 'ReportTemplate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def myFunction() {
		def template = ReportTemplate.get(params.id)
		//def object = template.parentObject.get(params.objectId)
		def object = grailsApplication.getArtefact("Domain",template.parentObject)?.getClazz()?.get(params.objectId)
		println object.getClass()
		if (object){		
		def fields = template.dataFields
		def output = [:]
		fields.each(){
			def value =  it.name.toString().tokenize('.').inject(object) {v,k -> v."$k"}
			output.put(it.name, value)
		}
		render output as JSON
		}
		else{
			render "Error: ${template.parentObject} ${params.objectId} not Found!"
		}
	}
}
