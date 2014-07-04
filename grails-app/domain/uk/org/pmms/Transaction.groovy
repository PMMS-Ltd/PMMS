package uk.org.pmms

class Transaction {
	Client client
	Property propertyId
	Supplier supplier
	Integer type
	String nominalCode
	String jobId
	Date dateEntered
	Date datePaid
	String invoiceNo
	String details
	Double amount
	Boolean reconciled
	Boolean paid
	Transaction paidBy
	String paymentType
	Integer bankAccount
	String grp

	static belongsTo = [Client, Property, Supplier]
	
    static constraints = {
		type range: 1..18
		client nullable: true, blank:true
		jobId nullable: true
		propertyId nullable: true, blank:true
		supplier nullable: true, blank:true
		datePaid nullable: true, blank:true
		details nullable: true, blank: true
		paymentType inList: ['Online','Direct Debit','Standing Order','Cheque'], nullable: true, blank: true
		grp inList: ['BS','PL'], nullable: true, blank: true
		paidBy nullable: true, blank: true, display: false
		
    }
}
