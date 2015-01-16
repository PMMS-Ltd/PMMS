
<%@ page import="uk.org.pmms.accounts.ServiceCharge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'serviceCharge.label', default: 'ServiceCharge')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" /></h1>
		<g:link action="create" class="btn btn-xs btn-success"><i class="fa fa-fw fa-plus"></i> Add New</g:link>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
		<div id="list-serviceCharge" class="col-xs-10" role="main">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="text-center">Client</th>					
					
						<th class="text-center">Service Charge Type</th>
					
						<g:sortableColumn property="startDate" class="text-center" title="${message(code: 'serviceCharge.startDate.label', default: 'Start Date')}" />
										
						<g:sortableColumn property="endDate" class="text-center" title="${message(code: 'serviceCharge.endDate.label', default: 'End Date')}" />
						
						<g:sortableColumn property="serviceCharge" class="text-center" title="${message(code: 'serviceCharge.serviceCharge.label', default: 'Service Charge')}" />
					
						<g:sortableColumn property="groundRent" class="text-center" title="${message(code: 'serviceCharge.groundRent.label', default: 'Ground Rent')}" />
						
						<g:sortableColumn property="status" class="text-center" title="${message(code: 'serviceCharge.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceChargeInstanceList}" status="i" var="serviceChargeInstance">
					<tr class="text-center">
						<td><g:link controller="client" action="show" id="${serviceChargeInstance?.serviceChargeType?.client.id }">${serviceChargeInstance?.serviceChargeType?.client}</g:link>
						<g:link class="btn btn-xs btn-primary" action="listCharges" id="${serviceChargeInstance?.serviceChargeType?.client.id }"><i class="fa fa-fw fa-tasks"></i> List Charges</g:link></td>
					
						<td><g:link controller="serviceChargeType" action="show" id="${serviceChargeInstance?.serviceChargeType.id }">${serviceChargeInstance?.serviceChargeType}</g:link></td>
						
						<td><g:formatDate date="${serviceChargeInstance.startDate}" format="dd/MM/yyyy"/></td>
						
						<td><g:formatDate date="${serviceChargeInstance.endDate}" format="dd/MM/yyyy"/></td>
						
						<td><g:formatNumber type="currency" number="${serviceChargeInstance.serviceCharge}" currencyFormat="GBP" currencySymbol="£"/></td>
						
						<td><g:formatNumber type="currency" number="${serviceChargeInstance.groundRent}" currencyFormat="GBP" currencySymbol="£"/></td>
					
						
						
						<td><span class="label status-${serviceChargeInstance.status.toLowerCase() }">${serviceChargeInstance.status }</span></td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		</div>
	</body>
</html>
