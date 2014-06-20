package uk.org.pmms

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USER'])
class AddressController {
    static scaffold = true
	
	def addressFinder() {
		def address = Address.findByUnitNoAndPostCode(params.unitNo, params.postCode)
		if(address){
			render address as JSON
		}else{
		render "Address not found" as JSON
		}
	}
}
