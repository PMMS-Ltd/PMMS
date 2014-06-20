package uk.org.pmms

class Contract {
	String ref
	Date startDate
	Date endDate
	Supplier contractor
	SupplierType contractType
	Client client
	
	static belongsTo = [Client, Supplier]

    static constraints = {
		startDate blank: true
		endDate blank: true, nullable: true
    }
}
