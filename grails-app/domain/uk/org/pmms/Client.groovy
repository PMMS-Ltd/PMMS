package uk.org.pmms

class Client {
	static searchable = true
	String name
	String clientId
	Address address
	Date yearStart
	Date yearEnd
	String accountName
	Integer accountNo
	String registrationNo
	Date registrationDate
	
	String repoFolderId
	
	static hasMany = [units : Property, directors: Person]
	
    static constraints = {
		name blank: false, nullable: false, maxSize: 50
		clientId blank: false, nullable: false, minSize: 3, maxSize: 4, unique: true
		yearStart nullable: false
		yearEnd nullable: false
		accountName nullable: false, maxSize: 50
		accountNo nullable: false, unique: true, minSize: 8, maxSize: 16
		registrationNo nullable: true, blank: true
		registrationDate nullable: true, blank: true
		repoFolderId display: false, nullable: true, blank: true
    }
	
	String toString(){
		return clientId
	}
}
