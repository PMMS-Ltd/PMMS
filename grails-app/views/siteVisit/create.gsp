<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'siteVisit.label', default: 'SiteVisit')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<r:require modules="datepicker, multiSelect"/>
	</head>
	<body>
		<div>
			<h1 class="page-header">Request Site Visit</h1>
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
			<g:form url="[resource:siteVisitInstance, action:'save']" class="form form-horizontal">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<button class="btn btn-success btn-sm"><i class="fa fa-fw fa-save"></i> Create</button>
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
