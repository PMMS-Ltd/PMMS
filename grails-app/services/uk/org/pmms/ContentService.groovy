package uk.org.pmms

import grails.transaction.Transactional

@Transactional
class ContentService {
	def CMISService
	
    def getContent(String folderId){
		
		return CMISService.getQueryResults("select cmis:name, cmis:objectId, cmis:contentStreamLength, cmis:contentStreamMimeType from cmis:document where in_folder('" + folderId +"')")
	}
}
