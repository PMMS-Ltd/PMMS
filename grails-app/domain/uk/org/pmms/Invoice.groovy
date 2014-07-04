package uk.org.pmms

class Invoice {
	Supplier billTo
	Double total
	Double subTotal
	Double vat
	
	static hasMany = [invoiceItems : InvoiceItem]

    static constraints = {
    }
}
