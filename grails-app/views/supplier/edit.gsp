<%@ page import="uk.org.pmms.Supplier" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	<h1 class="page-header"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		<div class="col-lg-10" role="main">
			
			<g:hasErrors bean="${supplierInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${supplierInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:supplierInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${supplierInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-sm btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
			<g:form url="[resource:supplierInstance, action:'delete']" method="DELETE">
						<g:actionSubmit class="btn btn-sm btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:form>
		</div>
	</body>
</html>
