
<%@ page import="uk.org.pmms.InvoiceItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'invoiceItem.label', default: 'InvoiceItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-invoiceItem" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list invoiceItem">
			
				<g:if test="${invoiceItemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="invoiceItem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${invoiceItemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceItemInstance?.invoice}">
				<li class="fieldcontain">
					<span id="invoice-label" class="property-label"><g:message code="invoiceItem.invoice.label" default="Invoice" /></span>
					
						<span class="property-value" aria-labelledby="invoice-label"><g:link controller="invoice" action="show" id="${invoiceItemInstance?.invoice?.id}">${invoiceItemInstance?.invoice?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceItemInstance?.lineTotal}">
				<li class="fieldcontain">
					<span id="lineTotal-label" class="property-label"><g:message code="invoiceItem.lineTotal.label" default="Line Total" /></span>
					
						<span class="property-value" aria-labelledby="lineTotal-label"><g:fieldValue bean="${invoiceItemInstance}" field="lineTotal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceItemInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="invoiceItem.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${invoiceItemInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${invoiceItemInstance?.unitCost}">
				<li class="fieldcontain">
					<span id="unitCost-label" class="property-label"><g:message code="invoiceItem.unitCost.label" default="Unit Cost" /></span>
					
						<span class="property-value" aria-labelledby="unitCost-label"><g:fieldValue bean="${invoiceItemInstance}" field="unitCost"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:invoiceItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${invoiceItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
