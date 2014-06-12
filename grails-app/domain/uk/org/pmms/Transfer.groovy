package uk.org.pmms

class Transfer {

	Property prop
	Date dateInformed = new Date();
	String status = "New"
	String vSolicitor
	String vSolictorRef
	Date completionDate
	Person newOwner
	String folderId
	
	Date feeReceived
	Date copypackSent
	
    static constraints = {
		
		completionDate blank: true, nullable: true
		feeReceived blank: true, nullable: true
		copypackSent blank: true, nullable: true
		newOwner blank: true, nullable: true
		folderId blank:true, nullable: true, display: false
		dateInformed display: false
    }
}
