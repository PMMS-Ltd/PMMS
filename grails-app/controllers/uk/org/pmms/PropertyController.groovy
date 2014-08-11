package uk.org.pmms



import static org.springframework.http.HttpStatus.*

import org.junit.After;
import uk.org.pmms.accounts.Transaction
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Transactional(readOnly = true)

class PropertyController {
	def CMISService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	@Secured(['ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Property.list(params), model:[propertyInstanceCount: Property.count()]
    }
	@Secured(['ROLE_USER'])
    def show(Property propertyInstance) {
        respond propertyInstance
    }
	@Secured(['ROLE_ADMIN'])
    def create() {
        	respond new Property(params)
    }
	@Secured(['ROLE_USER'])
    @Transactional
    def save(Property propertyInstance) {
        if (propertyInstance == null) {
            notFound()
            return
        }

        if (propertyInstance.hasErrors()) {
            respond propertyInstance.errors, view:'create'
            return
        }
		//Create alfresco folder
		def folderID = createPropertyFolder(propertyInstance)
		println folderID
		if (!folderID.startsWith('Error') ){
			propertyInstance.repoFolderId = folderID
		}
		
        propertyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'property.label', default: 'Property'), propertyInstance.id])
                redirect propertyInstance
            }
            '*' { respond propertyInstance, [status: CREATED] }
        }
    }
	@Secured(['ROLE_USER'])
    def edit(Property propertyInstance) {
        respond propertyInstance
    }
	@Secured(['ROLE_USER'])
    @Transactional
    def update(Property propertyInstance) {
        if (propertyInstance == null) {
            notFound()
            return
        }

        if (propertyInstance.hasErrors()) {
            respond propertyInstance.errors, view:'edit'
            return
        }
		if (params.createNewOwner == 'true'){
			def newOwner = new Person();
			newOwner.properties = params.owner
			newOwner.save flush:true
			propertyInstance.owner = newOwner
		}
        propertyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Property.label', default: 'Property'), propertyInstance.id])
                redirect propertyInstance
            }
            '*'{ respond propertyInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(['ROLE_ADMIN'])
    def delete(Property propertyInstance) {

        if (propertyInstance == null) {
            notFound()
            return
        }

        propertyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Property.label', default: 'Property'), propertyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'property.label', default: 'Property'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def createPropertyFolder(Property propertyInstance) {
		def clientFolderID = propertyInstance.client.repoFolderId
		if (clientFolderID){
			def folderId = CMISService.createFolder(propertyInstance.propertyId, clientFolderID, '')
			println folderId
			if (folderId){
				return folderId
			}
		}else{
			return "Error: could not find parent folder Id"
		}
	}
	@Secured(['ROLE_USER'])
	def search() {
		render Property.search(params.q) as JSON
	}
	@Secured(['ROLE_USER'])
	def getPropsByClient() {
		if (params.id){
			def props = Property.findAllByClient(Client.get(params.id))
			render (template: 'propsByClient', collection: props)
			//render props as JSON
		}
	}
	@Secured(['ROLE_USER'])
	def financeDetails (Property prop) {
		render (template: 'financeDetails', model: [propertyInstance: prop])
	}
	
	@Secured(['ROLE_USER'])
	def svcStatement (Property prop) {
		def transactionList = Transaction.findAllByPropertyIdAndDateEnteredBetween(prop, prop.client.yearStart, prop.client.yearEnd, [sort: 'dateEntered', order: 'asc'])
		//def transactionList = Transaction.findAllByPropertyId(prop,[sort: 'dateEntered', order: 'asc'])
		
		render (template:'svcStatement', model: [transactionList: transactionList, property: prop])
	}
	@Secured(['ROLE_USER'])
	def svcPdf (Property prop) {
		def transactionList = Transaction.findAllByPropertyIdAndDateEnteredBetween(prop, prop.client.yearStart, prop.client.yearEnd, [sort: 'dateEntered', order: 'asc'])
		renderPdf(template: '/pdf/statement',  model: [transactionList: transactionList, property: prop], filename:'Statement_'+prop.propertyId)
	}
}
