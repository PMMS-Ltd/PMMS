package uk.org.pmms.task

import grails.transaction.Transactional
import org.joda.time.*
@Transactional
class TaskService {

    def getTodaysTasks(String assignee){
		def localDate = new LocalDate(new DateTime())
		def results =  Task.withCriteria {
			eq ('assignedToUID',assignee)
			between ('dueDate',localDate.toDateTimeAtStartOfDay().toDate(), localDate.plusDays(1).toDateTimeAtStartOfDay().toDate())
		}
		return results
	}
	def getThisWeeksTasks(String assignee){
		def weekNumber = new DateTime().getWeekOfWeekyear()
		DateTime weekStartDate = new DateTime().withWeekOfWeekyear(weekNumber).withDayOfWeek(1).withHourOfDay(0).withMinuteOfHour(0);
		DateTime weekEndDate = new DateTime().withWeekOfWeekyear(weekNumber + 1).withDayOfWeek(1).withHourOfDay(0).withMinuteOfHour(0);
		
		def results =  Task.withCriteria {
			eq ('assignedToUID',assignee)
			between ('dueDate',weekStartDate.toDate(), weekEndDate.toDate())
		}
		return results
	}
	def getNextWeeksTasks(String assignee){
		def weekNumber = new DateTime().getWeekOfWeekyear()+1
		DateTime weekStartDate = new DateTime().withWeekOfWeekyear(weekNumber).withDayOfWeek(1).withHourOfDay(0).withMinuteOfHour(0);
		DateTime weekEndDate = new DateTime().withWeekOfWeekyear(weekNumber + 1).withDayOfWeek(1).withHourOfDay(0).withMinuteOfHour(0);
		
		def results =  Task.withCriteria {
			eq ('assignedToUID',assignee)
			between ('dueDate',weekStartDate.toDate(), weekEndDate.toDate())
		}
		return results
	}
}
