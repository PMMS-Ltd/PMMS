package uk.org.pmms.accounts
import uk.org.pmms.Client
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class ServiceChargeTypeController {
    static scaffold = true
	
	def getTypes() {
		def c = ServiceChargeType.createCriteria()
		def output = ""
		
		def results = c.list {
			eq ('client',Client.get(params.clientId))
		}
		results.each() {
			output += '<option value="'+it.id+'">'+it.type+'</option>'
		}
		render output
	}
}




