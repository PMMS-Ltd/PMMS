package uk.org.pmms

class Property {
	static searchable = true
	String propertyId
	Integer unitNo
	String address1
	String address2
	String town
	String county
	String postCode
	
	static belongsTo = [client: Client]
	
    static constraints = {
		propertyId blank: false, matches: "[A-Za-z0-9]{2,4}-\\w{1,3}-[0-9A-Z/]{3,5}"
		unitNo minSize: 3, maxSize: 5
		address1 maxSize: 50
		address2 maxSize: 50, nullable: true
		town blank: false
		county blank: false
		postCode blank: false
    }
	static mapping = {
        client lazy: false
    }
	
	String toString(){
		return propertyId
	}
}
