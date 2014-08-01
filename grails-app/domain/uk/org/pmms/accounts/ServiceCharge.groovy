package uk.org.pmms.accounts

class ServiceCharge implements Comparable {
	Double serviceCharge
	Double groundRent
	
	Double annualAmount
	Double halfYearlyAmount
	Double quarterlyAmount
	Double monthlyAmount
	
	Date startDate
	Date endDate
	
	String status = 'Draft'

	static belongsTo = [serviceChargeType: ServiceChargeType]
	
    static constraints = {
		annualAmount display: false, nullable: true
		halfYearlyAmount display:false, nullable: true
		quarterlyAmount display:false, nullable: true
		monthlyAmount display: false, nullable: true
		status inList: ['Draft','Awaiting Approval','Approved','Applied']
    }
	
	int compareTo(obj){
		startDate.compareTo(obj.startDate)
	}
	
	def beforeInsert() {
		annualAmount = serviceCharge + groundRent
		halfYearlyAmount = (serviceCharge + groundRent)/2
		quarterlyAmount = (serviceCharge + groundRent)/4
		monthlyAmount = (serviceCharge + groundRent)/12
	 }
}
