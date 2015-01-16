<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
		<div class="col-xs-3" role="main">
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${contractInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contractInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:contractInstance, action:'save']" >
					<g:render template="form"/>
					<button name="create" class="btn btn-sm btn-success"><i class="fa fa-save fa-fw"></i> Create</button>
			</g:form>
		</div>
	</body>
</html>
