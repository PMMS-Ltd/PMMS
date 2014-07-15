
<%@ page import="uk.org.pmms.Invoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="col-lg-5 col-xs-12">
		<div class="row">
			<div class="col-xs-8">
				<img
					src="http://pmmsorg.users37.interdns.co.uk/wordpress/wp-content/uploads/2013/08/Logo.png"
					width="100%" />
			</div>
			<div class="col-xs-4 text-right">
				<h1>INVOICE<br/>
				
					<small>#<g:formatNumber
							number="${invoiceInstance?.id}" minIntegerDigits="6"/></small>
				</h1>
				<h3>
					<small><g:formatDate date="${new Date()}" format="dd/MM/yyyy"/></small>
				</h3>
			</div>
		</div>
		<div class="row">
        <div class="col-xs-5">
          <div class="panel panel-default">
                  <div class="panel-heading"><h3 class="panel-title">From</h3></div>
                  <div class="panel-body">
                    <p class="text-left">
                    	<strong>PMMS Ltd.</strong><br />
                    	Ground Floor Sidda House<br />
                    	350 Lower Addiscombe Road<br />
                    	Croydon<br />
                    	Surrey<br />
                    	CR9 7AX<br />
                    </p>
                  </div>
                </div>
        </div>
        <div class="col-xs-5 pull-right text-right">
          <div class="panel panel-default">
                  <div class="panel-heading">
                    <h3 class="panel-title">To</h3>
                  </div>
                  <div class="panel-body">
                    <p>
                      <strong>${invoiceInstance?.billTo?.name}</strong><br />
                      ${invoiceInstance?.billTo?.address?.unitNo} ${invoiceInstance?.billTo?.address?.address1}<br />
                      ${invoiceInstance?.billTo?.address?.address2}<br />
                      ${invoiceInstance?.billTo?.address?.town}<br />
                      ${invoiceInstance?.billTo?.address?.county}<br />
                      ${invoiceInstance?.billTo?.address?.postCode}<br />
                    </p>
                  </div>
                </div>
        </div>
      </div> <!-- / end client details section -->
      
      <table class="table table-bordered col-xs-12" style="margin-top: 25px;">
        <thead>
          <tr>
            <th class="text-center"><strong>Description</strong></th>
            <th class="text-center"><strong>Qty</strong></th>
            <th class="text-right"><strong>Price</strong></th>
            <th class="text-right"><strong>Line Total</strong></th>
          </tr>
        </thead>
        <tbody>
        <g:each in="${invoiceInstance?.invoiceItems}" var="i">
          <tr>
            <td class="text-center">${i.description }</td>
            <td class="text-center">${i.quantity }</td>
             <td class="text-right"><g:formatNumber number="${i.unitCost }" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
              <td class="text-right"><g:formatNumber number="${i.lineTotal }" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
          </tr>
          </g:each>
        </tbody>
      </table>
      
      <div class="row">
		  <div class="col-xs-3 pull-right">
		  	<div class="form-horizontal">
		  		<div class="form-group">
		  			<label class="control-label col-xs-7">Sub Total:</label>
		  			<div class="col-xs-5">
		  				<p class="form-control-static text-right"><g:formatNumber number="${invoiceInstance?.subTotal }" type="currency" currencyCode="GBP" currencySymbol="£"/></p>
		  			</div>
		  		</div>
		  		<div class="form-group">
		  			<label class="control-label col-xs-7">VAT:</label>
		  			<div class="col-xs-5">
		  				<p class="form-control-static text-right"><g:formatNumber number="${invoiceInstance?.vat }" type="currency" currencyCode="GBP" currencySymbol="£"/></p>
		  			</div>
		  		</div>
		  		<div class="form-group">
		  			<label class="control-label col-xs-7">Total:</label>
		  			<div class="col-xs-5">
		  				<p class="form-control-static text-right"><g:formatNumber number="${invoiceInstance?.total }" type="currency" currencyCode="GBP" currencySymbol="£"/></p>
		  			</div>
		  		</div>
		  	</div>
		  </div>
		</div>
	</div>
	<div class="col-lg-4">
		<g:link action="showPdf" id="${invoiceInstance.id }" class="btn btn-success btn-sm"><i class="fa fa-fw fa-file-pdf-o"></i> PDF</g:link>
	</div>
	</body>
</html>
