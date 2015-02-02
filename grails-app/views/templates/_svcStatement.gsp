<html>
<head>
</head>

<body>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	<h4 class="modal-title">Service Charge Statement</h4>
</div>
<div class="modal-body" id="svcStatement">
		<div class="row">
			<div class="col-xs-12 visible-print-block">
				<img src="${resource(dir:'images', file: 'PMMS Letterhead.png') }" width="100%"/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4" style="padding-top: 25px; padding-left: 30px;">
			<g:if test="${property?.owner }">
				${property?.owner }<br/>
				<address>
					${property?.owner?.address?.unitNo} ${property?.owner?.address?.address1}<br/>
					<g:if test="${property?.owner?.address?.address2}">
						${property?.owner?.address?.address2}<br/>
					</g:if>
					
					${property?.owner?.address?.town}<br/>
					${property?.owner?.address?.county}<br/>
					${property?.owner?.address?.postCode}<br/>
					<g:country code="${property?.owner?.address?.country}"/><br/>
				</address>
			</g:if>
			</div>
			<div class="col-xs-8 text-right">
				<h3>Service Charge Statement</h3>
				<p>Property Reference: <strong>${property?.propertyId }</strong></p>
				<p><g:formatDate date="${new Date() }" format="dd/MM/yyyy"/></p>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 text-center">
				<p>${property?.address }</p>
				<p>${property?.client?.name }</p>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-bordered" style="font-size: 0.9em;">
					<thead>
						<tr>
							<th class="col-xs-2 text-center">Date</th>
							<th class="text-center">Details</th>
							<th class="col-xs-2 text-center">Credit</th>
							<th class="col-xs-2 text-center">Debit</th>
						</tr>
					</thead>
					<tbody>
					<g:if test="${arrears != 0 && arrears != null}">
					<tr class="text-center">
						<td><g:formatDate date="${property?.client?.yearStart}" format="dd/MM/yyyy"/></td>
						<g:if test="${arrears < 0 }"><td>Arrears brought forward</td><td/><td class="text-danger"><g:formatNumber number="${arrears }" type="currency" currencyCode="GBP" currencySymbol="£"/></td></g:if>
						<g:if test="${arrears > 0 }"><td>Credit brought forward</td><td class="text-success"><g:formatNumber number="${arrears }" type="currency" currencyCode="GBP" currencySymbol="£"/></td><td/></g:if>
					</tr>
					</g:if>
					<g:each in="${transactionList }" var="tran">
						<tr class="text-center">
							<td><g:formatDate date="${tran.dateEntered }" format="dd/MM/yyyy"/></td>
							<td>${tran.details }</td>
							<td>${tran.amount > 0 ? formatNumber(number: tran.amount, type: 'currency', currencyCode: 'GBP', currencySymbol: '£') : '' }</td>
							<td class="text-danger">${tran.amount < 0 ? formatNumber(number: tran.amount, type: 'currency', currencyCode: 'GBP', currencySymbol: '£') : '' }</td>
						</tr>
					</g:each>
					<tr>
						<td></td>
						<th class="text-right">Total:</th>
						<td class="text-center"><g:formatNumber number="${creditSum }" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
						<td class="text-center"><g:formatNumber number="${debitSum }" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
					</tr>
					</tbody>
				
				</table>
				
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 pull-right">
				<table class="table">
					<tr>
						<th class="col-xs-4 text-right"><h4>Balance:</h4></th>
						<td class="col-xs-8 text-center"><h4><g:formatNumber number="${creditSum + debitSum}" type="currency" currencyCode="GBP" currencySymbol="£"/></h4></td>
					</tr>
				</table>
			</div>
		</div>
		
	</div>
	
	<div class="modal-footer">
		<a href="#" id="printSvc" class="btn btn-sm btn-default text-right"><i class="fa fa-fw fa-lg fa-print"></i> Print</a>
    	<g:link controller="property" action="svcPdf" resource="${property}" class="btn btn-sm btn-danger text-right"><i class="fa fa-fw fa-lg fa-file-pdf-o"></i> Export to PDF</g:link>
    </div>
</body>
</html>