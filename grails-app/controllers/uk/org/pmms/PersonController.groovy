package uk.org.pmms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USER'])
@Transactional(readOnly = true)
class PersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def mailService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params), model:[personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def create() {
        respond new Person(params)
    }

    @Transactional
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'create'
            return
        }
		
		
        personInstance.save flush:true
		

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
                redirect personInstance
				
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        respond personInstance
    }

    @Transactional
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'edit'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*'{ respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def search() {
		render (template: "ownerSearch", model: ['results': Person.search('*'+params.q+'*')])
	}
	/*def personSearch() {
		if (!params.popUp)
		render (template: "personList", model: ['personInstanceList': Person.findAllByFirstNameIlikeOrLastNameIlike('%'+params.search+'%','%'+params.search+'%')])
		else
		render (template: "ownerSearch", model: ['results': Person.findAllByFirstNameIlikeOrLastNameIlike('%'+params.search+'%','%'+params.search+'%')])
	}*/
	
	def personSearch() {
		def c = Person.createCriteria()
		def results = c.list {
			or{
				ilike ("firstName",'%'+params.search+'%')
				ilike ("lastName",'%'+params.search+'%')
				address {or{
					ilike ("address1", '%'+params.search+'%')
					ilike ("postCode", '%'+params.search+'%')
					}
				}
			}			
		}
		render (template: "personList", model: ['personInstanceList': results])
	}
	def sendEmail() {
		mailService.sendMail { 
			to params.email
			subject params.subject
			html params.message
		}
		request.withFormat {
			form multipartForm {
				flash.status = "alert-success"
				flash.message = "Email sent successfully!"
				redirect action: "index", method: "GET"
			}
			'*'{ redirect action:"index", method: "GET" }
		}
	}
}
