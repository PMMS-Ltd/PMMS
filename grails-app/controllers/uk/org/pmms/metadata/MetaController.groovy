package uk.org.pmms.metadata

import uk.org.pmms.*
import grails.converters.JSON
import grails.rest.RestfulController
import org.hibernate.FetchMode

class MetaController extends RestfulController{
	static responseFormats = ['json','xml']
    
	def client() {
		def c = Client.createCriteria()
		def resp = c.list {
			eq('id', params.id.toLong())
		}
		respond c
	}
}
