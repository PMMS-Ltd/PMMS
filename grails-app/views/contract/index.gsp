
<%@ page import="uk.org.pmms.Contract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contract" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="startDate" title="${message(code: 'contract.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'contract.endDate.label', default: 'End Date')}" />
					
						<th><g:message code="contract.client.label" default="Client" /></th>
					
						<th><g:message code="contract.contractType.label" default="Contract Type" /></th>
					
						<th><g:message code="contract.contractor.label" default="Contractor" /></th>
					
						<g:sortableColumn property="ref" title="${message(code: 'contract.ref.label', default: 'Ref')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contractInstanceList}" status="i" var="contractInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contractInstance.id}">${fieldValue(bean: contractInstance, field: "startDate")}</g:link></td>
					
						<td><g:formatDate date="${contractInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: contractInstance, field: "client")}</td>
					
						<td>${fieldValue(bean: contractInstance, field: "contractType")}</td>
					
						<td>${fieldValue(bean: contractInstance, field: "contractor")}</td>
					
						<td>${fieldValue(bean: contractInstance, field: "ref")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contractInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
