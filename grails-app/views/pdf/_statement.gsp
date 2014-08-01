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
<div class="container">
		
			<img src="${resource(dir:'static/images', file:'PMMS%20Letterhead.png', absolute:true) }"
				width="100%" />
	<div class="clearfix">
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
	</div>
	
		<div class="text-center" style="width: 100%;">
			<p>
				${property?.address }
			</p>
			<p>
				${property?.client?.name }
			</p>
		</div>

	
		<div style="width: 100%;">
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
		</div>
	</div>
	<r:layoutResources />
</body>
</html>