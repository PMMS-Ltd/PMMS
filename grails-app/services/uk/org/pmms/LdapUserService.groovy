package uk.org.pmms

import grails.transaction.Transactional

@Transactional
class LdapUserService {

	def directoryService
	
    def getUsersByGroup(String groupName) {
		if (groupName){
			def approvers = directoryService.findGroupWhere('cn': groupName)
			def output = []
			approvers.uniqueMemberValues().each(){
				
				def person = directoryService.findPersonWhere('cn':it.substring(3).split(',')[0])
				/*def arr = [:]
				arr.put('uid', person.uid)
				arr.put('name', person.displayName)
				arr.put('email', person.mail)
				*/
				
				output.add(person.displayName)
			}
			System.out.println output
			return output
		}
	}
}
