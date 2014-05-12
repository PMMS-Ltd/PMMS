package uk.org.pmms

class Client {
	static searchable = true
	String name
	String clientId
	Date yearStart
	Date yearEnd
	String accountName
	Integer accountNo
	
	static hasMany = [units : Property]
	
    static constraints = {
		name blank: false, nullable: false, maxSize: 50
		clientId blank: false, nullable: false, minSize: 3, maxSize: 4, unique: true
		yearStart nullable: false
		yearEnd nullable: false
		accountName nullable: false, maxSize: 50
		accountNo nullable: false, unique: true, minSize: 8, maxSize: 16
    }
	
	String toString(){
		return clientId
	}
}
