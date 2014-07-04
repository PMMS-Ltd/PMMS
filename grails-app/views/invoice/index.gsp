
<%@ page import="uk.org.pmms.Invoice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-invoice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-invoice" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="invoice.billTo.label" default="Bill To" /></th>
					
						<g:sortableColumn property="subTotal" title="${message(code: 'invoice.subTotal.label', default: 'Sub Total')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'invoice.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="vat" title="${message(code: 'invoice.vat.label', default: 'Vat')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${invoiceInstance.id}">${fieldValue(bean: invoiceInstance, field: "billTo")}</g:link></td>
					
						<td>${fieldValue(bean: invoiceInstance, field: "subTotal")}</td>
					
						<td>${fieldValue(bean: invoiceInstance, field: "total")}</td>
					
						<td>${fieldValue(bean: invoiceInstance, field: "vat")}</td>
					
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
