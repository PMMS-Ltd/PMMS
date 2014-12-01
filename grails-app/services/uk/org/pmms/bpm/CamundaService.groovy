package uk.org.pmms.bpm

import grails.transaction.Transactional
import grails.plugins.rest.client.RestBuilder
import grails.util.Holders
import grails.converters.JSON

@Transactional
class CamundaService {

	def camundaUrl = Holders.config.grails.camunda.url
	def engineUrl = camundaUrl + "/engine-rest"
	def rest = new RestBuilder()
	
	def getProcessEngine() {
		def resp = rest.get(engineUrl+"/engine")
		return resp.json as JSON
	}
	
	def getProcesses() {
		def resp = rest.get(engineUrl+"/process-definition")
		return resp.json
	}
	def getProcessbyKey(String key) {
		def resp = rest.get(engineUrl+"/process-definition/key/"+key)
		return resp.json
	}
	def getRenderedStartForm(String id){
		def resp = rest.get(engineUrl+"/process-definition/"+id+"/startForm")
		
			if (resp.json.key.toString().startsWith("embedded:app")){
				return camundaUrl+resp.json.contextPath+"/"+resp.json.key.substring(13)
			}else if(resp.json.key.toString().startsWith("embedded:engine")){
				return engineUrl+"/process-definition/"+id+"/rendered-form"
		}else{
			return null
		}
	}
	def getPostUrl(String processId){
		return (engineUrl+"/process-definition/"+processId+"/submit-form")
	}
	def getInstances(String id){
		def resp = rest.get(engineUrl+"/process-instance?processDefinitionId="+id)
		return resp.json
	}
}
