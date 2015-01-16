package uk.org.pmms

import grails.converters.JSON
import javassist.bytecode.ByteArray
class LettersAndMailingsController {
	
	def DocServerService
    def index() {
		//render (DocServerService.getTemplates())
		render (view: "index", model: ['templates': DocServerService.getTemplates()])
	}
	def mergeDoc(){
		println "mergeDoc params: " + params
		def output = DocServerService.mergeSingleDocument(params)
	
		
		response.setHeader("Content-disposition", "attachment; filename="+System.nanoTime()+".docx");
		response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
	
		response.outputStream << output.body.decodeBase64()
	}
	def renderForm() {
		
		render DocServerService.getRenderedMergeForm(params.templateId.toInteger())
	}
}
