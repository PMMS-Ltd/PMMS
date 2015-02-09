<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'issue.label', default: 'Issue')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1 class="page-header">Create Issue</h1>
		<hr />
		<div id="create-issue" class="content scaffold-create" role="main">
		
			<g:hasErrors bean="${issueInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${issueInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="col-lg-6">
			<g:form url="[resource:issueInstance, action:'save']" class="form form-horizontal" >
					<g:render template="form"/>
					<button type="submit" name="create" class="btn btn-sm btn-success"><i class="fa fa-fw fa-save"></i> Save</button>
			</g:form>
			</div>
		</div>
	</body>
</html>
