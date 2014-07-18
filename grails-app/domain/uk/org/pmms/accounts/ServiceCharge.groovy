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
	
	String status

	static belongsTo = [serviceChargeType: ServiceChargeType]
	
    static constraints = {
		annualAmount nullable:true, blank: true
		halfYearlyAmount nullable:true, blank: true
		quarterlyAmount nullable:true, blank: true
		monthlyAmount nullable:true, blank: true
		status inList: ['Draft','Awaiting Approval','Approved','Applied']
    }
	
	int compareTo(obj){
		startDate.compareTo(obj.startDate)
	}
}
