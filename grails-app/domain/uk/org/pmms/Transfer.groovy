package uk.org.pmms

class Transfer {
	
	static auditable = [ignore:['version','lastUpdated','repoFolderId']]
	Property prop
	Date dateCreated
	String status = "New"
	Supplier vSolicitor
	String vSolictorRef
	Date completionDate
	Person newOwner
	String repoFolderId
	
	Date feeReceived
	Date copypackSent
	Date lastUpdated
	
	static hasMany = [invoices: Invoice]
    static constraints = {
		
		completionDate blank: true, nullable: true
		feeReceived blank: true, nullable: true
		copypackSent blank: true, nullable: true
		newOwner blank: true, nullable: true
		repoFolderId blank:true, nullable: true, display: false
		dateCreated display: false
    }
	
	static mapping = {
		autoTimestamp true
	}
}
