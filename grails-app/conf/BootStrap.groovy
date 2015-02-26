import uk.org.pmms.*
import uk.org.pmms.accounts.*
import uk.org.pmms.accounts.ServiceChargeService

import java.text.DateFormat
import java.text.SimpleDateFormat
import grails.util.Environment
import grails.converters.JSON

class BootStrap {
	def ServiceChargeService
    def init = { servletContext ->
	
	  if (Environment.current == Environment.DEVELOPMENT){
	  DateFormat df = new SimpleDateFormat("yyyy-MM-dd")
	  //def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      //def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

     // def testUser = new User(username: 'user', password: 'password', firstName: 'Test', lastName: 'Test', email: 'test@test.com')
	 // def adminUser = new User(username: 'admin', password: 'admin', firstName: 'System', lastName: 'Admin', email: 'admin@test.com')
     // testUser.save(flush: true)
	 // adminUser.save(flush: true)

     // UserRole.create testUser, userRole, true
	 // UserRole.create adminUser, adminRole, true
	 // UserRole.create adminUser, userRole, true

      //assert User.count() == 2
     // assert Role.count() == 2
     // assert UserRole.count() == 3
	  
	  def sp = new SupplierType(type:'Maintenance').save()
	  def sp2 = new SupplierType(type:'Cleaning', typeParent: sp.id).save()
	  def sp3 = new SupplierType(type:'Gardening', typeParent: sp.id).save()
	  def sp4 = new SupplierType(type:'Window Cleaning', typeParent: sp.id).save()
	  def sp5 = new SupplierType(type:'Bulk Waste Removal', typeParent: sp.id).save()
	  def sp6 = new SupplierType(type:'Solicitor').save()
	  
	  def client = new Client(name:'Turnpike Hill Trust',yearStart: df.parse('2015-01-01'), yearEnd: df.parse('2015-12-31'), clientId: 'THT')
	  def address = new Address(address1: 'Leyburn Gardens', town: 'Croydon', county: 'Surrey', postCode: 'CR0 5NL', country: 'GB').save()
	  def ba = new BankAccount(accNo: 123456789, name: 'THT Clients Account', sortCode: 200557, type: 'Current').save(failOnError: true)
	  def ba2 = new BankAccount(accNo: 987654321, name: 'PMMS Ltd. Trading Account', sortCode: 200557, type: 'Current').save()
	  client.address = address
	  client.addToAccounts(ba)
	  client.save flush: true
	  
	  assert Client.count() == 1
	  
	  def scType = new ServiceChargeType(type: '1Bed', description: '1 Bedroom Flat', client: client, monthly: false, quarterly: false, halfYearly: false, annually: true).save flush: true
	  def serviceCharge = new ServiceCharge(serviceCharge: 690.00, groundRent: 0.00, startDate: client.yearStart, endDate:  client.yearEnd, serviceChargeType: scType, status: 'Approved').save(failOnError: true)	  
	  def serviceCharge2 = new ServiceCharge(serviceCharge: 750.00, groundRent: 0.00, startDate: client.yearStart.plus(365), endDate:  client.yearEnd.plus(365), serviceChargeType: scType, status: 'Approved').save(failOnError: true)
	  
	  def property = new Property(propertyId: 'THT-LG-001', propertyType: 'Studio Flat', serviceChargeType: scType, repoFolderId: '2e9ea49c-2a5f-481f-9755-749a0ffaabc0')
	  property.address = new Address(unitNo: '1', address1: 'Leyburn Gardens', town: 'Croydon', county: 'Surrey', postCode: 'CR0 5NL', country: 'GB')
	  client.addToUnits(property).save(failOnError: true)
	  
	  ServiceChargeService.applyServiceCharge(serviceCharge)
	  
	  def supplier = new Supplier(name: 'Flat Maintenance Services', accountNo: 123456789, sortCode: '20-05-57')
	  supplier.address = new Address(unitNo: '52', address1: 'Brockenhurst Way', town: 'Norbury', county: 'London', postCode: 'SW16 4UD', country: 'GB')
	  supplier.addToWorkTypes(sp2)
	  supplier.addToWorkTypes(sp3)
	  supplier.addToWorkTypes(sp4)
	  supplier.addToWorkTypes(sp5)
	  supplier.save flush: true
	  
	  def person = new Person (salutation: 'Mr', firstName: 'Jonathan', initial: 'J', lastName: 'Lee', address: supplier.address).save(failOnError: true)
	  
	  supplier.addToEmployees(person).save()
	  property.owner = person; property.save()
	  client.addToDirectors(person).save()
	  }
	  JSON.registerObjectMarshaller(SiteVisit) {
		  def output = [:]
		  output['id'] = it.id
		  output['title'] = it.client.clientId + ' - ' + it.details
		  output['start'] = it.visitStartDate
		  output['end'] = it.visitEndDate
		  output['allDay'] = false
		  output['editable'] = false
		  
		  //output['textColor'] = it.calendar.textColor
		  output['className'] = 'status-'+it.status.replace(' ', '-').toLowerCase()
	  
		  return output;
	  }
    }
    def destroy = {
    }
}
