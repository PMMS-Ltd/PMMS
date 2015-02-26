package uk.org.pmms

class Job {
	static auditable = [ignore:['version','lastUpdated','repoFolderId','notes']]
	String enteredBy
	String assignedTo
	Client client
	String faultLocation
	String faultDetails
	String priority = "Normal"
	String repoFolderId
	String status = "New"
	Supplier contractor
	Person reportedBy
	Boolean requiresSV = false
	//SiteVisit siteVisit
	SupplierType category
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [notes: Note, issues: Issue]
		
    static constraints = {
		status inList: ["New", "Allocated", "Declined","In Progress","Work Complete", "Invoice Received", "Awaiting Payment","Closed","Awaiting Further Info"] 
		repoFolderId nullable: true, blank: false, display: false
		contractor nullable: true, blank: true
		//siteVisit nullable: true
		priority inList: ["Emergency","High","Normal","Low"]
		
    }
	
	def beforeInsert() {
		if (status == "New" && contractor)
		status = "Allocated"
	}
	def beforeUpdate() {
		if (status == "New" && contractor)
		status = "Allocated"
	}
}
