package uk.org.pmms

import grails.transaction.Transactional

@Transactional
class CMISBrowserService {

	
    def createFolder(String folderName, String parentObjectId){
		withRest(id: "cmis-browser", uri: "http://192.168.0.42/alfresco/cmisbrowser/9860d1d8-433b-4419-aaab-6a0ddb92f7cd/root/") {
			auth.basic 'user', 'bitnami'
		  }
		
	}
}
