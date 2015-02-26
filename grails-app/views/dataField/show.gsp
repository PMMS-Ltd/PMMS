
<%@ page import="uk.org.pmms.reporting.DataField" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'dataField.label', default: 'DataField')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-dataField" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dataField">
			
				<g:if test="${dataFieldInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="dataField.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${dataFieldInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dataFieldInstance?.parentClass}">
				<li class="fieldcontain">
					<span id="parentClass-label" class="property-label"><g:message code="dataField.parentClass.label" default="Parent Class" /></span>
					
						<span class="property-value" aria-labelledby="parentClass-label"><g:fieldValue bean="${dataFieldInstance}" field="parentClass"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:dataFieldInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${dataFieldInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
