
<%@ page import="uk.org.pmms.reporting.ReportTemplate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'reportTemplate.label', default: 'ReportTemplate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-reportTemplate" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reportTemplate">
			
				<g:if test="${reportTemplateInstance?.dataFields}">
				<li class="fieldcontain">
					<span id="dataFields-label" class="property-label"><g:message code="reportTemplate.dataFields.label" default="Data Fields" /></span>
					
						<g:each in="${reportTemplateInstance.dataFields}" var="d">
						<span class="property-value" aria-labelledby="dataFields-label"><g:link controller="dataField" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${reportTemplateInstance?.docServerTemplate}">
				<li class="fieldcontain">
					<span id="docServerTemplate-label" class="property-label"><g:message code="reportTemplate.docServerTemplate.label" default="Doc Server Template" /></span>
					
						<span class="property-value" aria-labelledby="docServerTemplate-label"><g:fieldValue bean="${reportTemplateInstance}" field="docServerTemplate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportTemplateInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="reportTemplate.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${reportTemplateInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reportTemplateInstance?.parentObject}">
				<li class="fieldcontain">
					<span id="parentObject-label" class="property-label"><g:message code="reportTemplate.parentObject.label" default="Parent Object" /></span>
					
						<span class="property-value" aria-labelledby="parentObject-label"><g:fieldValue bean="${reportTemplateInstance}" field="parentObject"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form controller="lettersAndMailings" action="">
				
			</g:form>
			<g:form url="[resource:reportTemplateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reportTemplateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
