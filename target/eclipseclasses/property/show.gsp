
<%@ page import="uk.org.pmms.Property" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-property" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list property">
			
				<g:if test="${propertyInstance?.propertyId}">
				<li class="fieldcontain">
					<span id="propertyId-label" class="property-label"><g:message code="property.propertyId.label" default="Property Id" /></span>
					
						<span class="property-value" aria-labelledby="propertyId-label"><g:fieldValue bean="${propertyInstance}" field="propertyId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propertyInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="property.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${propertyInstance?.address.id}">${propertyInstance?.address}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${propertyInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="property.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${propertyInstance?.client?.id}">${propertyInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${propertyInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="property.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="person" action="show" id="${propertyInstance?.owner?.id}">${propertyInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:propertyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${propertyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
