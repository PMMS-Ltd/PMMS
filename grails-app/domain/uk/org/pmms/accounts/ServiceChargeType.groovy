package uk.org.pmms.accounts
import uk.org.pmms.Client

class ServiceChargeType {
	String type
	String description
	Double serviceCharge
	Double groundRent
	
	Boolean monthly
	Boolean quarterly
	Boolean halfYearly
	Boolean annually
	
	static belongsTo = [client: Client]

    static constraints = {
    }
	
	String toString() {
		return type
	}
}
