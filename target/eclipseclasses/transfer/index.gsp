
<%@ page import="uk.org.pmms.Transfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transfer.label', default: 'Transfer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-transfer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-transfer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="completionDate" title="${message(code: 'transfer.completionDate.label', default: 'Completion Date')}" />
					
						<g:sortableColumn property="feeReceived" title="${message(code: 'transfer.feeReceived.label', default: 'Fee Received')}" />
					
						<g:sortableColumn property="copypackSent" title="${message(code: 'transfer.copypackSent.label', default: 'Copypack Sent')}" />
					
						<th><g:message code="transfer.newOwner.label" default="New Owner" /></th>
					
						<th><g:message code="transfer.prop.label" default="Prop" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'transfer.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transferInstanceList}" status="i" var="transferInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transferInstance.id}">${fieldValue(bean: transferInstance, field: "completionDate")}</g:link></td>
					
						<td><g:formatDate date="${transferInstance.feeReceived}" /></td>
					
						<td><g:formatDate date="${transferInstance.copypackSent}" /></td>
					
						<td>${fieldValue(bean: transferInstance, field: "newOwner")}</td>
					
						<td>${fieldValue(bean: transferInstance, field: "prop")}</td>
					
						<td>${fieldValue(bean: transferInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${transferInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
