package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class SupplierController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Supplier.list(params), model:[supplierInstanceCount: Supplier.count()]
    }

    def show(Supplier supplierInstance) {
        respond supplierInstance
    }
	def showJson(Supplier supplierInstance) {
		render supplierInstance as JSON
	}

    def create() {
        respond new Supplier(params)
    }

    @Transactional
    def save(Supplier supplierInstance) {
        if (supplierInstance == null) {
            notFound()
            return
        }

        if (supplierInstance.hasErrors()) {
			
            //respond supplierInstance.errors, view:'create'
            //return
			render supplierInstance.errors as JSON
        }

        supplierInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
                redirect supplierInstance
            }
            '*' { respond supplierInstance, [status: CREATED] }
        }
    }

    def edit(Supplier supplierInstance) {
        respond supplierInstance
    }

    @Transactional
    def update(Supplier supplierInstance) {
        if (supplierInstance == null) {
            notFound()
            return
        }

        if (supplierInstance.hasErrors()) {
            respond supplierInstance.errors, view:'edit'
            return
        }

        supplierInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Supplier.label', default: 'Supplier'), supplierInstance.id])
                redirect supplierInstance
            }
            '*'{ respond supplierInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Supplier supplierInstance) {

        if (supplierInstance == null) {
            notFound()
            return
        }

        supplierInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Supplier.label', default: 'Supplier'), supplierInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def search() {
		render (template: "supplierSearch", model: ['results': Supplier.search('*'+params.q+'*')])
		//render Person.search('*'+params.q+'*') as JSON
	}
	def getWorkTypes() {
		if (params.id){
			render (template: 'workTypes', collection: Supplier.get(params.id).workTypes)
		}
	}
}
