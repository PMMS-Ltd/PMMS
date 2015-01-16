package uk.org.pmms

class Invoice {
	Supplier billTo
	Double total
	Double subTotal
	Double vat
	Double balance
	
	static hasMany = [invoiceItems : InvoiceItem]

    static constraints = {
    }
	String toString(){
		return "Invoice: "+id+" totalling £"+total
	}
}
