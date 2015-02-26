package uk.org.pmms

import grails.transaction.Transactional
import org.springframework.transaction.annotation.Transactional


@Transactional(readOnly = false)
class NotificationService {
	def directoryService
	def mailService
	def grailsApplication
	
	def getGroupMemberEmails(String groupName) {
		if (groupName){
			def approvers = directoryService.findGroupWhere('cn': groupName)
			def output = []
			approvers.uniqueMemberValues().each(){
				
				def person = directoryService.findPersonWhere('cn':it.substring(3).split(',')[0])
				def arr = [:]
				arr.put('uid', person.uid)
				arr.put('name', person.displayName)
				arr.put('email', person.mail)
				
				output.add(arr)
			}
			return output
		}
	}
	
	def approvalNotification(String objectId) {
		def approvers = getGroupMemberEmails("APPROVERS")
		def sv = SiteVisit.get(objectId)
		approvers.each{
			def recipient = it.email
			def approver = it.name
			mailService.sendMail {
			  to recipient
			  subject "Approval Required - Site Visit"
			  //subject "PMMS Approval Required - Site Visit"
			body(
				 view: "/notifications/approval",
				 model: [sv: sv, approver: approver, url: grailsApplication.config.grails.serverURL]
				)
			}
		}
	}
	def getServerUrl() {
		
		return grailsApplication.config.grails.serverURL
	}
}
