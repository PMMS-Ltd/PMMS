package uk.org.pmms

class BankAccount {
	String name
	Integer accNo
	Integer sortCode
	String type
	

    static constraints = {
		type inList: ['Current', 'Savings','Reserve']
    }
}
