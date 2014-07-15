<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" media="print"></link>
<!--<link href="http://maxcdn.bootstrapcdn.com/bootswatch/3.1.1/flatly/bootstrap.min.css" rel="stylesheet" media="print"></link>-->
<link rel="stylesheet" href="${resource(dir:'css', file:'custom.css')}"></link>
<title>Sample Invoice</title>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-8">
				<img
					src="http://pmmsorg.users37.interdns.co.uk/wordpress/wp-content/uploads/2013/08/Logo.png"
					width="100%" />
			</div>
			<div class="col-xs-4 text-right">
				<h1>INVOICE</h1>
				<h1>
					<small>#<g:formatNumber
							number="${invoiceInstance?.id}" minIntegerDigits="6"/></small>
				</h1>
				<h3>
					<small><g:formatDate date="${new Date()}" format="dd/MM/yyyy"/></small>
				</h3>
			</div>
			<hr />
		</div>
		<div class="row">
			<div class="col-xs-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">From</h3>
					</div>
					<div class="panel-body">
						<p class="text-left">
							<strong>PMMS Ltd.</strong><br /> Ground Floor Sidda House<br />
							350 Lower Addiscombe Road<br /> Croydon<br /> Surrey<br /> CR9
							7AX<br />
						</p>
					</div>
				</div>
			</div>
			<div class="col-xs-5 text-right pull-right">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">To</h3>
					</div>
					<div class="panel-body">
						<p>
							<strong>
								${invoiceInstance?.billTo?.name}
							</strong><br />
							${invoiceInstance?.billTo?.address?.unitNo}
							${invoiceInstance?.billTo?.address?.address1}<br />
							${invoiceInstance?.billTo?.address?.address2}<br />
							${invoiceInstance?.billTo?.address?.town}<br />
							${invoiceInstance?.billTo?.address?.county}<br />
							${invoiceInstance?.billTo?.address?.postCode}<br />
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- / end client details section -->
		<div class="row">
		<div class="col-xs-12">
		<table class="table table-bordered table-condensed" style="margin-top: 25px;">
			<thead>
				<tr>
					<th class="text-center">Description</th>
					<th class="text-center">Qty</th>
					<th class="text-right">Price</th>
					<th class="text-right">Line Total</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${invoiceInstance?.invoiceItems}" var="i">
					<tr>
						<td class="text-center">
							${i.description }
						</td>
						<td class="text-center">
							${i.unitCost}
						</td>
						<td class="text-right"><g:formatNumber
								number="${i.unitCost }" type="currency" currencyCode="GBP"
								currencySymbol="£" /></td>
						<td class="text-right"><g:formatNumber
								number="${i.lineTotal }" type="currency" currencyCode="GBP"
								currencySymbol="£" /></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		</div>
	</div>
		<div class="row">
			<div class="col-xs-3 form-horizontal pull-right">
				
					<div class="form-group" style="margin-bottom:0px;">
						<label class="control-label col-xs-7">Sub Total:</label>
						<div class="col-xs-5">
							<p class="form-control-static text-right">
								<g:formatNumber number="${invoiceInstance?.subTotal }"
									type="currency" currencyCode="GBP" currencySymbol="£" />
							</p>
						</div>
					</div>
					<div class="form-group" style="margin-bottom:0px;">
						<label class="control-label col-xs-7">VAT:</label>
						<div class="col-xs-5">
							<p class="form-control-static text-right">
								<g:formatNumber number="${invoiceInstance?.vat }"
									type="currency" currencyCode="GBP" currencySymbol="£" />
							</p>
						</div>
					</div>
					<div class="form-group" style="margin-bottom:0px;">
						<label class="control-label col-xs-7">Total:</label>
						<div class="col-xs-5">
							<p class="form-control-static text-right">
								<g:formatNumber number="${invoiceInstance?.total }"
									type="currency" currencyCode="GBP" currencySymbol="£" />
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>