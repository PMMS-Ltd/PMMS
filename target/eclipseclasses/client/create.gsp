<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div id="create-client" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
				<h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="alert">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${clientInstance}">
				
					<g:eachError bean="${clientInstance}" var="error">
					<div class="alert alert-danger alert-dismissable" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<g:message error="${error}"/>
					</div>
					</g:eachError>
				
				</g:hasErrors>
			</div>
			<div class="visible-xs">
				<h3 class="page-title"><g:message code="default.create.label" args="[entityName]" /></h3>
			</div>
		</div>
		<div class="col-lg-8 col-md-10 col-sm-12 hidden-xs">
		<g:form url="[controller:'client', action:'save']" class="form form-horizontal" >
			<div class="row">
				<g:render template="form"/>
			</div>
			<div class="row">
				<button name="create" class="btn btn-sm btn-success"><i class="fa fa-fw fa-lg fa-save"></i> Create</button>
			</div>
		</g:form>
		</div>
		<div class="visible-xs">
		<g:form url="[controller:'client', action:'save']" class="form" >
			<div class="row">
				<g:render template="form-small"/>
			</div>
			<div class="row">
					<fieldset>
						<g:submitButton name="create" class="btn btn-sm btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
			</div>
		</g:form>
		</div>	
	</body>
</html>
