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
	def ArrearsService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	@Secured(['ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Property.list(params), model:[propertyInstanceCount: Property.count()]
    }
	@Secured(['ROLE_USER'])
    def show(Property propertyInstance) {
		String query = "select cmis:name, cmis:objectId, cmis:contentStreamLength, cmis:contentStreamMimeType, cmis:description from cmis:document where in_folder('" + propertyInstance.repoFolderId + "')"
        respond propertyInstance, model:[arrears: ArrearsService.arrearsByProperty(propertyInstance), files: CMISService.getQueryResults(query,10,0)]
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
		def arrears = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredLessThan(prop,[2,7,12],prop.client.yearStart).amount.sum()
		def creditSum = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredBetweenAndAmountGreaterThan(prop,[2,7,12],prop.client.yearStart, prop.client.yearEnd, 0).amount.sum()
		def debitSum = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredBetweenAndAmountLessThan(prop,[2,7,12],prop.client.yearStart, prop.client.yearEnd, 0).amount.sum()
		//def transactionList = Transaction.findAllByPropertyId(prop,[sort: 'dateEntered', order: 'asc'])
		if (arrears != null){
			if (arrears > 0){
				creditSum = creditSum + arrears
			}else if (arrears < 0) {
				debitSum = debitSum + arrears
			}
		}
		creditSum = creditSum != null ? creditSum : 0.00
		debitSum = debitSum != null ? debitSum : 0.00
		
		
		render (template:'../templates/svcStatement', model: [transactionList: transactionList, property: prop, arrears: arrears, creditSum: creditSum, debitSum: debitSum])
	}
	@Secured(['ROLE_USER'])
	def svcPdf (Property prop) {
		def transactionList = Transaction.findAllByPropertyIdAndDateEnteredBetween(prop, prop.client.yearStart, prop.client.yearEnd, [sort: 'dateEntered', order: 'asc'])
		def logoFile = new File(request.getSession().getServletContext().getRealPath("/images/PMMSlogo.png"))
		def ricsFile = new File(request.getSession().getServletContext().getRealPath("/images/RICS-Black.png"))
		def irpmFile = new File(request.getSession().getServletContext().getRealPath("/images/IRPM.jpg"))
		def arrears = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredLessThan(prop,[2,7,12],prop.client.yearStart).amount.sum()
		def creditSum = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredBetweenAndAmountGreaterThan(prop,[2,7,12],prop.client.yearStart, prop.client.yearEnd, 0).amount.sum()
		def debitSum = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredBetweenAndAmountLessThan(prop,[2,7,12],prop.client.yearStart, prop.client.yearEnd, 0).amount.sum()
		//def transactionList = Transaction.findAllByPropertyId(prop,[sort: 'dateEntered', order: 'asc'])
		if (arrears != null){
			if (arrears > 0){
				creditSum = creditSum + arrears
			}else if (arrears < 0) {
				debitSum = debitSum + arrears
			}
		}
		creditSum = creditSum != null ? creditSum : 0.00
		debitSum = debitSum != null ? debitSum : 0.00
		renderPdf (template: '/pdf/statement',  model: [transactionList: transactionList, property: prop, logo: logoFile.bytes, RICS: ricsFile.bytes, IRPM: irpmFile.bytes, arrears: arrears, creditSum: creditSum, debitSum: debitSum], filename:'Statement_'+prop.propertyId+'.pdf')
	}
}
