<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
		<div id="create-supplier" class="col-xs-8" role="main">
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${supplierInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${supplierInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:supplierInstance, action:'save']" >
				<div class="row">
					<g:render template="form"/>
				</div>
				<div class="row">
					<g:submitButton name="create" class="btn btn-sm btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
