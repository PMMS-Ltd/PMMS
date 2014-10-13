package uk.org.pmms

import grails.converters.JSON
import uk.org.pmms.bpm.*

class UtilsController {
	def CamundaService
	def springSecurityService
	
    def index() { 
		def output = [:]
		def classes = grailsApplication.getArtefacts("Domain").clazz
		classes.each(){
			//println it.toString().substring(6)
			def domainClass = grailsApplication.getArtefact("Domain", it.toString().substring(6))
			
			def props = []
			domainClass.getPersistentProperties().each() {prop ->
				props.add(prop)
				//println prop.name
		}
			output.put(it.toString().substring(6), props)
		}
		
		render output as JSON
		
    }
	
	def test(String classname){
		
		if (classname == null){
			if  (params.className){
				classname = params.className
			}
			else{
				return "Error: no className specified"
			}
		}
		
		def object = grailsApplication.getArtefact("Domain", classname)
		
		/*try{
		object.getPersistentProperties().each(){ prop ->
			println prop.name + " : " + prop.type 
			if (prop.isAssociation()) {
				
				test(prop.type.toString().substring(prop.type.toString().indexOf(" ")+1))
			}
		}
		}catch (e) {
		}*/
		render object.clazz as JSON
	}
	def connectCamunda() {
		render CamundaService.getProcessEngine()
	}
	def processes() {
		//render CamundaService.getProcesses()
		render (template: "bpmProcesses", model: [processes: CamundaService.getProcesses()])
	}
	def user() {
		def principal = springSecurityService.principal
		def authorities = principal.authorities
		def user = springSecurityService.getCurrentUser()
		render principal as JSON
	}
	def startProcess() {
		render (template: "startProcess", model: [startForm: CamundaService.getRenderedStartForm(params.id), postUrl: CamundaService.getPostUrl(params.id)])
	}
}