package uk.org.pmms

class Contract {
	String ref
	Date startDate
	Date endDate
	Supplier contractor
	SupplierType contractType
	
	static belongsTo = [client: Client]

    static constraints = {
		startDate blank: true
		endDate blank: true, nullable: true
    }
}
