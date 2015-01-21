<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-contract" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<div class="col-lg-8 col-md-10 col-sm-12 hidden-xs">
		<g:form url="[controller:'contract', action:'save']" class="form form-horizontal" >
			<div class="row">
				<g:render template="form"/>
			</div>
			<div class="row">
				<button name="create" class="btn btn-sm btn-success"><i class="fa fa-fw fa-lg fa-save"></i> Create</button>
			</div>
		</g:form>
		</div>
		</div>
	</body>
</html>
