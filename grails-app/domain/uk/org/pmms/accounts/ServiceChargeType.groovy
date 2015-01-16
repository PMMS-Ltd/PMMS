package uk.org.pmms.accounts
import uk.org.pmms.Client

class ServiceChargeType {
	String type
	String description
	
	Boolean monthly
	Boolean quarterly
	Boolean halfYearly
	Boolean annually
	
	SortedSet charges
	
	static belongsTo = [client: Client]
	static hasMany = [charges : ServiceCharge]

    static constraints = {
    }
	
	String toString() {
		return type
	}
	
	def currentCharge(){
		def today = new Date()
		return charges.find{it.startDate <= today && it.endDate > today}
	}
	def previousCharges(){
		def today = new Date()
		return charges.findAll{it.endDate < today}
	}
	def futureCharges(){
		def today = new Date()
		return charges.findAll{it.startDate > today}
	}
}
