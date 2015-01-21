
<%@ page import="uk.org.pmms.Contract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-contract" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contract">
			
				<g:if test="${contractInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="contract.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${contractInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="contract.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${contractInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.usualDay}">
				<li class="fieldcontain">
					<span id="usualDay-label" class="property-label"><g:message code="contract.usualDay.label" default="Usual Day" /></span>
					
						<span class="property-value" aria-labelledby="usualDay-label"><g:fieldValue bean="${contractInstance}" field="usualDay"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.frequencyOfService}">
				<li class="fieldcontain">
					<span id="frequencyOfService-label" class="property-label"><g:message code="contract.frequencyOfService.label" default="Frequency Of Service" /></span>
					
						<span class="property-value" aria-labelledby="frequencyOfService-label"><g:fieldValue bean="${contractInstance}" field="frequencyOfService"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.billingFrequency}">
				<li class="fieldcontain">
					<span id="billingFrequency-label" class="property-label"><g:message code="contract.billingFrequency.label" default="Billing Frequency" /></span>
					
						<span class="property-value" aria-labelledby="billingFrequency-label"><g:fieldValue bean="${contractInstance}" field="billingFrequency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.nominalCode}">
				<li class="fieldcontain">
					<span id="nominalCode-label" class="property-label"><g:message code="contract.nominalCode.label" default="Nominal Code" /></span>
					
						<span class="property-value" aria-labelledby="nominalCode-label"><g:fieldValue bean="${contractInstance}" field="nominalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="contract.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${contractInstance?.client?.id}">${contractInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.contractAmount}">
				<li class="fieldcontain">
					<span id="contractAmount-label" class="property-label"><g:message code="contract.contractAmount.label" default="Contract Amount" /></span>
					
						<span class="property-value" aria-labelledby="contractAmount-label"><g:fieldValue bean="${contractInstance}" field="contractAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.contractType}">
				<li class="fieldcontain">
					<span id="contractType-label" class="property-label"><g:message code="contract.contractType.label" default="Contract Type" /></span>
					
						<span class="property-value" aria-labelledby="contractType-label"><g:link controller="supplierType" action="show" id="${contractInstance?.contractType?.id}">${contractInstance?.contractType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.contractor}">
				<li class="fieldcontain">
					<span id="contractor-label" class="property-label"><g:message code="contract.contractor.label" default="Contractor" /></span>
					
						<span class="property-value" aria-labelledby="contractor-label"><g:link controller="supplier" action="show" id="${contractInstance?.contractor?.id}">${contractInstance?.contractor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.nextReviewDate}">
				<li class="fieldcontain">
					<span id="nextReviewDate-label" class="property-label"><g:message code="contract.nextReviewDate.label" default="Next Review Date" /></span>
					
						<span class="property-value" aria-labelledby="nextReviewDate-label"><g:formatDate date="${contractInstance?.nextReviewDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.ref}">
				<li class="fieldcontain">
					<span id="ref-label" class="property-label"><g:message code="contract.ref.label" default="Ref" /></span>
					
						<span class="property-value" aria-labelledby="ref-label"><g:fieldValue bean="${contractInstance}" field="ref"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contractInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contractInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
