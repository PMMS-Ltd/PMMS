
<%@ page import="uk.org.pmms.accounts.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		<div id="list-transaction" class="content scaffold-list" role="main">
			
			<table class="table table-condensed table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'transaction.id.label', default: 'Transaction ID')}" />
							
						<g:sortableColumn property="client" title="${message(code: 'transaction.client.label', default: 'Client')}" />
						
						<th><g:message code="transaction.propertyId.label" default="Property Id" /></th>
						
						<g:sortableColumn property="type" title="${message(code: 'transaction.type.label', default: 'Type')}" />
						
						<th><g:message code="transaction.dateEntered.label" default="Date Entered" /></th>
						
						<th><g:message code="transaction.amount.label" default="Amount" /></th>
					
						<th><g:message code="transaction.details.label" default="Details" /></th>
						
						<th><g:message code="transaction.supplier.label" default="Supplier" /></th>
					
						<g:sortableColumn property="datePaid" title="${message(code: 'transaction.datePaid.label', default: 'Date Paid')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
					<tr class="text-center">
					
						<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "id")}</g:link></td>
						
						<td>${fieldValue(bean: transactionInstance, field: "client")}</td>
						
						<td>${fieldValue(bean: transactionInstance, field: "propertyId")}</td>
						
						<td>${fieldValue(bean: transactionInstance, field: "type")}</td>
						
						<td><g:formatDate date="${transactionInstance.dateEntered}" format="dd/MM/yyyy" /></td>
						
						<td class="${transactionInstance.amount < 0 ? 'text-danger' : '' }"><g:formatNumber number="${transactionInstance.amount}" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "details")}</td>
					
						<!-- <td>${fieldValue(bean: transactionInstance, field: "jobId")}</td>-->
										
						<td>${fieldValue(bean: transactionInstance, field: "supplier")}</td>
					
						<td><g:formatDate date="${transactionInstance.datePaid}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
