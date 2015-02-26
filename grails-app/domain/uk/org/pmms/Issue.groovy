package uk.org.pmms

class Issue {
	Client clientId
	String reporterName
	String reporterPhone
	String reporterEmail
	String issueDescription
	String status
	String assignedTo
	Job job
	
	Date dateCreated
	Date lastUpdated
	Date closedDate
	
	static hasMany = [notes: Note]
	
    static constraints = {
		issueDescription maxSize: 300
		status inList:["New","Open","AFI","Closed"]
		job nullable: true
		assignedTo nullable: true
		reporterEmail email: true
		closedDate nullable: true
    }
}
