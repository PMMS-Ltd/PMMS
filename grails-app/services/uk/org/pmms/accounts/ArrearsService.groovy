package uk.org.pmms.accounts

import grails.transaction.Transactional

import org.joda.time.*

import static java.math.RoundingMode.*
import uk.org.pmms.Client;
import uk.org.pmms.Property;

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
				
			def received = Transaction.findAllByPropertyIdAndTypeAndDateEnteredGreaterThanEquals(obj,2,obj.client.yearStart).amount.sum()
			def arrearsBF = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredLessThan(obj,[2,7,12],obj.client.yearStart).amount.sum()
			def additionalCharges = Transaction.findAllByPropertyIdAndTypeAndDateEnteredGreaterThan(obj,7,obj.client.yearStart).amount.sum()
			if (due == null){
				due = 0.00
			}
			if (arrearsBF == null){
				arrearsBF = 0.00
			}
			if (additionalCharges == null){
				additionalCharges = 0.00
			}
			if (received == null)
				received = 0.00
			
			emptyArr.put('received',received)
			emptyArr.put('due',due)
			emptyArr.put('owed',due-received-arrearsBF-additionalCharges)
			output.add(emptyArr)
		}
		return output
	}
	
	def arrearsByProperty (Property propertyInstance){
		
			def emptyArr = [:]
			def month = currentMonth(propertyInstance.client.yearStart)
			def due = 0.00
			if (propertyInstance.serviceChargeType?.monthly == true)
				due = propertyInstance.serviceChargeType.currentCharge().monthlyAmount * month
			else if (propertyInstance.serviceChargeType?.quarterly == true)
				due = propertyInstance.serviceChargeType.currentCharge().quarterlyAmount * Math.ceil(month/3)
				
			else if (propertyInstance.serviceChargeType?.halfYearly == true)
				due = propertyInstance.serviceChargeType.currentCharge().halfYearlyAmount * Math.ceil(month/6)
			else if (propertyInstance.serviceChargeType?.annually == true)
				due = propertyInstance.serviceChargeType?.currentCharge()?.annualAmount
				
			def received = Transaction.findAllByPropertyIdAndTypeAndDateEnteredGreaterThanEquals(propertyInstance,2,propertyInstance.client.yearStart).amount.sum()
			def arrearsBF = Transaction.findAllByPropertyIdAndTypeInListAndDateEnteredLessThan(propertyInstance,[2,7,12],propertyInstance.client.yearStart).amount.sum()
			def additionalCharges = Transaction.findAllByPropertyIdAndTypeAndDateEnteredGreaterThanAndDateEnteredLessThan(propertyInstance,7,propertyInstance.client.yearStart, propertyInstance.client.yearEnd).amount.sum()
			if (due == null){
				due = 0.00
			}
			if (arrearsBF == null){
				arrearsBF = 0.00
			}
			if (additionalCharges == null){
				additionalCharges = 0.00
			}
			if (received == null)
				received = 0.00
			
			emptyArr.put('received',received)
			emptyArr.put('due',due)
			emptyArr.put('arrears',arrearsBF)
			emptyArr.put('owed',due-received-arrearsBF-additionalCharges)
		
		return emptyArr
	}
	
	def currentMonth(Date yrStart) {
		
		if (yrStart.getDate()==1){
			
			return Months.monthsBetween(new LocalDate(yrStart.getYear()+1900, yrStart.getMonth()+1, yrStart.getDate()), new LocalDate().now()).getMonths()+1;
		}else{
		
			return Months.monthsBetween(new LocalDate(yrStart.getYear()+1900, yrStart.getMonth()+1, yrStart.getDate()), new LocalDate().now()).getMonths();
		}
	}
}