
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
			<h1 class="page-header">Transfers
		<div class="btn-group">
  <a href="#" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </a>
  
  <ul class="dropdown-menu" role="menu">
  
    <li><g:link
     action="create" resource="${transfer}">
				<i class="fa fa-plus fa-fw text-success"></i> Add New</g:link></li>
  </ul>

</div></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
			<div class="col-lg-10">
			<table class="table table-bordered">
			<thead>
					<tr >
						<g:sortableColumn property="id" class="text-center" title="${message(code: 'transfer.id.label', default: 'Transfer No.')}" />
						
						<g:sortableColumn property="prop" class="text-center" title="Property"/>
						
						<g:sortableColumn property="dateCreated" class="text-center" title="Date Informed"/>
						
						<!--<g:sortableColumn property="completionDate" class="text-center" title="${message(code: 'transfer.completionDate.label', default: 'Completion Date')}" />
					
						<g:sortableColumn property="feeReceived" class="text-center" title="${message(code: 'transfer.feeReceived.label', default: 'Fee Received')}" />
					
						<g:sortableColumn property="copypackSent" class="text-center" title="${message(code: 'transfer.copypackSent.label', default: 'Copypack Sent')}" />
					
						<th class="text-center"><g:message code="transfer.newOwner.label" default="New Owner" /></th>-->
					
						<g:sortableColumn property="status" class="text-center" title="${message(code: 'transfer.status.label', default: 'Status')}" />
						<g:sortableColumn property="lastUpdated" class="text-center" title="${message(code: 'transfer.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transferInstanceList}" status="i" var="transferInstance">
					<tr class="text-center">
						<td><g:link action="show" id="${transferInstance.id}">${fieldValue(bean: transferInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: transferInstance, field: "prop")}</td>
						<td><g:formatDate date="${transferInstance.dateCreated}" format="dd/MM/yyyy"/></td>
						<!--<td>${fieldValue(bean: transferInstance, field: "completionDate")}</td>
					
						<td><g:formatDate date="${transferInstance.feeReceived}" /></td>
					
						<td><g:formatDate date="${transferInstance.copypackSent}" /></td>
					
						<td>${fieldValue(bean: transferInstance, field: "newOwner")}</td>-->						
					
						<td><span class="label status-${transferInstance?.status.toLowerCase() }">${fieldValue(bean: transferInstance, field: "status")}</span></td>
						<td><g:formatDate date="${transferInstance.lastUpdated}" format="dd/MM/yyyy"/></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</div>
		</div>
	</body>
</html>
