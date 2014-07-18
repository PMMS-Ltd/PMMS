
<%@ page import="uk.org.pmms.Property" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="col-xs-12" role="main">
			<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="propertyId" title="${message(code: 'property.propertyId.label', default: 'Property Id')}" />
						
						<g:sortableColumn property="client" title="${message(code: 'property.client.label', default: 'Client')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'property.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="owner" title="${message(code: 'property.owner.label', default: 'Owner')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${propertyInstanceList}" status="i" var="propertyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${propertyInstance.id}">${fieldValue(bean: propertyInstance, field: "propertyId")}</g:link></td>
						
						<td><g:link controller="client" action="show" id="${propertyInstance.client.id}">${fieldValue(bean: propertyInstance, field: "client")}</g:link></td>
					
						<td>${fieldValue(bean: propertyInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: propertyInstance, field: "owner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${propertyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
