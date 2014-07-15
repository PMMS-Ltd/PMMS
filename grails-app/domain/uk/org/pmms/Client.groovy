package uk.org.pmms

class Client {
	static searchable = true
	String name
	String clientId
	Address address
	Date yearStart
	Date yearEnd
	String registrationNo
	Date registrationDate
	SortedSet units
	
	String repoFolderId
	
	static hasMany = [units : Property, directors: Person, accounts: BankAccount]
	
    static constraints = {
		name blank: false, nullable: false, maxSize: 50
		clientId blank: false, nullable: false, minSize: 3, maxSize: 4, unique: true
		yearStart nullable: false
		yearEnd nullable: false
		registrationNo nullable: true, blank: true
		registrationDate nullable: true, blank: true
		repoFolderId display: false, nullable: true, blank: true
    }
	
	String toString(){
		return clientId
	}
}
