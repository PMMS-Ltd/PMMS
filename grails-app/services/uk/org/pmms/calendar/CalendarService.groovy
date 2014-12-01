package uk.org.pmms.calendar

import grails.transaction.Transactional
import grails.plugins.rest.client.RestBuilder

@Transactional
class CalendarService {
	
	def rest = new RestBuilder()
	def calendarServerUrl = "http://localhost:8080/events-calendar"
    def serviceMethod() {

    }
	
	def createCalendar(params){
		System.out.println params
		def resp = rest.post(calendarServerUrl+"/calendar/save"){
			json{
				name = params.name
				color = params.color
				textColor = params.textColor
			}
		}
		if (resp.json != null){
			return resp.json
		}
		else if (resp.xml != null){
			return resp.xml
		}
		else {
			return resp.body
		}
	}
	
	def getEventCount(String calendarId){
		
		def resp = rest.get(calendarServerUrl+"/event/count/"+calendarId)
		return resp.body
		
	}
}
