package uk.org.pmms.accounts

import org.springframework.cache.config.CacheAdviceParser.Props;
import uk.org.pmms.Property
import uk.org.pmms.Client

import grails.transaction.Transactional

@Transactional
class ServiceChargeService {

    def applyServiceCharge(ServiceCharge svc) {
		if (svc.status == 'Approved'){
			
			def props = Property.findAllByServiceChargeType(svc.serviceChargeType)	
			def client = props[0].client
			def propertyCount = props.size()
			//Create global type 8 (SCC)
			def sccTransaction = new Transaction(client: svc.serviceChargeType.client, type: 8, nominalCode: 760, details: 'Service Charge - '+svc.serviceChargeType.description+', ' + svc.startDate.format('dd/MM/yyyy')+' - '+svc.endDate.format('dd/MM/yyyy'), dateEntered: svc.startDate, amount: svc.serviceCharge * propertyCount, grp: 'BS', bankAccount: client.accounts[0]).save(failOnError: true)
			//Create global type 10 (GRTC)
			if (svc.groundRent > 0.00)
			def grtcTransaction = new Transaction(client: svc.serviceChargeType.client, type: 10, nominalCode: 770, details: 'Ground Rent - '+svc.serviceChargeType.description+', ' + svc.startDate.format('dd/MM/yyyy')+' - '+svc.endDate.format('dd/MM/yyyy'), dateEntered: svc.startDate, amount: svc.groundRent * propertyCount, grp:'BS', bankAccount: client.accounts[0]).save(failOnError: true)
			
			
			props.each(){
				//Create type 7 per property (SVC)
				def svcPropTransaction = new Transaction(client: it.client, type: 7, nominalCode: 760, details: 'Service Charge, ' + svc.startDate.format('dd/MM/yyyy')+' - '+svc.endDate.format('dd/MM/yyyy'), dateEntered: svc.startDate, amount: svc.serviceCharge * -1, grp: 'PL', bankAccount: client.accounts[0], propertyId: it).save()
				//Create type 9 per property (GRT)
				if (svc.groundRent > 0.00)
				def grtPropTransaction = new Transaction(client: it.client, type: 9, nominalCode: 770, details: 'Ground Rent, ' + svc.startDate.format('dd/MM/yyyy')+' - '+svc.endDate.format('dd/MM/yyyy'), dateEntered: svc.startDate, amount: svc.groundRent * -1, grp: 'PL', bankAccount: client.accounts[0], propertyId: it).save()
			}
			svc.status = 'Applied'
			
			svc.save()
		}else{
			return 'Error: Service Charge is not approved so could not be applied!'
		}
	}
}
