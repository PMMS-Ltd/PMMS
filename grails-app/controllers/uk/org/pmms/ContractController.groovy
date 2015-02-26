package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.sql.Timestamp


@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class ContractController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def CMISService
	//DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm", Locale.ENGLISH);
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contract.list(params), model:[contractInstanceCount: Contract.count()]
    }

    def show(Contract contractInstance) {
		String query = "select cmis:name, cmis:objectId, cmis:contentStreamLength, cmis:contentStreamMimeType, cmis:description from cmis:document where in_folder('" + contractInstance.repoFolderId + "')"
        respond contractInstance, model:[files: CMISService.getQueryResults(query, 10, 0)]
    }

    def create() {
        respond new Contract(params)
    }

    @Transactional
	def save(Contract contractInstance) {
        
		if (contractInstance.hasErrors()) {
            respond contractInstance.errors, view:'create'
            return
        }

		def folderId = CMISService.createFolder(contractInstance.ref.replace('/','-'), grailsApplication.config.grails.alfresco.repo.contractfolder, contractInstance.ref)
		if (folderId){
			contractInstance.repoFolderId = folderId
		}
        contractInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contract.label', default: 'Contract'), contractInstance.id])
                redirect contractInstance
            }
            '*' { respond contractInstance, [status: CREATED] }
        }
    }

    def edit(Contract contractInstance) {
        respond contractInstance
    }

    @Transactional
    def update(Contract contractInstance) {
        if (contractInstance == null) {
            notFound()
           return
        }
        if (contractInstance.hasErrors()) {
            respond contractInstance.errors, view:'edit'
            return
        }

        contractInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Contract.label', default: 'Contract'), contractInstance.id])
                redirect contractInstance
            }
            '*'{ respond contractInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Contract contractInstance) {

        if (contractInstance == null) {
            notFound()
            return
        }

        contractInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Contract.label', default: 'Contract'), contractInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	@Transactional
	def addNote() {
		def contract = Contract.get(params.id)
		def note = Note.get(params.noteId)
		
		contract.addToNotes(note).save()
		
		redirect action: 'show', id: contract.id
	}
	
}
