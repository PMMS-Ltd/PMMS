<%@ page import="uk.org.pmms.accounts.ServiceChargeType" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<title>Service Charges</title>
	</head>
	<body>
		<div class="row">
			<h1 class="page-header">
		${clientInstance.name} <small>(${clientInstance.clientId })</small>
		<span style="font-size: 0.5em;">
		<ul class="nav nav-pills pull-right">
		  <li role="presentation"><g:link action="show" resource="${clientInstance }">Overview</g:link></li>
		  <li role="presentation"><g:link action="finances" resource="${clientInstance }">Arrears</g:link></li>
		  <li role="presentation" class="active"><a href="#">Service Charge</a></li>
		</ul>
		</span>
	</h1>
	<hr />
	
			
		
			<div class="col-xs-6">
				<h3 class="text-center">Current Financial Year <span class="text-muted">(<g:formatDate date="${clientInstance.yearStart }" format="dd/MM/yyy"/> - <g:formatDate date="${clientInstance.yearEnd }" format="dd/MM/yyy"/>)</span></h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Type</th>
							<th>Action</th>
							<th>Service Charge</th>
							<th>Ground Rent</th>
							<th>Annually</th>
							<th>Half-Yearly</th>
							<th>Quarterly</th>
							<th>Monthly</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${serviceChargeTypeList}" var="type">
						<g:if test="${type.currentCharge()}">
							<g:each in="${type.currentCharge() }">
							<tr class="text-center" data-id="${type.id }">
								<td>${type.type }</td>
								<td>
									<g:if test="${it.status != 'Approved' && it.status != 'Applied' }">
										<g:link action="edit" class="btn btn-xs btn-default" id="${it.id}"><i class="fa fa-fw fa-pencil"></i> Edit</g:link>
									</g:if>
									<g:if test="${it.status == 'Approved' }">
										<g:link action="applySVC" class="btn btn-xs btn-success" id="${it.id}"><i class="fa fa-fw fa-play"></i> Apply</g:link>
									</g:if>
								</td>
								<td><g:formatNumber number="${it.serviceCharge}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td><g:formatNumber number="${it.groundRent}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td>
								<g:if test="${type.annually == true}">
									<g:formatNumber number="${it.annualAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.halfYearly == true}">
									<g:formatNumber number="${it.halfYearlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.quarterly == true}">
									<g:formatNumber number="${it.quarterlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.monthly == true}">
									<g:formatNumber number="${it.monthlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td><span class="label status-${it.status.toLowerCase().tr(' ','-') }">${it.status }</span></td>
							</tr>
						</g:each>
						</g:if>
						</g:each>
					</tbody>
				</table>
			<g:link action="addCharges" controller="serviceCharge" id="${clientInstance.id}" class="btn btn-sm btn-success"><i class="fa fa-fw fa-plus"></i> Add Charges</g:link>
			</div>
			<div class="col-xs-6">
				<h3 class="text-center">
					<g:formatDate date="${clientInstance.yearStart.plus(365) }" format="dd/MM/yyy"/>
					 - 
					 <g:formatDate date="${clientInstance.yearEnd.plus(365) }" format="dd/MM/yyy"/>
					 </h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Type</th>
							<!--<th>Description</th>-->
							<th>Action</th>
							<th>Service Charge</th>
							<th>Ground Rent</th>
							<th>Annually</th>
							<th>Half-Yearly</th>
							<th>Quarterly</th>
							<th>Monthly</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${serviceChargeTypeList}" var="type">
						<g:if test="${type.futureCharges().size() > 0 }">
							<g:each in="${type.futureCharges() }">
								<g:if test="${it.startDate == clientInstance.yearStart.clearTime().plus(365) }">
								
								<tr class="text-center" data-id="${type.id }">
								<td>${type.type }</td>
								<!-- <td>${type.description }</td>-->
								<td>
									<g:if test="${it.status != 'Approved' && it.status != 'Applied' }">
										<g:link action="edit" class="btn btn-xs btn-default" id="${it.id}"><i class="fa fa-fw fa-pencil"></i> Edit</g:link>
									</g:if>
									<g:if test="${it.status == 'Approved' }">
										<g:link action="applySVC" class="btn btn-xs btn-success" id="${it.id}"><i class="fa fa-fw fa-play"></i> Apply</g:link>
									</g:if>
								</td>
								<td><g:formatNumber number="${it.serviceCharge}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td><g:formatNumber number="${it.groundRent}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
								<td>
								<g:if test="${type.annually == true}">
									<g:formatNumber number="${it.annualAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.halfYearly == true}">
									<g:formatNumber number="${it.halfYearlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.quarterly == true}">
									<g:formatNumber number="${it.quarterlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td>
								<g:if test="${type.monthly == true}">
									<g:formatNumber number="${it.monthlyAmount}" type="currency" currencyCode="GBP" currencySymbol="£"/>
								</g:if>
								<g:else>
									-
								</g:else>
								</td>
								<td><span class="label status-${it.status.toLowerCase().tr(' ','-') }">${it.status }</span></td>
							</tr>
							</g:if>
							</g:each>
							</g:if>
						</g:each>
					</tbody>
				</table>
			
			</div>
		</div>
		
	</body>
</html>