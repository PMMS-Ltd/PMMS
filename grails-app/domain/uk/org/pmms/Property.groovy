package uk.org.pmms
import uk.org.pmms.accounts.ServiceChargeType

class Property implements Comparable{
	static searchable = true
	String propertyId
	Address address
	Person owner
	String propertyType
	String repoFolderId
	
	ServiceChargeType serviceChargeType
	
	static belongsTo = [client: Client]
	
    static constraints = {
		propertyId blank: false, matches: "[A-Za-z0-9]{2,4}-\\w{1,3}-[0-9A-Z_]{3,5}", unique: true
		repoFolderId display: false, nullable: true, blank: true
		owner nullable: true
		propertyType inList: ["Studio Flat","1 Bed Flat", "2 Bed Flat", "3 Bed Flat", "Maisonette", "House","Other"]
		serviceChargeType nullable: true
    }
	static mapping = {
        client lazy: false
    }
	
	String toString(){
		return propertyId
	}
	int compareTo(obj){
		propertyId.compareTo(obj.propertyId)
	}
}
