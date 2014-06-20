package uk.org.pmms

class Supplier {
	static searchable = true
	String name
	Address address
	String accountNo
	String sortCode

	static hasMany = [employees: Person, workTypes: SupplierType, contracts: Contract]
    static constraints = {
		name blank: false
		accountNo blank: true, nullable: true
		sortCode blank: true, nullable: true
    }
}
