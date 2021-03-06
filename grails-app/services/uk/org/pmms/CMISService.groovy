package uk.org.pmms

import grails.transaction.Transactional

import org.apache.chemistry.opencmis.client.api.CmisObject;
import org.apache.chemistry.opencmis.client.api.Document;
import org.apache.chemistry.opencmis.client.api.Folder;
import org.apache.chemistry.opencmis.client.api.ItemIterable;
import org.apache.chemistry.opencmis.client.api.QueryResult;
import org.apache.chemistry.opencmis.client.api.Repository;
import org.apache.chemistry.opencmis.client.api.Session;
import org.apache.chemistry.opencmis.client.api.SessionFactory;
import org.apache.chemistry.opencmis.client.runtime.SessionFactoryImpl;
import org.apache.chemistry.opencmis.commons.PropertyIds;
import org.apache.chemistry.opencmis.commons.SessionParameter;
import org.apache.chemistry.opencmis.commons.data.ContentStream;
import org.apache.chemistry.opencmis.commons.data.PropertyData;
import org.apache.chemistry.opencmis.commons.enums.*
import org.apache.chemistry.opencmis.commons.exceptions.*
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class CMISService {
	def grailsApplication
	def springSecurityService
	private Session session = null;
    def serviceMethod() {

    }
	def Session getSession() {
		if (session == null) {
			// default factory implementation
			SessionFactory factory = SessionFactoryImpl.newInstance();
			Map<String, String> parameter = new HashMap<String, String>();
			//def user = springSecurityService.currentUser
			def username = /*springSecurityService.isLoggedIn() ? springSecurityService.getPrincipal().username : */grailsApplication.config.grails.opencmis.alfresco.user
			def password = /*springSecurityService.isLoggedIn() ? springSecurityService.getPrincipal().password : */grailsApplication.config.grails.opencmis.alfresco.password
			
			// user credentials
			parameter.put(SessionParameter.USER, username);
			parameter.put(SessionParameter.PASSWORD, password);
			//parameter.put(SessionParameter.AUTH_HTTP_BASIC, false);

			// connection settings
			parameter.put(SessionParameter.ATOMPUB_URL, grailsApplication.config.grails.opencmis.alfresco.atomurl); // Uncomment for Atom Pub binding
			parameter.put(SessionParameter.BINDING_TYPE, BindingType.ATOMPUB.value()); // Uncomment for Atom Pub binding

			// Set the alfresco object factory
			// Used when using the CMIS extension for Alfresco for working with aspects
			parameter.put(SessionParameter.OBJECT_FACTORY_CLASS, "org.alfresco.cmis.client.impl.AlfrescoObjectFactoryImpl");

			List<Repository> repositories = factory.getRepositories(parameter);

			this.session = repositories.get(0).createSession();
		}
		return this.session;
	}
	
	def String getFolderId(String folderName) {
		if (!this.session){
			getSession()
		}
		String objectId = null;
		String queryString = "select cmis:objectId from cmis:folder where cmis:name = '" + folderName + "'";
		ItemIterable<QueryResult> results = getSession().query(queryString, false);
		for (QueryResult qResult : results) {
			objectId = qResult.getPropertyValueByQueryName("cmis:objectId");
		}
		return objectId;
	}
	
	def String getFolderIdFromPath(String folderPath) {
		if (!this.session){
			getSession()
		}
		Folder currentFolder = (Folder) this.session.getObjectByPath(folderPath)
		return currentFolder.getId();
	}
	
	def getChildren(String folderId) {
		if (!this.session){
			getSession()
		}
		Folder currentFolder = (Folder) this.session.getObject(folderId)
		def out = []
		currentFolder.getChildren().each{
			if (it.getBaseTypeId().value() == 'cmis:folder'){
				def arr = [:]
				arr.put('cmis:name',it.name)
				arr.put('cmis:objectId',it.getId())
				arr.put('docCount', getQueryResults("select cmis:objectId from cmis:document where in_folder('" + it.getId() +"')").size())
				arr.put('subfolderCount', getQueryResults("select cmis:objectId from cmis:folder where in_folder('" + it.getId() +"')").size())
				out.add(arr)
			}
		}
		return out;
	}
	
	def getQueryResults(String queryString, int pageSize = 10, int pageNum = 0) {
		if (!this.session){
			getSession()
		}
		def out = []
		ItemIterable<QueryResult> results = this.session.query(queryString, false)skipTo(pageNum).getPage(pageSize)
		
		results.each { hit ->
			def emptyArr = [:]
			hit.properties.each { 
				emptyArr.put(it.queryName.split(':')[1],it.firstValue)
				 }
			
			out.add(emptyArr)
		}
		//return results
		//System.out.println (out)
		return out
		
	}
	
	def createFolder(String folderName, String parentFolder, String folderTitle){
		if (!this.session){
			getSession()
		}
		Folder parent = (Folder) this.session.getObject(parentFolder)
		
		Map<String, Object> properties = new HashMap<String, Object>();
		properties.put(PropertyIds.OBJECT_TYPE_ID, "cmis:folder, P:cm:titled");
		properties.put(PropertyIds.NAME, folderName);
		properties.put("cm:title", "My Title");
		properties.put("cm:description", "My Folder");
		
		// create the folder
		try{
		Folder newFolder = parent.createFolder(properties);
		
		return newFolder.getId()
		}catch(CmisContentAlreadyExistsException e){
			return this.getFolderId(folderName)
		}
	}
	def getFolderParent(String folderId){
		if (!this.session){
			getSession()
		}
		def out = [:]
		Folder current = (Folder) this.session.getObject(folderId)
		Folder parent = current.getFolderParent()
		if (parent){
			out.put('cmis:path',parent.getPropertyValue('cmis:path'))
			out.put('cmis:objectId',parent.getId())
			out.put('isRoot',false)
		}else{
			Folder root = this.session.getRootFolder()
			out.put('cmis:path',root.getPropertyValue('cmis:path'))
			out.put('cmis:objectId',root.getId())
			out.put('isRoot',true)
		}
		return out
	}
	def getRootFolder(){
		if (!this.session){
			getSession()
		}
		return this.session.getRootFolder().getId()
		
	}
	def getFolder(String folderId){
		if (!this.session){
			getSession()
		}
		def out = [:]
		Folder current = (Folder) this.session.getObject(folderId)
		
		if (current){
			out.put('cmis:path',current.getPropertyValue('cmis:path'))
			out.put('cmis:objectId',current.getId())
			out.put('cmis:name',current.getPropertyValue('cmis:name'))
		}
		return out
		
	}
	def createDocument (String folderId, String description, CommonsMultipartFile content){
		if (!this.session){
			getSession()
		}
		Map<String, Object> properties = new HashMap<String, Object>();
		properties.put(PropertyIds.OBJECT_TYPE_ID, "cmis:document");
		properties.put(PropertyIds.NAME, content.getOriginalFilename());
		properties.put(PropertyIds.DESCRIPTION, description);
		
		InputStream stream = new ByteArrayInputStream(content.getBytes());
		ContentStream contentStream = this.session.getObjectFactory().createContentStream(content.getOriginalFilename(), content.getSize(), content.getContentType(), stream);
		Folder currentFolder = (Folder) this.session.getObject(folderId)
		// create a major version
		Document newDoc = currentFolder.createDocument(properties, contentStream, VersioningState.MAJOR);
		return newDoc.getId()
	}
	
	def getFolderHierarchy (String startingFolderId, List out = []){
		if (!this.session){
			getSession()
		}
		Folder current = (Folder) this.session.getObject(startingFolderId)
		if (current.getFolderParent() != null){
			//System.out.println "Folder: " + current.getName() + " : " + current.getId()
			out.add(getFolder(current.getFolderParent().getId()))
			getFolderHierarchy(current.getFolderParent().getId(), out)
		}
		return out.reverse()
	}
	
	def deleteDocument(String objectId){
		if (!this.session){
			getSession()
		}
		def success = false
		try {
			Document doc = (Document) this.session.getObject(objectId)
			doc.delete()
			success = true
		}catch(e) {
			return success.toString() + e
		}
		return success
	}
	def getDocument(String documentId){
		if (!this.session){
			getSession()
		}
		Document doc = (Document) this.session.getObject(documentId)
		InputStream stream = doc.getContentStream().getStream()
		return stream
	}
}
