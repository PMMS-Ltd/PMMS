import uk.org.pmms.*

class BootStrap {

    def init = { servletContext ->
	
	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

      def testUser = new User(username: 'user', password: 'password')
	  def adminUser = new User(username: 'admin', password: 'admin')
      testUser.save(flush: true)
	  adminUser.save(flush: true)

      UserRole.create testUser, userRole, true
	  UserRole.create adminUser, adminRole, true
	  UserRole.create adminUser, userRole, true

      assert User.count() == 2
      assert Role.count() == 2
      assert UserRole.count() == 3
	  
    }
    def destroy = {
    }
}
