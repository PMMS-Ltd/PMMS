package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class InvoiceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Invoice.list(params), model:[invoiceInstanceCount: Invoice.count()]
    }

    def show(Invoice invoiceInstance) {
        respond invoiceInstance
    }
	@Secured(['ROLE_ADMIN'])
    def create() {
        respond new Invoice(params)
    }

    @Transactional
    def save(Invoice invoiceInstance) {
        if (invoiceInstance == null) {
            notFound()
            return
        }

        if (invoiceInstance.hasErrors()) {
            respond invoiceInstance.errors, view:'create'
            return
        }

        invoiceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'invoice.label', default: 'Invoice'), invoiceInstance.id])
                redirect invoiceInstance
            }
            '*' { respond invoiceInstance, [status: CREATED] }
        }
    }
	@Secured(['ROLE_ADMIN'])
    def edit(Invoice invoiceInstance) {
        respond invoiceInstance
    }

    @Transactional
    def update(Invoice invoiceInstance) {
        if (invoiceInstance == null) {
            notFound()
            return
        }

        if (invoiceInstance.hasErrors()) {
            respond invoiceInstance.errors, view:'edit'
            return
        }

        invoiceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Invoice.label', default: 'Invoice'), invoiceInstance.id])
                redirect invoiceInstance
            }
            '*'{ respond invoiceInstance, [status: OK] }
        }
    }
	@Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(Invoice invoiceInstance) {

        if (invoiceInstance == null) {
            notFound()
            return
        }

        invoiceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Invoice.label', default: 'Invoice'), invoiceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def showPdf = {
		def invoice = Invoice.get(params.id);
		def logoFile = new File(request.getSession().getServletContext().getRealPath("/images/PMMS Letterhead.png"))
		renderPdf(template: 'demo4', model: [invoiceInstance: invoice, logo: logoFile.bytes], filename: "Invoice - "+invoice.id)
	}
	def test(Invoice invoiceInstance) {
		render (template: 'demo4', model: [invoiceInstance: invoiceInstance])
	}
}
