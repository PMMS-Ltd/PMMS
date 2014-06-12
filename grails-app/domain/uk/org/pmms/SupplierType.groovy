package uk.org.pmms

class SupplierType {
	String type
	Integer typeParent

    static constraints = {
		typeParent blank: true, nullable: true
    }
}
