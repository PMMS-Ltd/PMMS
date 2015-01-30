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

	<rendering:inlinePng bytes="${logo}" style="width:100%;" />

	<div
		style="width: 33.333333333%; float: left; padding-top: 25px; padding-left: 30px;">
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
			<tr>
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
	<table class="table" style="width: 50%; float: right;">
		<tr>
			<th class="text-right"><h4>Balance:</h4></th>
			<td></td>
			<td class="text-center"><h4>
					<g:formatNumber number="${creditSum + debitSum}" type="currency"
						currencyCode="GBP" currencySymbol="£" />
				</h4></td>
		</tr>
	</table>
	<nav class="navbar navbar-default navbar-fixed-bottom">
	  <div class="container">
	    <rendering:inlinePng bytes="${logo}" style="width:100%;" />
	  </div>
	</nav>
	<r:layoutResources />
</body>
</html>