package uk.org.pmms.accounts

import uk.org.pmms.Client;
import uk.org.pmms.Property;
import uk.org.pmms.Supplier;

class Transaction {
	Client client
	Property propertyId
	Supplier supplier
	Integer type
	String nominalCode
	String jobId
	Date dateEntered = new Date()
	Date datePaid
	String invoiceNo
	String details
	Double amount
	Boolean reconciled = false
	Boolean paid = false
	Transaction paidBy
	String paymentType
	BankAccount bankAccount
	String grp

	static belongsTo = [client: Client, propertyId: Property, supplier: Supplier]
	
    static constraints = {
		type range: 1..18
		client nullable: false, blank:true
		jobId nullable: true
		propertyId nullable: true, blank:true
		supplier nullable: true, blank:true
		datePaid nullable: true, blank:true
		details nullable: true, blank: true
		invoiceNo nullable: true, blank: true
		paymentType inList: ['Online','Direct Debit','Standing Order','Cheque'], nullable: true, blank: true
		grp inList: ['BS','PL'], nullable: false, blank: true
		paidBy nullable: true, blank: true, display: false
		dateEntered display:false
		
    }
}
