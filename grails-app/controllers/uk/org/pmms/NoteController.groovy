package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['ROLE_USER'])
@Transactional(readOnly = true)
class NoteController {

    static responseFormats = ['html','json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def CMISService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Note.list(params), [status: OK]
    }

    @Transactional
    def save(Note noteInstance) {
        if (noteInstance == null) {
            render status: NOT_FOUND
          return
			//noteInstance = new Note(params)
        }

        noteInstance.validate()
        if (noteInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }
		if (params.myFile){
			if (!request.getFile('myFile').empty){
				def CommonsMultipartFile uploadedFile = params.myFile
				def file = CMISService.createDocument(params.repoFolderId,' ', uploadedFile)
				noteInstance.addToAttachments(file)
			}
		}
		noteInstance.save flush:true
		NotificationService.noteNotification()
		
       request.withFormat {
			 form multipartForm {redirect controller: params.objectType, action: 'addNote', id: params.objectId, params:[noteId: noteInstance.id] }
			'*'{ respond noteInstance, [status: CREATED]}
		}
    }

    @Transactional
    def update(Note noteInstance) {
        if (noteInstance == null) {
            render status: NOT_FOUND
            return
        }

        noteInstance.validate()
        if (noteInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        noteInstance.save flush:true
        respond noteInstance, [status: OK]
    }

    @Transactional
    def delete(Note noteInstance) {

        if (noteInstance == null) {
            render status: NOT_FOUND
            return
        }

        noteInstance.delete flush:true
        render status: NO_CONTENT
    }
	def getNotes() {
		
	}
}
