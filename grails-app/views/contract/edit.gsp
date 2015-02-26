<%@ page import="uk.org.pmms.Contract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require module="datepicker"/>
	</head>
	<body>
		<div id="edit-contract" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:form url="[resource:contractInstance, action:'update']" method="PUT" class="form form-horizontal">
			<div class="row">
				<g:render template="form"/>
			</div>
			<div class="row">
				<button name="update" class="btn btn-sm btn-success"><i class="fa fa-fw fa-refresh"></i> Update</button>
				<a class="btn btn-sm btn-default" href="#" onclick="javascript:window.history.back();"><i class="fa fa-fw fa-times"></i> Cancel</a>
			</div>
		</g:form>
		</div>
		</div>
	</body>
</html>
