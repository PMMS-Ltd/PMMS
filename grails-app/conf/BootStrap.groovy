import uk.org.pmms.*
import uk.org.pmms.accounts.*
class BootStrap {

    def init = { servletContext ->
	
	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

      def testUser = new User(username: 'user', password: 'password', firstName: 'Test', lastName: 'Test', email: 'test@test.com')
	  def adminUser = new User(username: 'admin', password: 'admin', firstName: 'System', lastName: 'Admin', email: 'admin@test.com')
      testUser.save(flush: true)
	  adminUser.save(flush: true)

      UserRole.create testUser, userRole, true
	  UserRole.create adminUser, adminRole, true
	  UserRole.create adminUser, userRole, true

      assert User.count() == 2
      assert Role.count() == 2
      assert UserRole.count() == 3
	  
	  def sp = new SupplierType(type:'Maintenance').save()
	  def sp2 = new SupplierType(type:'Cleaning', typeParent: sp.id).save()
	  def sp3 = new SupplierType(type:'Gardening', typeParent: sp.id).save()
	  def sp4 = new SupplierType(type:'Window Cleaning', typeParent: sp.id).save()
	  def sp5 = new SupplierType(type:'Bulk Waste Removal', typeParent: sp.id).save()
	  
	  def client = new Client(name:'Turnpike Hill Trust',yearStart: new Date(2014,1,1,0,0,0), yearEnd: new Date(2014,12,31,0,0,0), clientId: 'THT')
	  def address = new Address(address1: 'Leyburn Gardens', town: 'Croydon', county: 'Surrey', postCode: 'CR0 5NL', country: 'GB').save()
	  def ba = new BankAccount(accNo: 123456789, name: 'THT Clients Account', sortCode: 200557, type: 'Current').save()
	  client.address = address
	  client.addToAccounts(ba)
	  client.save flush: true
	  
	  def scType = new ServiceChargeType(type: '1Bed', description: '1 Bedroom Flat', client: client, serviceCharge: 1000.00, groundRent: 0.00, monthly: true, quarterly: true, halfYearly: true, annually: true).save()
	  
	  def property = new Property(propertyId: 'THT-LG-001', propertyType: 'Studio Flat', serviceChargeType: scType)
	  property.address = new Address(unitNo: '1', address1: 'Leyburn Gardens', town: 'Croydon', county: 'Surrey', postCode: 'CR0 5NL', country: 'GB')
	  client.addToUnits(property).save(failOnError: true)
	  
	  def supplier = new Supplier(name: 'Flat Maintenance Services', accountNo: 123456789, sortCode: '20-05-57')
	  supplier.address = new Address(unitNo: '52', address1: 'Brockenhurst Way', town: 'Norbury', county: 'London', postCode: 'SW16 4UD', country: 'GB')
	  supplier.addToWorkTypes(sp2)
	  supplier.addToWorkTypes(sp3)
	  supplier.addToWorkTypes(sp4)
	  supplier.addToWorkTypes(sp5)
	  supplier.save flush: true
	  
	  def person = new Person (firstName: 'Jonathan', initial: 'J', lastName: 'Lee', address: supplier.address).save(failOnError: true)
	  
	  supplier.addToEmployees(person).save()
	  property.owner = person; property.save()
	  client.addToDirectors(person).save()
	  
    }
    def destroy = {
    }
}
