package uk.org.pmms

class Job {
	String enteredBy
	String assignedTo
	Client client
	String faultLocation
	String faultDetails
	String priority
	String repoFolderId
	String status = "New"
	Supplier contractor
	Person reportedBy
	Boolean requiresSV = false
	SiteVisit siteVisit
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [notes: Note, issues: Issue]
		
    static constraints = {
		status inList: ["New", "Open", "Awaiting Further Info","Pending","Closed"], blank: true, nullable: false, display: false
		repoFolderId nullable: true, blank: false, display: false
		contractor nullable: true, blank: true
		siteVisit nullable: true
		
    }
}
