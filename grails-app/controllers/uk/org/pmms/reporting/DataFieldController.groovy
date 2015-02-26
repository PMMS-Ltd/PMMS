package uk.org.pmms.reporting



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class DataFieldController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DataField.list(params), model:[dataFieldInstanceCount: DataField.count()]
    }

    def show(DataField dataFieldInstance) {
        respond dataFieldInstance
    }

    def create() {
        respond new DataField(params)
    }

    @Transactional
    def save(DataField dataFieldInstance) {
        if (dataFieldInstance == null) {
            notFound()
            return
        }

        if (dataFieldInstance.hasErrors()) {
            respond dataFieldInstance.errors, view:'create'
            return
        }

        dataFieldInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataField.label', default: 'DataField'), dataFieldInstance.id])
                redirect dataFieldInstance
            }
            '*' { respond dataFieldInstance, [status: CREATED] }
        }
    }

    def edit(DataField dataFieldInstance) {
        respond dataFieldInstance
    }

    @Transactional
    def update(DataField dataFieldInstance) {
        if (dataFieldInstance == null) {
            notFound()
            return
        }

        if (dataFieldInstance.hasErrors()) {
            respond dataFieldInstance.errors, view:'edit'
            return
        }

        dataFieldInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DataField.label', default: 'DataField'), dataFieldInstance.id])
                redirect dataFieldInstance
            }
            '*'{ respond dataFieldInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DataField dataFieldInstance) {

        if (dataFieldInstance == null) {
            notFound()
            return
        }

        dataFieldInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DataField.label', default: 'DataField'), dataFieldInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataField.label', default: 'DataField'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
