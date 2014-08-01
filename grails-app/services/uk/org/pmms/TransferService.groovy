package uk.org.pmms

import grails.transaction.Transactional

@Transactional
class TransferService {

    def serviceMethod() {

    }
	
	def createCopyPackInvoice(Transfer transferInstance) {
		
		//1. Create new invoice from PMMS to vSolicitor and set balance to 0.00
			def cpInvoice = new Invoice(billTo: transferInstance.vSolicitor, total: 156.00, subTotal: 130.00, vat: 26.00, balance: 0.00).save(failOnError: true)
				
		//2. Add invoiceItem for copy pack
			cpInvoice.addToInvoiceItems(new InvoiceItem(description: 'Resales Copy Pack', unitCost: 130.00, lineTotal: 130.00, invoice: cpInvoice).save(flush:true, failOnError: true))
		
		//3. Set transferInstance.feeReceieved to current date
			transferInstance.feeReceived = new Date()
		//4. Add invoice to transfer
			transferInstance.addToInvoices(cpInvoice)
		//5. Save updated transfer
			transferInstance.save(flush:true)
	}
	
	def getTransfersByClient(Client client) {
		def c = Transfer.createCriteria()
		def results = c.list {
			prop {
				eq 'client', client
			}
		}
		return results
	}
}
