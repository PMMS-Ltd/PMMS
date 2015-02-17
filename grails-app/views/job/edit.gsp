<%@ page import="uk.org.pmms.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="edit-job" class="content scaffold-edit" role="main">
			<h1 class="page-header"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!--<g:hasErrors bean="${jobInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${jobInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>-->
			<div class="col-lg-6">
			<g:form url="[resource:jobInstance, action:'update']" method="PUT" class="form form-horizontal">
				<g:hiddenField name="version" value="${jobInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<button class="btn btn-success btn-sm"><i class="fa fa-fw fa-refresh"></i> Update</button>
					<g:link action="show" id="${jobInstance.id }" class="btn btn-sm btn-default"><i class="fa fa-fw fa-times"></i> Cancel</g:link>
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
