package uk.org.pmms.accounts

import grails.transaction.Transactional

import org.joda.time.*

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
				due = obj.serviceChargeType.currentCharge().quarterlyAmount * round(month/4,0)
			else if (obj.serviceChargeType?.quarterly == true)
				due = obj.serviceChargeType.currentCharge().halfYearlyAmount * round(month/6,0)
			else
				due = obj.serviceChargeType?.currentCharge()?.annualAmount
			//((obj.serviceChargeType.charges[0].serviceCharge + obj.serviceChargeType.charges[0].groundRent)/12) * month
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
			return Months.monthsBetween(new LocalDate(yrStart.getYear()+1900, yrStart.getMonth()+1, yrStart.getDate()), new LocalDate().now()).getMonths();
		}else{
			return Months.monthsBetween(new LocalDate(yrStart.getYear()+1900, yrStart.getMonth()+1, yrStart.getDate()), new LocalDate().now()).getMonths() -1;
		}
	}
}