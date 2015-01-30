package uk.org.pmms

import grails.transaction.Transactional
import org.springframework.transaction.annotation.Transactional

@Transactional(readOnly = false)
class NotificationService {
	def directoryService
	def mailService
	def approvalNotification() {
		def approvers = directoryService.findPeopleWhere(memberOf:'cn=approvers,ou=Groups,dc=test,dc=pmms,dc=org,dc=uk')
		
		approvers.each{
			def recipient = it.mail
			mailService.sendMail {
			  to recipient
			  subject "Approval Required"
			  html '<b>Please Approve</b> the following item:' 
			}
		}
	}
}
