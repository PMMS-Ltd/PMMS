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
<!--<r:layoutResources />-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>

</head>
<body>

	<rendering:inlinePng bytes="${logo}" style="width: 40%; float: left;"/>
	<div style="clear: both;"></div>
	<div style="width: 33.333333333%; float: left; padding-top: 25px; padding-left: 30px;">
		${property?.owner }<br />
		<address>
			${property?.owner?.address?.unitNo}
			${property?.owner?.address?.address1}<br />
			<g:if test="${property?.owner?.address?.address2}">
				${property?.owner?.address?.address2}<br />
			</g:if>

			${property?.owner?.address?.town}<br />
			${property?.owner?.address?.county}<br />
			${property?.owner?.address?.postCode}<br />
			<g:country code="${property?.owner?.address?.country}" />
			<br />
		</address>
	</div>
	<div style="width: 50%; float: right; text-align: right;">
		<h3>Service Charge Statement</h3>
		<p>
			Property Reference: <strong> ${property?.propertyId }
			</strong>
		</p>
		<p>
			<g:formatDate date="${new Date() }" format="dd/MM/yyyy" />
		</p>
	</div>
	<div style="clear: both;"></div>


	<p class="text-center">
		${property?.address }
	</p>
	<p class="text-center">
		${property?.client?.name }
	</p>



	<table class="table table-bordered" style="font-size: 0.9em;">
		<thead>
			<tr >
				<th class="text-center">Date</th>
				<th class="text-center">Details</th>
				<th class="text-center">Credit</th>
				<th class="text-center">Debit</th>
			</tr>
		</thead>
		<tbody>
			<g:if test="${arrears != 0 }">
				<tr class="text-center">
					<td><g:formatDate date="${property?.client?.yearStart}"
							format="dd/MM/yyyy" /></td>
					<g:if test="${arrears < 0 }">
						<td>Arrears brought forward</td>
						<td />
						<td class="text-danger"><g:formatNumber number="${arrears }"
								type="currency" currencyCode="GBP" currencySymbol="£" /></td>
					</g:if>
					<g:if test="${arrears > 0 }">
						<td>Credit brought forward</td>
						<td class="text-success"><g:formatNumber number="${arrears }"
								type="currency" currencyCode="GBP" currencySymbol="£" /></td>
						<td />
					</g:if>
				</tr>
			</g:if>
			<g:each in="${transactionList }" var="tran">
				<tr class="text-center">
					<td><g:formatDate date="${tran.dateEntered }"
							format="dd/MM/yyyy" /></td>
					<td>
						${tran.details }
					</td>
					<td><g:if test="${tran.amount >= 0 }">
							<g:formatNumber number="${tran.amount }" type="currency"
								currencyCode="GBP" currencySymbol="£" />
						</g:if></td>
					<td class="text-danger"><g:if test="${tran.amount < 0 }">
							<g:formatNumber number="${tran.amount }" type="currency"
								currencyCode="GBP" currencySymbol="£" />
						</g:if></td>
				</tr>
			</g:each>
			<tr>
				<td></td>
				<th class="text-right">Total:</th>
				<td class="text-center"><g:formatNumber number="${creditSum }"
						type="currency" currencyCode="GBP" currencySymbol="£" /></td>
				<td class="text-center"><g:formatNumber number="${debitSum }"
						type="currency" currencyCode="GBP" currencySymbol="£" /></td>
			</tr>
		</tbody>
	</table>
	<div style="width: 50%; float:right; margin-right: 50px; margin-top: 50px;">
		<h4 class="text-right">Balance: <g:formatNumber number="${creditSum + debitSum}" type="currency" currencyCode="GBP" currencySymbol="£" /></h4>
	</div>
	<div style="clear:both;"></div>
	<div style="width: 100%; min-height: 100px; position: fixed; bottom: 0px; border-color: #8b1b3f !important; border-top: 1px solid;">
		<div>
			<rendering:inlinePng bytes="${RICS}" style="width: 120px; float: left; margin-top: 20px;"/>
			<rendering:inlinePng bytes="${IRPM}" style="width: 60px; float: left; margin-left: 40px; margin-top: 20px;"/>
		</div>
		<div class="text-right">
			<span style="font-size: 1.0em;">Property Maintenance &amp; Management Services Ltd.</span><br />
			<span style="font-size: 0.8em;">Ground Floor | Sidda House | 350 Lower Addiscombe Road<br />
			Croydon | Surrey | CR9 7AX | <b>phone</b> 020 8656 0568</span> 
			<p style="font-size: 0.8em;"><b>www.pmms.org.uk</b></p>
		</div>
	</div>
	<r:layoutResources />
</body>
</html>