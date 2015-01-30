package uk.org.pmms

import grails.plugin.springsecurity.annotation.Secured
import uk.org.pmms.task.Task

@Secured(['ROLE_USER'])
class DashboardController {
	def springSecurityService
	def TaskService
	
    def index() {
		def user = springSecurityService.principal
		def tasks = TaskService.getTodaysTasks(user.uid)
		def weekTasks = TaskService.getThisWeeksTasks(user.uid)
		def myVisits = SiteVisit.findAllByRequester(user.uid).size()
		render (view: 'user', model:[user:user, tasks: tasks, weekTasks: weekTasks, visits: myVisits])
	}
}
