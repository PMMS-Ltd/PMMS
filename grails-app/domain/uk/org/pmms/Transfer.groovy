package uk.org.pmms

class Transfer {

	Property prop
	Date dateInformed = new Date();
	String status = "New"
	Supplier vSolicitor
	String vSolictorRef
	Date completionDate
	Person newOwner
	String repoFolderId
	
	Date feeReceived
	Date copypackSent
	
    static constraints = {
		
		completionDate blank: true, nullable: true
		feeReceived blank: true, nullable: true
		copypackSent blank: true, nullable: true
		newOwner blank: true, nullable: true
		repoFolderId blank:true, nullable: true, display: false
		dateInformed display: false
    }
}
