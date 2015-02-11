<%@ page import="uk.org.pmms.SiteVisit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'siteVisit.label', default: 'SiteVisit')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require module="datepicker"/>
	</head>
	<body>
		
		<div>
			<h1 class="page-header"><g:message code="default.edit.label" args="[entityName]" /> ${siteVisitInstance.id }</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${siteVisitInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${siteVisitInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="col-lg-4">
			<g:form url="[resource:siteVisitInstance, action:'update']" method="PUT" class="form form-horizontal">
				<g:hiddenField name="version" value="${siteVisitInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
