package uk.org.pmms.reporting

class DataField {
	String name
	String parentClass
		
    static constraints = {
    }
	
	String toString(){
		return parentClass + " : "+name
	}
}
