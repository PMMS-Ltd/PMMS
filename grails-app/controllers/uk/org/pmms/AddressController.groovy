package uk.org.pmms

import grails.plugin.springsecurity.annotation.Secured
import grails.rest.RestfulController;
import grails.converters.JSON

@Secured(['ROLE_USER'])
class AddressController extends RestfulController{
    static scaffold = true
	
	AddressController() {
		super(Address)
	}
	
	def show(Address addressInstance){
		JSON.use('api')
		respond addressInstance
	}
	
	def addressFinder() {
		def address = Address.findByUnitNoAndPostCode(params.unitNo, params.postCode)
		if(address){
			render address as JSON
		}else{
		render "Address not found" as JSON
		}
	}
}
