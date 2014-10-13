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
	
		<div style="width: 33.333333333%; float: left; padding-top: 25px; padding-left: 30px;">
			<p>
				${property?.owner }
			</p>
			<address>
				${property?.owner?.address}
			</address>
		</div>
		<div style="width: 50%; float: right; text-align:right;">
			<h3>Service Charge Statement</h3>
			<p>
				Property Reference: <strong>
					${property?.propertyId }
				</strong>
			</p>
			<p>
				<g:formatDate date="${new Date() }" format="dd/MM/yyyy" />
			</p>
		</div>
		<div style="clear: both;"></div>

		
			<p class="text-center">${property?.address }</p>
			<p class="text-center">${property?.client?.name }</p>
		
		
		
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
					<g:each in="${transactionList }" var="tran">
						<tr class="text-center">
							<td><g:formatDate date="${tran.dateEntered }"
									format="dd/MM/yyyy" /></td>
							<td>
								${tran.details }
							</td>
							<td>
								<g:if test="${tran.amount >= 0 }">
									<g:formatNumber number="${tran.amount }" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
							</td>
							<td class="text-danger">
								<g:if test="${tran.amount < 0 }">
									<g:formatNumber number="${tran.amount }" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
	<r:layoutResources />
</body>
</html>