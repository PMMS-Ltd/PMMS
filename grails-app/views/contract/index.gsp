
<%@ page import="uk.org.pmms.Contract"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'contract.label', default: 'Contract')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<h1 class="page-header">
		${message(code: 'contract.label', default: 'Contracts')}
		<div class="btn-group">
			<a href="#" class="btn btn-xs btn-default dropdown-toggle"
				data-toggle="dropdown"> <span class="caret"></span> <span
				class="sr-only">Toggle Dropdown</span>
			</a>

			<ul class="dropdown-menu" role="menu">

				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link action="create">
							<i class="fa fa-plus fa-fw text-success"></i> Add New</g:link></li>
				</sec:ifAnyGranted>
			</ul>

		</div>
	</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<g:sortableColumn property="ref" class="col-lg-2"
					title="${message(code: 'contract.startDate.label', default: 'Contract Ref')}" />
				<g:sortableColumn property="client" class="text-center col-lg-1"
					title="${message(code: 'contract.client.label', default: 'Client')}" />
				<g:sortableColumn property="contractor"
					title="${message(code: 'contract.contractor.label', default: 'Contractor')}" />
				<g:sortableColumn property="contractType"
					title="${message(code: 'contract.contractType.label', default: 'Contract Type')}" />
				<g:sortableColumn property="startDate" class="text-center col-lg-1"
					title="${message(code: 'contract.startDate.label', default: 'Start Date')}" />
				<g:sortableColumn property="endDate" class="text-center col-lg-1"
					title="${message(code: 'contract.endDate.label', default: 'End Date')}" />

				<!--<g:sortableColumn property="usualDay"
					title="${message(code: 'contract.usualDay.label', default: 'Usual Day')}" />

				<g:sortableColumn property="frequencyOfService"
					title="${message(code: 'contract.frequencyOfService.label', default: 'Frequency Of Service')}" />

				<g:sortableColumn property="billingFrequency"
					title="${message(code: 'contract.billingFrequency.label', default: 'Billing Frequency')}" />

				<g:sortableColumn property="nominalCode"
					title="${message(code: 'contract.nominalCode.label', default: 'Nominal Code')}" />-->

			</tr>
		</thead>
		<tbody>
			<g:each in="${contractInstanceList}" status="i"
				var="contractInstance">
				<tr>
					<td><g:link action="show" id="${contractInstance.id}">${fieldValue(bean: contractInstance, field: "ref")}</g:link></td>
					<td class="text-center">${fieldValue(bean: contractInstance, field: "client")}</td>
					<td>${fieldValue(bean: contractInstance, field: "contractor")}</td>
					<td>${fieldValue(bean: contractInstance, field: "contractType")}</td>
					<td class="text-center"><g:formatDate date="${contractInstance.startDate}" format="dd/MM/yyyy"/></td>
					<td class="text-center"><g:formatDate date="${contractInstance.endDate}" format="dd/MM/yyyy"/></td>

					<!-- <td>
						${fieldValue(bean: contractInstance, field: "usualDay")}
					</td>

					<td>
						${fieldValue(bean: contractInstance, field: "frequencyOfService")}
					</td>

					<td>
						${fieldValue(bean: contractInstance, field: "billingFrequency")}
					</td>

					<td>
						${fieldValue(bean: contractInstance, field: "nominalCode")}
					</td>-->

				</tr>
			</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${contractInstanceCount ?: 0}" />
	</div>
	</div>
</body>
</html>
