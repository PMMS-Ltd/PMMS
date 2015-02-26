package uk.org.pmms

class Contract {
	static auditable = [ignore:['version','lastUpdated','repoFolderId', 'notes']]
	String ref
	Date startDate
	Date endDate
	Supplier contractor
	SupplierType contractType
	Client client
	String repoFolderId
	Frequency frequencyOfService
	String usualDay
	Frequency billingFrequency
	Double contractAmount
	Integer nominalCode
	Date nextReviewDate
	Date dateCreated
	Date lastUpdated
	//SortedSet notes
	
	static belongsTo = [Client, Supplier]
	static hasMany = [notes: Note]

    static constraints = {
		startDate blank: true
		endDate blank: true, nullable: true
		usualDay blank: true, inList: ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'], nullable: true
		repoFolderId blank: true, nullable: true, display: false
		frequencyOfService nullable: true
		billingFrequency nullable: true
		nominalCode nullable: true
		
		
    }
	
	private enum Frequency{
		BiWeekly('Bi-Weekly'),
		Weekly('Weekly'),
		Fortnightly('Fortnightly'),
		Monthly('Monthly'),
		BiMonthly('Bi-Monthly'),
		Quarterly('Quaterly'),
		HalfYearly('Half Yearly'),
		Annually('Annually'),
		BiAnnually('Bi-Annually')
		
		final String value
		
			Frequency(String value) { this.value = value }
		
			String toString() { value }
			String getKey() { name() }
	}
}
