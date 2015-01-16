package uk.org.pmms.accounts
import uk.org.pmms.Supplier

class BankAccount {
	String name
	Integer accNo
	Integer sortCode
	String type
	Supplier bankBranch
	

    static constraints = {
		accNo unique: true
		type inList: ['Current', 'Savings','Reserve']
		bankBranch nullable:true, blank:true
    }
	
	String toString() {
		return accNo
	}
}
