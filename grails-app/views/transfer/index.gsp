
<%@ page import="uk.org.pmms.Transfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'transfer.label', default: 'Transfer')}" />
		<title>Transfers</title>
	</head>
	<body>
		<div id="list-transfer" class="content scaffold-list" role="main">
			<h1 class="page-header">All Transfers
		<div class="btn-group">
  <a href="#" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </a>
  
  <ul class="dropdown-menu" role="menu">
  
    <li><g:link
     action="create" resource="${client}">
				<i class="fa fa-plus fa-fw"></i> <g:message code="default.button.create.label" default="Add New" /></g:link></li>
  </ul>

</div></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="col-lg-10">
			<table class="table">
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
		</div>
	</body>
</html>
