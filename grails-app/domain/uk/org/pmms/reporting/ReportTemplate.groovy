package uk.org.pmms.reporting

class ReportTemplate {
	String name
	String parentObject
	String docServerTemplate
	
	static hasMany = [dataFields: DataField]

    static constraints = {
    }
}
