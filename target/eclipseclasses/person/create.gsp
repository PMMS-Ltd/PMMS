<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="alert">${flash.message}</div>
				</g:if>
			<div id="create-client" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<g:form url="[resource:personInstance, action:'save']" class="form">
				<g:render template="form"/>
				<button name="create" class="btn btn-sm btn-success"><i class="fa fa-fw fa-lg fa-save"></i> Create</button>
			</g:form>
		</div>
	</body>
</html>
