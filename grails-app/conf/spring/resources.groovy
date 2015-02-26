// Place your Spring DSL code here
import grails.rest.render.json.*
import uk.org.pmms.accounts.BankAccount
import uk.org.pmms.marshaller.CustomMarshaller

beans = {
	/*bankAccountRenderer(JsonRenderer, BankAccount) {
		excludes = ['class']
	}*/
	myCustomMarshallerRegistrar(CustomMarshaller)
}
