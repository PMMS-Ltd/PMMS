package uk.org.pmms.docserver

import grails.transaction.Transactional
import grails.util.Holders
import grails.plugins.rest.client.RestBuilder
import groovy.util.slurpersupport.GPathResult
import org.codehaus.groovy.grails.web.json.JSONObject

@Transactional
class DocServerService {

    def docServerUrl = Holders.config.grails.docServer.url
	def rest = new RestBuilder()
	
	def getTemplates() {
		
		def resp = rest.get(docServerUrl+"/templates.json")
		if (resp.json != null){
			return resp.json
		}
		else if (resp.xml != null){
			return resp.xml
		}
		else {
			return resp.body
		}
	}
	
	def mergeSingleDocument(params) {
		
		if (params.format == "pdf"){
			//println "PDF: " + docServerUrl+"/mergePDF"
			def resp = rest.post(docServerUrl+"/mergePDF"){
				json {
					params.each(){key, value ->
						key = value
					}
				}
			}
			return resp.body
			println resp.body
		}else{
		//println "DOCX: " + docServerUrl+"/api/merge"
		println "mergeSingleDocument params: " + params
		def resp = rest.post(docServerUrl+"/api/merge"){
				json {
					params.each(){key, value ->
						println key + " : " + value
						key = value
					}
				}
			}
		//println resp.body
		return resp
		}
		
	}
	def getRenderedMergeForm(int templateId){
		if (templateId){
			def resp = rest.get(docServerUrl+"/api/template/"+templateId+"/render-form")
			return resp.body
		}else{
			return "Error: A templateId must be supplied"
		}
		
		
	}
	
}
