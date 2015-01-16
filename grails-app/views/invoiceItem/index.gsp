
<%@ page import="uk.org.pmms.InvoiceItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invoiceItem.label', default: 'InvoiceItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-invoiceItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-invoiceItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'invoiceItem.description.label', default: 'Description')}" />
					
						<th><g:message code="invoiceItem.invoice.label" default="Invoice" /></th>
					
						<g:sortableColumn property="lineTotal" title="${message(code: 'invoiceItem.lineTotal.label', default: 'Line Total')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'invoiceItem.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="unitCost" title="${message(code: 'invoiceItem.unitCost.label', default: 'Unit Cost')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${invoiceItemInstanceList}" status="i" var="invoiceItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${invoiceItemInstance.id}">${fieldValue(bean: invoiceItemInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: invoiceItemInstance, field: "invoice")}</td>
					
						<td>${fieldValue(bean: invoiceItemInstance, field: "lineTotal")}</td>
					
						<td>${fieldValue(bean: invoiceItemInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: invoiceItemInstance, field: "unitCost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${invoiceItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
