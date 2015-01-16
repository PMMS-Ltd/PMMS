package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import uk.org.pmms.accounts.BankAccount
import uk.org.pmms.calendar.Event;
import uk.org.pmms.calendar.Calendar;

@Transactional(readOnly = true)
class ClientController {
	def CMISService
	def ArrearsService
	def grailsApplication
	def TransferService
	//def CalendarService
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	@Secured(['ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Client.list(params), model:[clientInstanceCount: Client.count()]
    }
	@Secured(['ROLE_USER'])
    def show(Client clientInstance) {
		def eventCount = 0
		if (clientInstance.calendarId){
			//eventCount = CalendarService.getEventCount(clientInstance?.calendarId)
			eventCount = Event.findAllByCalendarAndStartDateGreaterThanAndEndDateLessThan(Calendar.get(clientInstance.calendarId), new Date().minus(1), new Date().plus(30)).size()
		}
		withFormat {
			json { render clientInstance as JSON}
			'*' {
				String query = "select cmis:name, cmis:objectId, cmis:contentStreamLength, cmis:contentStreamMimeType from cmis:document where in_folder('" + clientInstance.repoFolderId + "')"
				
				[clientInstance: clientInstance, files: CMISService.getQueryResults(query, 10, 0), eventCount: eventCount]
			}
		}
		
    }
	@Secured(['ROLE_ADMIN'])
    def create() {
        respond new Client(params)
    }
	@Secured(['ROLE_USER'])
    @Transactional
    def save(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view:'create'
            return
        }
		
		//Create Alfresco Folder
		
		def folderId = CMISService.createFolder(clientInstance.clientId, grailsApplication.config.grails.alfresco.repo.clientfolder, clientInstance.name)
		if (folderId){
			clientInstance.repoFolderId = folderId
		}
		def calendarId = CalendarService.createCalendar(name:clientInstance.name, color: 'blue', textColor: 'white')
		clientInstance.calendarId = calendarId
		clientInstance.save flush:true
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: CREATED] }
        }
    }
	@Secured(['ROLE_USER'])
    def edit(Client clientInstance) {
        respond clientInstance
    }
	@Secured(['ROLE_USER'])
	def editDirectors(Client clientInstance) {
		respond clientInstance
	}
	@Secured(['ROLE_USER'])
    @Transactional
    def update(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view:'edit'
            return
        }

        clientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect clientInstance
            }
            '*'{ respond clientInstance, [status: OK] }
        }
    }
	@Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(Client clientInstance) {

        if (clientInstance == null) {
            notFound()
            return
        }

        clientInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	@Secured(['ROLE_ADMIN'])
	@Transactional
	def addDirector (Client clientInstance) {
		
		def director = Person.get(params.person)
		
		clientInstance.addToDirectors(director)
		
		clientInstance.save flush:true
		
		//render client as JSON
		redirect (action: "editDirectors", id: clientInstance.id)
		
	}
	@Secured(['ROLE_ADMIN'])
	@Transactional
	def removeDirector (Client clientInstance) {
		
		def director = Person.get(params.person)
		
		clientInstance.removeFromDirectors(director)
		
		clientInstance.save flush:true
		
		//render client as JSON
		redirect (action: "editDirectors", id: clientInstance.id)
		
	}
	@Secured(['ROLE_USER'])
	def finances (Client clientInstance) {
		//respond clientInstance
		render(view:'finances',model:[arrears : ArrearsService.arrearsByClient(clientInstance), clientInstance: clientInstance])
	}
	
	@Secured(['ROLE_USER'])
	@Transactional
	def addAccount() {
		def ba = new BankAccount()
		ba.properties = params.account
		ba.sortCode = 20057
		ba.save flush:true
		def client = Client.get(params.clientId).addToAccounts(ba).save()
		
		render(template:'/bankAccount/accounts',model:[clientInstance: client])
	}
	@Secured(['ROLE_USER'])
	@Transactional
	def removeAccount() {

		def client = Client.get(params.clientId).removeFromAccounts(BankAccount.get(params.id)).save()
		
		render(template:'/bankAccount/accounts',model:[clientInstance: client])
	}
	@Secured(['ROLE_USER'])
	def clientSearch() {
		def c = Client.createCriteria()
		def results = c.list(){
			or{
				ilike ("clientId",'%'+params.search+'%')
				ilike ("name",'%'+params.search+'%')
				address{
					or{
						ilike ("address1", '%'+params.search+'%')
						ilike ("postCode", '%'+params.search+'%')
					}
				}
			}
		}
		render (template: "clientList", model: ['clientInstanceList': results])
	}

}