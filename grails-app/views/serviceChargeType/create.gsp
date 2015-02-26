<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'serviceChargeType.label', default: 'ServiceChargeType')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1 class="page-header">Add Service Charge Type</h1>
		<div id="create-serviceChargeType" class="col-lg-6" role="main">
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${serviceChargeTypeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${serviceChargeTypeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:serviceChargeTypeInstance, action:'save']" class="form form-horizontal">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<button name="create" class="btn btn-success btn-sm"><i class="fa fa-fw fa-save"></i> Create</button>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
