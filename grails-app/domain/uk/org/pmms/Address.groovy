package uk.org.pmms

class Address {
	String unitNo
	String address1
	String address2
	String town
	String county
	String postCode
	String country = 'GB'
	
    static constraints = {
		unitNo minSize: 3, maxSize: 5, blank: true, nullable: true
		address1 maxSize: 50, nullable: false
		address2 maxSize: 50, nullable: true
		town nullable: true
		county nullable: true
		postCode nullable: false
    }
	
	String toString(){
		return unitNo + ', ' + address1 + ', ' + (address2 ? address2 + ', ' : '') + (town ? town + ', ' : '') + (county ? county + ', ' : '') + postCode + ', ' + country
	}
}
