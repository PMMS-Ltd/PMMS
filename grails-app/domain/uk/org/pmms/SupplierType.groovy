package uk.org.pmms

class SupplierType implements Comparable {
	String type
	Integer typeParent

    static constraints = {
		typeParent blank: true, nullable: true
    }
	
	String toString(){
		return type
	}
	
	int compareTo(obj){
		type.compareTo(obj.type)
	}
}
