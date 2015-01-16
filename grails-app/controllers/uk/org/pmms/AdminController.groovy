package uk.org.pmms

import grails.plugins.rest.client.*
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap

class AdminController {
	
	
    def index() { }
	@Secured(['ROLE_ADMIN'])
	def createNewClientFolder(String clientID, String title) {
		
		RestBuilder rest = new RestBuilder()
		MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
		form.add("cmisaction", "createFolder")
		form.add("succinct ", "true")
		form.add("propertyId[0]", "cmis:name")
		form.add("propertyId[1]", "cmis:objectTypeId")
		form.add("propertyId[2]", "cmis:description")
		form.add("propertyValue[0]", clientID)
		form.add("propertyValue[1]", "cmis:folder")
		form.add("propertyValue[2]", title)
		
		def resp = rest.post("http://192.168.0.42/alfresco/cmisbrowser/9860d1d8-433b-4419-aaab-6a0ddb92f7cd/root/PMMS/clients") {
			auth('user', 'bitnami')
			//accept("application/json")
			contentType("application/x-www-form-urlencoded")
			body(form)
		}
		def json = resp.json
		render json.properties.'cmis:objectId'.value
	}
	
	
	def createNewClientPropertyFolders(String clientID) {
	
	//Get all PropertyId
		
	//LOOP
		//Call ECM service to create the Property folder
		//Update Property in DB with ECM objectId
	//END LOOP
}
}
