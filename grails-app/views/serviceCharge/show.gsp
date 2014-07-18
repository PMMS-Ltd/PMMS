
<%@ page import="uk.org.pmms.accounts.ServiceCharge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'serviceCharge.label', default: 'ServiceCharge')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-serviceCharge" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serviceCharge">
			
				<g:if test="${serviceChargeInstance?.annualAmount}">
				<li class="fieldcontain">
					<span id="annualAmount-label" class="property-label"><g:message code="serviceCharge.annualAmount.label" default="Annual Amount" /></span>
					
						<span class="property-value" aria-labelledby="annualAmount-label"><g:fieldValue bean="${serviceChargeInstance}" field="annualAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.halfYearlyAmount}">
				<li class="fieldcontain">
					<span id="halfYearlyAmount-label" class="property-label"><g:message code="serviceCharge.halfYearlyAmount.label" default="Half Yearly Amount" /></span>
					
						<span class="property-value" aria-labelledby="halfYearlyAmount-label"><g:fieldValue bean="${serviceChargeInstance}" field="halfYearlyAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.quarterlyAmount}">
				<li class="fieldcontain">
					<span id="quarterlyAmount-label" class="property-label"><g:message code="serviceCharge.quarterlyAmount.label" default="Quarterly Amount" /></span>
					
						<span class="property-value" aria-labelledby="quarterlyAmount-label"><g:fieldValue bean="${serviceChargeInstance}" field="quarterlyAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.monthlyAmount}">
				<li class="fieldcontain">
					<span id="monthlyAmount-label" class="property-label"><g:message code="serviceCharge.monthlyAmount.label" default="Monthly Amount" /></span>
					
						<span class="property-value" aria-labelledby="monthlyAmount-label"><g:fieldValue bean="${serviceChargeInstance}" field="monthlyAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="serviceCharge.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${serviceChargeInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.groundRent}">
				<li class="fieldcontain">
					<span id="groundRent-label" class="property-label"><g:message code="serviceCharge.groundRent.label" default="Ground Rent" /></span>
					
						<span class="property-value" aria-labelledby="groundRent-label"><g:fieldValue bean="${serviceChargeInstance}" field="groundRent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.serviceCharge}">
				<li class="fieldcontain">
					<span id="serviceCharge-label" class="property-label"><g:message code="serviceCharge.serviceCharge.label" default="Service Charge" /></span>
					
						<span class="property-value" aria-labelledby="serviceCharge-label"><g:fieldValue bean="${serviceChargeInstance}" field="serviceCharge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.serviceChargeType}">
				<li class="fieldcontain">
					<span id="serviceChargeType-label" class="property-label"><g:message code="serviceCharge.serviceChargeType.label" default="Service Charge Type" /></span>
					
						<span class="property-value" aria-labelledby="serviceChargeType-label"><g:link controller="serviceChargeType" action="show" id="${serviceChargeInstance?.serviceChargeType?.id}">${serviceChargeInstance?.serviceChargeType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceChargeInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="serviceCharge.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${serviceChargeInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:serviceChargeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serviceChargeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
