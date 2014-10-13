// Place your Spring DSL code here
import grails.rest.render.json.*
import uk.org.pmms.accounts.BankAccount
beans = {
	bankAccountRenderer(JsonRenderer, BankAccount) {
		excludes = ['class']
	}
}
