<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-job" class="content scaffold-create" role="main">
			<h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${jobInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${jobInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="col-lg-6">
				<g:render template="/issue/issue" model="issueInstance: issueInstance"/>			
			</div>
			<div class="col-lg-6">
			<g:form url="[resource:jobInstance, action:'save']" class="form form-horizontal">
				<fieldset class="form">
					<input type="hidden" name="issues" value="${issueInstance.id }">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<button name="create" class="btn btn-success btn-sm"><i class="fa fa-fw fa-save"></i> Create</button>
					<a name="cancel" class="btn btn-default btn-sm" onclick="javascript:window.history.back();"><i class="fa fa-fw fa-times"></i> Cancel</a>
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
