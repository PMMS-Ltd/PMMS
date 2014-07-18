package uk.org.pmms.accounts
import uk.org.pmms.Client

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class ServiceChargeController {
	static scaffold = true

	def listCharges() {
		if(params.clientId){
			render (template: 'serviceCharges', model: [serviceChargeTypeList: ServiceChargeTypes.findAllByClient(Client.get(params.clientId))])
		}
	}
}
