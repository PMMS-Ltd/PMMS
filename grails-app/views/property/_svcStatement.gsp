<html>
<head>
</head>

<body>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	<h4 class="modal-title">Service Charge Statement</h4>
</div>
<div class="modal-body">
		<div class="row">
			<div class="col-xs-12 visible-print-block">
				<img src="${resource(dir:'images', file: 'PMMS Letterhead.png') }" width="100%"/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4" style="padding-top: 25px; padding-left: 30px;">
				<p>${property?.owner }</p>
				<address>
					${property?.owner?.address}
				</address>
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
					<g:each in="${transactionList }" var="tran">
						<tr class="text-center">
							<td><g:formatDate date="${tran.dateEntered }" format="dd/MM/yyyy"/></td>
							<td>${tran.details }</td>
							<td>${tran.amount > 0 ? formatNumber(number: tran.amount, type: 'currency', currencyCode: 'GBP', currencySymbol: '£') : '' }</td>
							<td class="text-danger">${tran.amount < 0 ? formatNumber(number: tran.amount, type: 'currency', currencyCode: 'GBP', currencySymbol: '£') : '' }</td>
						</tr>
					</g:each>
					</tbody>
				
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