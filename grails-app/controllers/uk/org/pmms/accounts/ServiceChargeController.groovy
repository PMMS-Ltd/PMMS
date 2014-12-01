package uk.org.pmms.accounts

import uk.org.pmms.Client

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class ServiceChargeController {
	static scaffold = true
	def ServiceChargeService
	
	def listCharges(Client clientInstance) {
		if(params){
			withFormat {
				'*' {render (view: 'listCharges', model: [serviceChargeTypeList: ServiceChargeType.findAllByClient(clientInstance), clientInstance: clientInstance])}
				json {render serviceChargeTypeList: ServiceChargeType.findAllByClient(clientInstance) as JSON}
			}
			
		}
	}
	@Transactional
	def applySVC(ServiceCharge svc){
		if (ServiceChargeService.applyServiceCharge(svc)){
			svc.status = 'Applied'
			svc.save flush: true
		}
		redirect (action:'listCharges', id: svc.serviceChargeType.client.id)
	}

	def addCharges(Client clientInstance){
		def client = Client.get(clientInstance.id)
		//System.out.println(clientId)
		render(view:'addCharges', model:['svcTypes': ServiceChargeType.findAllByClient(clientInstance), 'client': client])
		//render ServiceChargeType.findAllByClient(clientInstance) as JSON
	}
}
