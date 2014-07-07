package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class TransferController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def CMISService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Transfer.list(params), model:[transferInstanceCount: Transfer.count()]
    }

    def show(Transfer transferInstance) {
        respond transferInstance
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
		if (params.receivedFee == 'on'){
			transferInstance.feeReceived = new Date()
		}
        transferInstance.save flush:true
		CMISService.createFolder((String) transferInstance.id, 'd37bb4fe-adc5-4e94-8955-6297eafdf51c', '')
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
		if (params.receivedFee == 'on'){
			transferInstance.feeReceived = new Date()
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
        respond new Transfer(params)
	}
}
