package uk.org.pmms.marshaller;

import uk.org.pmms.Address
import uk.org.pmms.Person
import uk.org.pmms.Client
import uk.org.pmms.accounts.BankAccount
import grails.converters.JSON

class CustomMarshaller {
	@javax.annotation.PostConstruct
	void registerMarshallers() {
		JSON.createNamedConfig("api") {
			it.registerObjectMarshaller(Address) { Address addr ->
				def output = [:]
				output['id'] = addr.id
				output['unitNo'] = addr.unitNo
				output['address1'] = addr.address1
				output['address2'] = addr.address2
				output['town'] = addr.town
				output['county'] = addr.county
				output['postCode'] = addr.postCode
				output['country'] = addr.country
			
				return output;
			}
			it.registerObjectMarshaller(Person) { Person p ->
				def output = [:]
				output['id'] = p.id
				output['salutation'] = p.salutation
				output['firstName'] = p.firstName
				output['inital'] = p.initial
				output['lastName'] = p.lastName
				output['address'] = p.address
				output['email'] = p.email1
				output['phone'] = p.phone1
			
				return output;
			}
			it.registerObjectMarshaller(BankAccount) { BankAccount ba ->
				def output = [:]
				output['id'] = ba.id
				output['name'] = ba.name
				output['accNo'] = ba.accNo
				output['sortCode'] = ba.sortCode
				output['type'] = ba.type
			
				return output;
			}
			it.registerObjectMarshaller(Client) { Client c ->
				def output = [:]
				output['id'] = c.id
				output['clientId'] = c.clientId
				output['name'] = c.name
				output['address'] = c.address
				output['yearStart'] = c.yearStart
				output['yearEnd'] = c.yearEnd
				output['regNo'] = c.registrationNo
				output['regDate'] = c.registrationDate
				output['accounts'] = c.accounts
				output['directors'] = c.directors
			
				return output;
			}
		}
	}
}
