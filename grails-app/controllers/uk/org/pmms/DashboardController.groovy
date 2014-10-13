package uk.org.pmms

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class DashboardController {
	def springSecurityService
	
    def index() {
		def user = springSecurityService.principal
		render (view: 'user', model:[user:user])
	}
}
