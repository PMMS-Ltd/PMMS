package uk.org.pmms

class InvoiceItem {
	
	String description
	Double unitCost
	Integer quantity = 1
	Double lineTotal
	
	static belongsTo = [invoice : Invoice]
	
    static constraints = {
    }
}
