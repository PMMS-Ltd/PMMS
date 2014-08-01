
<%@ page import="uk.org.pmms.Invoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		<div id="list-invoice" class="content scaffold-list" role="main">
			
			<table class="table">
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'invoice.id.label', default: 'Invoice ID')}" />
					
						<th><g:message code="invoice.billTo.label" default="Bill To" /></th>
					
						<g:sortableColumn property="subTotal" title="${message(code: 'invoice.subTotal.label', default: 'Sub Total')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'invoice.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="vat" title="${message(code: 'invoice.vat.label', default: 'Vat')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
					
					<tr>
						<td><g:link action="show" id="${invoiceInstance.id}">${fieldValue(bean: invoiceInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: invoiceInstance, field: "billTo")}</td>
					
						<td><g:formatNumber type="currency" number="${invoiceInstance?.subTotal }" currencyCode="GBP" currencySymbol="£"/></td>
					
						<td><g:formatNumber type="currency" number="${invoiceInstance?.total }" currencyCode="GBP" currencySymbol="£"/></td>
					
						<td><g:formatNumber type="currency" number="${invoiceInstance?.vat }" currencyCode="GBP" currencySymbol="£"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${invoiceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
