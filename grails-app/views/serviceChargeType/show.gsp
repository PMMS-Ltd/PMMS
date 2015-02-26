
<%@ page import="uk.org.pmms.accounts.ServiceChargeType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'serviceChargeType.label', default: 'ServiceChargeType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-serviceChargeType" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serviceChargeType">
			
				<g:if test="${serviceChargeTypeInstance?.annually}">
				<li class="fieldcontain">
					<span id="annually-label" class="property-label"><g:message code="serviceChargeType.annually.label" default="Annually" /></span>
					
						<span class="property-value" aria-labelledby="annually-label"><g:formatBoolean boolean="${serviceChargeTypeInstance?.annually}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeTypeInstance?.charges}">
				<li class="fieldcontain">
					<span id="charges-label" class="property-label"><g:message code="serviceChargeType.charges.label" default="Charges" /></span>
					
						<g:each in="${serviceChargeTypeInstance.charges}" var="c">
						<span class="property-value" aria-labelledby="charges-label"><g:link controller="serviceCharge" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeTypeInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="serviceChargeType.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${serviceChargeTypeInstance?.client?.id}">${serviceChargeTypeInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="serviceChargeType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${serviceChargeTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeTypeInstance?.halfYearly}">
				<li class="fieldcontain">
					<span id="halfYearly-label" class="property-label"><g:message code="serviceChargeType.halfYearly.label" default="Half Yearly" /></span>
					
						<span class="property-value" aria-labelledby="halfYearly-label"><g:formatBoolean boolean="${serviceChargeTypeInstance?.halfYearly}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeTypeInstance?.monthly}">
				<li class="fieldcontain">
					<span id="monthly-label" class="property-label"><g:message code="serviceChargeType.monthly.label" default="Monthly" /></span>
					
						<span class="property-value" aria-labelledby="monthly-label"><g:formatBoolean boolean="${serviceChargeTypeInstance?.monthly}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeTypeInstance?.quarterly}">
				<li class="fieldcontain">
					<span id="quarterly-label" class="property-label"><g:message code="serviceChargeType.quarterly.label" default="Quarterly" /></span>
					
						<span class="property-value" aria-labelledby="quarterly-label"><g:formatBoolean boolean="${serviceChargeTypeInstance?.quarterly}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeTypeInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="serviceChargeType.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${serviceChargeTypeInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:serviceChargeTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serviceChargeTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
