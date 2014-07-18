<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<title>Service Charges</title>
	</head>
	<body>
		<div class="row">
			<h1 class="page-header">Service Charges</h1>
			<div class="col-xs-2">
				<div class="list-group" id="serviceChargeClientList">
					<g:each in="${clientInstanceList }" var="clientInstance">
						<a href="#" class="list-group-item">${clientInstance.name } <span class="badge">${uk.org.pmms.accounts.ServiceChargeType.findAllByClient(clientInstance).size() }</span></a>
					</g:each>
				</div>
			</div>
			<div class="col-xs-5">
				<h3 class="text-center"><g:formatDate date="${clientInstanceList[0].yearStart }" format="dd/MM/yyy"/> - <g:formatDate date="${clientInstanceList[0].yearEnd }" format="dd/MM/yyy"/></h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Type</th>
							<th>Description</th>
							<th>Service Charge</th>
							<th>Ground Rent</th>
							<th>Annually</th>
							<th>Half-Yearly</th>
							<th>Quarterly</th>
							<th>Monthly</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${uk.org.pmms.accounts.ServiceChargeType.findAllByClient(clientInstanceList[0])}" var="type">
							<tr class="text-center" data-id="${type.id }">
								<td>${type.type }</td>
								<td>${type.description }</td>
								<td><g:formatNumber number="${type.charges[0].serviceCharge}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td><g:formatNumber number="${type.charges[0].groundRent}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td>
								<g:if test="${type.annually == true}">
									<g:formatNumber number="${type.charges[0].annualAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.halfYearly == true}">
									<g:formatNumber number="${type.charges[0].halfYearlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.quarterly == true}">
									<g:formatNumber number="${type.charges[0].quarterlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.monthly == true}">
									<g:formatNumber number="${type.charges[0].monthlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			
			</div>
			<div class="col-xs-5">
				<h3 class="text-center">
					<g:formatDate date="${clientInstanceList[0].yearStart.plus(365) }" format="dd/MM/yyy"/>
					 - 
					 <g:formatDate date="${clientInstanceList[0].yearEnd.plus(365) }" format="dd/MM/yyy"/> 
					 
					 <span class="pull-right label label-default">Draft</span>
					 </h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Type</th>
							<th>Description</th>
							<th>Service Charge</th>
							<th>Ground Rent</th>
							<th>Annually</th>
							<th>Half-Yearly</th>
							<th>Quarterly</th>
							<th>Monthly</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${uk.org.pmms.accounts.ServiceChargeType.findAllByClient(clientInstanceList[0])}" var="type">
							<tr class="text-center" data-id="${type.id }">
								<td>${type.type }</td>
								<td>${type.description }</td>
								<td><g:formatNumber number="${type.charges[1].serviceCharge}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td><g:formatNumber number="${type.charges[1].groundRent}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td>
								<g:if test="${type.annually == true}">
									<g:formatNumber number="${type.charges[1].annualAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.halfYearly == true}">
									<g:formatNumber number="${type.charges[1].halfYearlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.quarterly == true}">
									<g:formatNumber number="${type.charges[1].quarterlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.monthly == true}">
									<g:formatNumber number="${type.charges[1].monthlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			
			</div>
		</div>
		
	</body>
</html>