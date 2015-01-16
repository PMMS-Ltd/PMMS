package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import grails.rest.RestfulController

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class TransferController extends RestfulController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	static responseFormats = ['html','json']
	def CMISService
	def TransferService
	
	def TransferController() {
		super(Transfer)
	}
    def index(Integer max) {
		if (params.filter){
			def c = Transfer.createCriteria()
			
			def results = c.list {
				if(params.filter.client){
					prop{
						eq 'client', Client.get(params.filter.client)
					}
				}
			}
			request.withFormat {
				json {render results as JSON}
				"*" {respond results, model:[transferInstanceCount: results.size()]}
			}
			
		}else{
        params.max = Math.min(max ?: 10, 100)
		request.withFormat {
			json {render Transfer.list(params) as JSON}
			"*" {respond Transfer.list(params), model:[transferInstanceCount: Transfer.count()]}
		}
        
		}
    }

    def show(Transfer transferInstance) {
		request.withFormat {
			json {render transferInstance as JSON}
			"*" {respond transferInstance}
		}
    }

    def create() {
        respond new Transfer(params)
    }

    @Transactional
    def save(Transfer transferInstance) {
        if (transferInstance == null) {
            notFound()
            return
        }

        if (transferInstance.hasErrors()) {
            respond transferInstance.errors, view:'create'
            return
        }
		
		if (params.vSolicitor.id == null){
			def sols = new Supplier()
			sols.properties = params.vSolicitor
			sols.save(flush:true)
			transferInstance.vSolicitor = sols
		}
		
        transferInstance.save(flush:true)
		
		try{
			def folderId = CMISService.createFolder((String) transferInstance.id, (String) grailsApplication.config.grails.alfresco.repo.transferfolder, '')
			if (folderId){
				transferInstance.repoFolderId = folderId
				transferInstance.save flush:true
			}
		}catch(e){
		}
		if (transferInstance.feeReceived == null && params.receivedFee == 'on'){
			//transferInstance.feeReceived = new Date()
			TransferService.createCopyPackInvoice(transferInstance)
			
		}
				
		//render transferInstance as JSON
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transfer.label', default: 'Transfer'), transferInstance.id])
                redirect transferInstance
            }
            '*' { respond transferInstance, [status: CREATED] }
        }
    }

    def edit(Transfer transferInstance) {
        respond transferInstance
    }

    @Transactional
    def update(Transfer transferInstance) {
        if (transferInstance == null) {
            notFound()
            return
        }

        if (transferInstance.hasErrors()) {
            respond transferInstance.errors, view:'edit'
            return
        }
		if (transferInstance.feeReceived == null && params.receivedFee == 'on'){
			//transferInstance.feeReceived = new Date()
			TransferService.createCopyPackInvoice(transferInstance)
			
		}
        transferInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Transfer.label', default: 'Transfer'), transferInstance.id])
                redirect transferInstance
            }
            '*'{ respond transferInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Transfer transferInstance) {

        if (transferInstance == null) {
            notFound()
            return
        }

        transferInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Transfer.label', default: 'Transfer'), transferInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transfer.label', default: 'Transfer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def getFiles(){
		def transfer = Transfer.get(params.id)
		def data =  CMISService.getQueryResults("select cmis:name, cmis:objectId, cmis:contentStreamLength, cmis:contentStreamMimeType from cmis:document where in_folder('" + (String) transfer.folderId +"')")
		//render (records: data, queryRecordCount: data.size(), totalRecordCount: data.size())
		
		render (contentType: 'text/json') {['records': data, 'queryRecordCount': data.size(), 'totalRecordCount': data.size()]}
	}
	def createSolicitor(){
      respond new Supplier(params)
	}
}
