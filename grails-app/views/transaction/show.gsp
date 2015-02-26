
<%@ page import="uk.org.pmms.accounts.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-transaction" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transaction">
			
				<g:if test="${transactionInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="transaction.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${transactionInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="transaction.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${transactionInstance?.client?.id}">${transactionInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.jobId}">
				<li class="fieldcontain">
					<span id="jobId-label" class="property-label"><g:message code="transaction.jobId.label" default="Job Id" /></span>
					
						<span class="property-value" aria-labelledby="jobId-label"><g:fieldValue bean="${transactionInstance}" field="jobId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.propertyId}">
				<li class="fieldcontain">
					<span id="propertyId-label" class="property-label"><g:message code="transaction.propertyId.label" default="Property Id" /></span>
					
						<span class="property-value" aria-labelledby="propertyId-label"><g:link controller="property" action="show" id="${transactionInstance?.propertyId?.id}">${transactionInstance?.propertyId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.supplier}">
				<li class="fieldcontain">
					<span id="supplier-label" class="property-label"><g:message code="transaction.supplier.label" default="Supplier" /></span>
					
						<span class="property-value" aria-labelledby="supplier-label"><g:link controller="supplier" action="show" id="${transactionInstance?.supplier?.id}">${transactionInstance?.supplier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.datePaid}">
				<li class="fieldcontain">
					<span id="datePaid-label" class="property-label"><g:message code="transaction.datePaid.label" default="Date Paid" /></span>
					
						<span class="property-value" aria-labelledby="datePaid-label"><g:formatDate date="${transactionInstance?.datePaid}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="transaction.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${transactionInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.invoiceNo}">
				<li class="fieldcontain">
					<span id="invoiceNo-label" class="property-label"><g:message code="transaction.invoiceNo.label" default="Invoice No" /></span>
					
						<span class="property-value" aria-labelledby="invoiceNo-label"><g:fieldValue bean="${transactionInstance}" field="invoiceNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.paymentType}">
				<li class="fieldcontain">
					<span id="paymentType-label" class="property-label"><g:message code="transaction.paymentType.label" default="Payment Type" /></span>
					
						<span class="property-value" aria-labelledby="paymentType-label"><g:fieldValue bean="${transactionInstance}" field="paymentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.grp}">
				<li class="fieldcontain">
					<span id="grp-label" class="property-label"><g:message code="transaction.grp.label" default="Grp" /></span>
					
						<span class="property-value" aria-labelledby="grp-label"><g:fieldValue bean="${transactionInstance}" field="grp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="transaction.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${transactionInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.bankAccount}">
				<li class="fieldcontain">
					<span id="bankAccount-label" class="property-label"><g:message code="transaction.bankAccount.label" default="Bank Account" /></span>
					
						<span class="property-value" aria-labelledby="bankAccount-label"><g:link controller="bankAccount" action="show" id="${transactionInstance?.bankAccount?.id}">${transactionInstance?.bankAccount?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.nominalCode}">
				<li class="fieldcontain">
					<span id="nominalCode-label" class="property-label"><g:message code="transaction.nominalCode.label" default="Nominal Code" /></span>
					
						<span class="property-value" aria-labelledby="nominalCode-label"><g:fieldValue bean="${transactionInstance}" field="nominalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.paid}">
				<li class="fieldcontain">
					<span id="paid-label" class="property-label"><g:message code="transaction.paid.label" default="Paid" /></span>
					
						<span class="property-value" aria-labelledby="paid-label"><g:formatBoolean boolean="${transactionInstance?.paid}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.reconciled}">
				<li class="fieldcontain">
					<span id="reconciled-label" class="property-label"><g:message code="transaction.reconciled.label" default="Reconciled" /></span>
					
						<span class="property-value" aria-labelledby="reconciled-label"><g:formatBoolean boolean="${transactionInstance?.reconciled}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:transactionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${transactionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
