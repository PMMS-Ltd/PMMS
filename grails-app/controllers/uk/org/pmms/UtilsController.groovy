package uk.org.pmms

import grails.converters.JSON
import uk.org.pmms.bpm.*
import org.springframework.web.multipart.commons.CommonsMultipartFile

class UtilsController {
	def CamundaService
	def springSecurityService
	def CalendarService
	def CMISService
	def NotificationService
	def directoryService
	
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
	def showProcessInstances(){
		render (template: "showInstances", model: [instanceList: CamundaService.getInstances(params.id)])
	}
	def createCalendar() {
		
		render CalendarService.createCalendar(params)
	}
	def showNotification() {
		render (view: '/notifications/basic')
	}
	def uploadDocument(){
		
		def CommonsMultipartFile uploadedFile = params.myFile
		String description = params.description?params.description:" "
		CMISService.createDocument(params.repoFolderId, description, uploadedFile)
		redirect(controller: params.objectType, action: "show", params: [id: params.objectId])
	}
	def deleteDocument(){
		CMISService.deleteDocument(params.Id)
		redirect(controller: params.objectType, action: "show", params: [id: params.objectId])
	}
	def downloadDocument(){
		def output = CMISService.getDocument(params.documentId)
		def settings = CMISService.getQueryResults("select cmis:name, cmis:contentStreamMimeType from cmis:document where cmis:objectId='"+params.documentId+"'")
		def filename = (String)settings.name.toString().substring(1,settings.name.toString().length()-1)
		if (output) {
			response.setHeader("Content-disposition", "attachment; filename=" + filename);
		 response.setContentType(settings.contentStreamMimeType)
		 response.outputStream << output
		}
	}
	def getGroupMemberEmails() {
		if (params.name){
			def approvers = directoryService.findGroupWhere('cn': params.name)
			def output = []
			approvers.uniqueMemberValues().each(){
				
				def person = directoryService.findPersonWhere('cn':it.substring(3).split(',')[0])
				def arr = [:]
				arr.put('uid', person.uid)
				arr.put('name', person.displayName)
				arr.put('email', person.mail)
				
				output.add(arr)
			}
			render output as JSON
		}
	}
	
	
}