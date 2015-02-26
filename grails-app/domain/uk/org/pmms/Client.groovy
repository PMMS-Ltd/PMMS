package uk.org.pmms

import uk.org.pmms.accounts.BankAccount;

class Client implements Comparable{
	static auditable = true
	String name
	String clientId
	Address address
	Date yearStart
	Date yearEnd
	String registrationNo
	Date registrationDate
	SortedSet units
	
	String repoFolderId
	String calendarId
	
	static hasMany = [units : Property, directors: Person, accounts: BankAccount]
	
    static constraints = {
		name blank: false, nullable: false, maxSize: 50
		clientId blank: false, nullable: false, minSize: 3, maxSize: 4, unique: true
		yearStart nullable: false
		yearEnd nullable: false
		registrationNo nullable: true, blank: true
		registrationDate nullable: true, blank: true
		repoFolderId display: false, nullable: true, blank: true
		calendarId nullable:true
    }
	
	String toString(){
		return clientId
	}
	
	int compareTo(obj){
		clientId.compareTo(obj.clientId)
	}
}
