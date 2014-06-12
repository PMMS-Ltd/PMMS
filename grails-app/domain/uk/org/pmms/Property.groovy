package uk.org.pmms

class Property {
	static searchable = true
	String propertyId
	Address address
	Person owner
	
	String repoFolderId
	
	static belongsTo = [client: Client]
	
    static constraints = {
		propertyId blank: false, matches: "[A-Za-z0-9]{2,4}-\\w{1,3}-[0-9A-Z/]{3,5}", unique: true
		repoFolderId display: false, nullable: true, blank: true
		owner nullable: true
    }
	static mapping = {
        client lazy: false
    }
	
	String toString(){
		return propertyId
	}
}
