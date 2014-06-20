package uk.org.pmms

class Address {
	static searchable = true
	String unitNo
	String address1
	String address2
	String town
	String county
	String postCode
	String country = 'GB'
	
	static hasMany = [persons: Person, clients: Client, suppliers: Supplier, myProperties: Property]
	static belongsTo = [Person, Client, Supplier, Property]
	static constraints = {
		unitNo maxSize: 5, blank: true, nullable: true
		address1 maxSize: 50
		address2 maxSize: 50, nullable: true
		town nullable: true
		county nullable: true
		postCode nullable: false
	}
	
	String toString(){
		return (unitNo ? unitNo : '') + ' ' + address1 + ', ' + (address2 ? address2 + ', ' : '') + (town ? town + ', ' : '') + (county ? county + ', ' : '') + postCode + ', ' + country
	}
}
