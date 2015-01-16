package uk.org.pmms.accounts

import grails.transaction.Transactional

import org.joda.time.*

import static java.math.RoundingMode.*
import uk.org.pmms.Client;

@Transactional
class ArrearsService {

    def serviceMethod() {

    }
	
	def arrearsByClient (Client clientInstance){
		def units = clientInstance.units
		def output = []
		units.eachWithIndex() {obj, i ->
			def emptyArr = [:]
			emptyArr.put('id',obj.id)
			emptyArr.put('propertyId',obj.propertyId)
			def month = currentMonth(obj.client.yearStart)
			def due = 0.00
			if (obj.serviceChargeType?.monthly == true)
				due = obj.serviceChargeType.currentCharge().monthlyAmount * month
			else if (obj.serviceChargeType?.quarterly == true)
				due = obj.serviceChargeType.currentCharge().quarterlyAmount * Math.ceil(month/3)
				
			else if (obj.serviceChargeType?.halfYearly == true)
				due = obj.serviceChargeType.currentCharge().halfYearlyAmount * Math.ceil(month/6)
			else if (obj.serviceChargeType?.annually == true)
				due = obj.serviceChargeType?.currentCharge()?.annualAmount
				
			def received = Transaction.findAllByPropertyIdAndTypeAndDateEnteredGreaterThan(obj,2,obj.client.yearStart).amount.sum()
			if (due == null){
				due = 0.00
			}
			if (received == null)
				received = 0.00
			emptyArr.put('received',received)
			emptyArr.put('due',due)
			emptyArr.put('owed',due-received)
			output.add(emptyArr)
		}
		return output
	}
	
	def currentMonth(Date yrStart) {
		
		if (yrStart.getDate()==1){
			
			return Months.monthsBetween(new LocalDate(yrStart.getYear()+1900, yrStart.getMonth()+1, yrStart.getDate()), new LocalDate().now()).getMonths()+1;
		}else{
		
			return Months.monthsBetween(new LocalDate(yrStart.getYear()+1900, yrStart.getMonth()+1, yrStart.getDate()), new LocalDate().now()).getMonths();
		}
	}
}