package uk.org.pmms

class Notification {
	
	String recipient
	Date dateCreated
	String type
	String message
	String sender
	Boolean messageRead = false

    static constraints = {
    }
}
