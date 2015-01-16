<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
@page {
		width: 210mm;
		height: 297mm;
 		margin: 1cm;
 	}
 @media print {
	.container {
		width: 670px;
	}
  }
</style>

<r:require modules="jquery, application" />
<r:layoutResources />
</head>
<body>
		
	<rendering:inlinePng bytes="${logo}" style="width:100%;"/>
	<div style="width:33.3333333%; float:left;">
		<h3>To:</h3>
		<p style="margin-left: 50px;">
			<strong>${invoiceInstance?.billTo?.name}</strong><br />
			${invoiceInstance?.billTo?.address?.unitNo} ${invoiceInstance?.billTo?.address?.address1}<br />
			${invoiceInstance?.billTo?.address?.address2}<br />
			${invoiceInstance?.billTo?.address?.town}<br />
			${invoiceInstance?.billTo?.address?.county}<br />
			${invoiceInstance?.billTo?.address?.postCode}<br />
		</p>
	</div>
	<!-- <div style="width: 33.3333333%; float:left;">
		<h3>From:</h3>
		<p>
			<strong>PMMS Ltd.</strong><br />Ground Floor Sidda House<br />350 Lower Addiscombe Road<br />Croydon<br />Surrey<br />CR9 7AX<br />
		</p>
	</div>-->
	<div class="text-right" style="width:33.33333%; float:right;">
		<h1>INVOICE</h1>
		<h1>
			<small>#<g:formatNumber	number="${invoiceInstance?.id}" minIntegerDigits="6"/></small>
		</h1>
		<h3>
			<small><g:formatDate date="${new Date()}" format="dd/MM/yyyy"/></small>
		</h3>
	</div>
	<div style="clear:both;"></div>
		
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

		
			<div style="width:25%; float:right; margin-top: 75px;">
				<table class="table table-bordered" style="width: 100%;">
				<tbody>
					<tr>
						<th>Sub Total:</th>
						<td class="text-right"><g:formatNumber number="${invoiceInstance?.subTotal }" type="currency" currencyCode="GBP" currencySymbol="£" /></td>
					</tr>
					<tr>
						<th>VAT:</th>
						<td class="text-right"><g:formatNumber number="${invoiceInstance?.vat }" type="currency" currencyCode="GBP" currencySymbol="£" /></td>
					</tr>
					<tr>
						<th>Total:</th>
						<td class="text-right"><g:formatNumber number="${invoiceInstance?.total }" type="currency" currencyCode="GBP" currencySymbol="£" /></td>
					</tr>
					<tr>
						<th>Received:</th>
						<td class="text-right"><g:formatNumber number="${invoiceInstance?.total - invoiceInstance?.balance }" type="currency" currencyCode="GBP" currencySymbol="£" /></td>
					</tr>
					<tr>
						<th>Balance:</th>
						<td class="text-right"><g:formatNumber number="${invoiceInstance?.balance }" type="currency" currencyCode="GBP" currencySymbol="£" /></td>
					</tr>
				</tbody>
				</table>
			</div>
		<r:layoutResources/>
</body>
</html>