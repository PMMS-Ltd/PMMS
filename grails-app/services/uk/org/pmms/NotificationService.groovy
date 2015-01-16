package uk.org.pmms

import grails.transaction.Transactional
import org.springframework.transaction.annotation.Transactional

@Transactional(readOnly = false)
class NotificationService {
	
	def eventNotify(params) {
		def notification = new Notification(recipient: params.recipient, sender: params.sender, message: params.message, type: params.type).save()
		
		//notification.save(flush: true, failOnError: true)
		params.notificationId = notification.id
		event([namespace: 'browser', topic: "docserver-${params.recipient}", data: params])
	}
}
