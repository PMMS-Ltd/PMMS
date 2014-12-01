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

	<div id="edit-client" class="col-lg-8 col-md-10 col-sm-12 hidden-xs"
		role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${clientInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${clientInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		</div>
		<div class="col-lg-8 col-md-10 col-sm-12 hidden-xs">
			<g:form url="[resource: clientInstance, action:'update']"
				class="form form-horizontal" method="PUT">
				<div class="row">
					<g:render template="form" />
				</div>
				<div class="row">
					<fieldset>
							<button id="updateBtn" class="btn btn-sm btn-success"><i class="fa fa-fw fa-refresh"></i> Update</button>
							<g:link class="btn btn-sm btn-default" action="show" id="${clientInstance.id }"><i class="fa fa-fw fa-times"></i> Cancel</g:link>
					</fieldset>
				</div>
			</g:form>
		</div>
		<g:if test="${clientInstance.accounts.size() > 0 }">
			<div class="col-lg-4" id="accountsTable">
				<g:render template="/bankAccount/accounts" model="['clientInstance':clientInstance]"/>
			</div>
		</g:if>
		<div class="visible-xs">
			<g:form url="[controller:'client', action:'save']" class="form"  method="PUT">
				<div class="row">
					<g:render template="form-small" />
				</div>
				<div class="row">
					<fieldset>
						<button class="btn btn-sm btn-success"><i class="fa fa-fw fa-refresh"></i> Update</button>
					</fieldset>
				</div>
			</g:form>
		</div>
</body>
</html>
