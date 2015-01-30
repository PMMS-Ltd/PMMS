package uk.org.pmms

class Note implements Comparable{

	String noteUser
	String noteBody
	String noteType
	Date dateCreated
	
	static hasMany = [attachments: String]
    static constraints = {
		noteType inList: ['Public','Private']
    }
	
	int compareTo(obj){
		dateCreated.compareTo(obj.dateCreated)
	}
}
