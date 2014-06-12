package uk.org.pmms

class Person {
	String salutation
	String firstName
	String lastName
	String initial
	
	Address address
	String phone1
	String phone2
	String phone3
	
	PhoneType phone1Type
	PhoneType phone2Type
	PhoneType phone3Type
	
	String email1
	String email2
	
	EmailType email1Type
	EmailType email2Type
	
    static constraints = {
		salutation nullable: true
		firstName nullable: true
		initial nullable: true
		lastName nullable: false
			
		email1 email : true, nullable: true
		email1Type nullable: true
		email2 email : true, nullable: true
		email2Type nullable: true
		phone1 nullable: false
		phone1Type nullable: false
		phone2 nullable: true
		phone2Type nullable: true
		phone3 nullable: true
		phone3Type nullable: true
    }
	
	private enum PhoneType{
		HOME('Home'),
		WORK('Work'),
		MOBILE('Mobile')
		
		final String value
		
			PhoneType(String value) { this.value = value }
		
			String toString() { value }
			String getKey() { name() }
	}
	
	private enum EmailType{
		PERSONAL('Personal'),
		WORK('Work')
		
		final String value
		
			EmailType(String value) { this.value = value }
		
			String toString() { value }
			String getKey() { name() }
	}
	
	String toString(){
		return salutation + ". " + firstName + " " + initial + " " + lastName
	}
}
