<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pmms">
		<g:set var="entityName" value="${message(code: 'serviceCharge.label', default: 'ServiceCharge')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="create-serviceCharge" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${serviceChargeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${serviceChargeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="col-lg-6 col-md-10 col-sm-12 hidden-xs">
			<g:form url="[resource:serviceChargeInstance, action:'save']" class="form-horizontal">
					<g:render template="form"/>
				
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
