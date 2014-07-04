package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class InvoiceItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond InvoiceItem.list(params), model:[invoiceItemInstanceCount: InvoiceItem.count()]
    }

    def show(InvoiceItem invoiceItemInstance) {
        respond invoiceItemInstance
    }

    def create() {
        respond new InvoiceItem(params)
    }

    @Transactional
    def save(InvoiceItem invoiceItemInstance) {
        if (invoiceItemInstance == null) {
            notFound()
            return
        }

        if (invoiceItemInstance.hasErrors()) {
            respond invoiceItemInstance.errors, view:'create'
            return
        }

        invoiceItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), invoiceItemInstance.id])
                redirect invoiceItemInstance
            }
            '*' { respond invoiceItemInstance, [status: CREATED] }
        }
    }

    def edit(InvoiceItem invoiceItemInstance) {
        respond invoiceItemInstance
    }

    @Transactional
    def update(InvoiceItem invoiceItemInstance) {
        if (invoiceItemInstance == null) {
            notFound()
            return
        }

        if (invoiceItemInstance.hasErrors()) {
            respond invoiceItemInstance.errors, view:'edit'
            return
        }

        invoiceItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'InvoiceItem.label', default: 'InvoiceItem'), invoiceItemInstance.id])
                redirect invoiceItemInstance
            }
            '*'{ respond invoiceItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(InvoiceItem invoiceItemInstance) {

        if (invoiceItemInstance == null) {
            notFound()
            return
        }

        invoiceItemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'InvoiceItem.label', default: 'InvoiceItem'), invoiceItemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
