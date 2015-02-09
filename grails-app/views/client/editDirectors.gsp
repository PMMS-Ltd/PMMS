<%@ page import="uk.org.pmms.Client"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'client.label', default: 'Client')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-xs-8">
			<h1 class="page-header">${clientInstance.name } <small>(${clientInstance.clientId})</small></h1>
		</div>
		<div class="col-xs-4">
			<h3 class="pull-right page-header">Edit Directors List</h3>
		</div>
	</div> <!-- end of row -->
	<hr />
		
	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>
	<div class="hidden-xs">
		<div class="row">
			<g:form url="[resource: clientInstance, action:'update']" class="form form-horizontal" method="PUT">
					<g:render template="directors" />
			</g:form>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<g:link action="show" id="${clientInstance.id }" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-arrow-left"></i> Back</g:link>
			</div>
		</div>
	</div>
</body>
</html>
