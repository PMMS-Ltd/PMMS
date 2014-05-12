
<%@ page import="uk.org.pmms.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		
		<div class="page-header">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
		</div>
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group">
				<sec:ifAnyGranted roles="ROLE_ADMIN"><g:link class="btn btn-success" action="create" controller="client">Add New</g:link></sec:ifAnyGranted>
			</div>
		</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="col-md-6">
			<table class="table">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="clientId" title="${message(code: 'client.clientId.label', default: 'Client Id')}" />
					
						<g:sortableColumn property="yearStart" title="${message(code: 'client.yearStart.label', default: 'Year Start')}" />
					
						<g:sortableColumn property="yearEnd" title="${message(code: 'client.yearEnd.label', default: 'Year End')}" />
					
						<g:sortableColumn property="accountName" title="${message(code: 'client.accountName.label', default: 'Account Name')}" />
					
						<g:sortableColumn property="accountNo" title="${message(code: 'client.accountNo.label', default: 'Account No')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: clientInstance, field: "clientId")}</td>
					
						<td><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearStart}" /></td>
					
						<td><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearEnd}" /></td>
					
						<td>${fieldValue(bean: clientInstance, field: "accountName")}</td>
					
						<td><g:formatNumber number="${clientInstance.accountNo}" format="########" minIntegerDigits="8" /></td>
						
						<!--<g:formatNumber number="${clientInstance.accountNo}" type="number" minIntegerDigits="8" />-->
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
