package uk.org.pmms

class SiteVisit {
	static auditable = [ignore:['version','lastUpdated']]
	Client client
	Date visitStartDate
	Date visitEndDate
	String requester
	Boolean approved = false
	String approver
	Date approvalDate
	String status = "Draft"
	String details
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [jobs: Job]

    static constraints = {
		status inList: ["Draft","Approved","Complete","Closed"], display: false
		details maxSize: 500
		approved display: false
		approver display: false, blank: true, nullable: true
		requester display: false
		approvalDate nullable: true, display: false
    }
}
