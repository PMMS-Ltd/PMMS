
<%@ page import="uk.org.pmms.Issue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'issue.label', default: 'Issue')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-xs-6">
			<h1 class="page-header">Issue Log
				<div class="btn-group">
  <a href="#" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </a>
  
  <ul class="dropdown-menu" role="menu">
  
    <sec:ifAnyGranted roles="ROLE_ADMIN">
    <li>
    <g:link action="create"><i class="fa fa-plus fa-fw text-success"></i> Add New</g:link>	
    </li>
    </sec:ifAnyGranted>
  </ul>

</div>
</h1>
			</div>
			
			<div class="col-xs-6" style="margin-top: 45px;">
				<form class="form-inline pull-right" id="clientSearchForm" method="post" action="${request.contextPath }/issue/search">
				<div class="form-group">
					<div class="input-group">
					<input type="text" class="form-control" id="issueSearch"
						placeholder="Search..." size="85" name="search"/>
						<span class="input-group-btn">
							<button class="btn btn-danger"><i class="fa fa-fw fa-search"></i></button>
						</span>
					</div>
				</div>
			</form>
			</div>
		</div>
		<hr />
			<table class="table table-bordered table-condensed">
			<thead>
					<tr>
						<th style="width: 80px;"></th>
						<g:sortableColumn property="id" title="${message(code: 'issue.id.label', default: 'Issue ID')}" class="col-xs-1 text-center"/>
						<g:sortableColumn property="clientId" title="${message(code: 'issue.client.label', default: 'Client')}" class="col-xs-1 text-center"/>
						<th>Reporter Name</th>
						<g:sortableColumn property="issueDescription" title="${message(code: 'issue.issueDescription.label', default: 'Issue Description')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'issue.status.label', default: 'Status')}" class="text-center" />
					
						<th><g:message code="issue.jobId.label" default="Job Id" /></th>
					
						<g:sortableColumn property="assignedTo" title="${message(code: 'issue.assignedTo.label', default: 'Assigned To')}" />
					
						<th>Age</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${issueInstanceList}" status="i" var="issueInstance">
					<tr class="text-center">
						<td><g:link class="btn btn-primary btn-sm" action="show" id="${issueInstance.id}"><i class="fa fa-fw fa-eye"></i> View</g:link></td>
						<td class="text-center">${fieldValue(bean: issueInstance, field: "id")}</td>
						<td>${fieldValue(bean: issueInstance, field: "clientId")}</td>
						<td>${fieldValue(bean: issueInstance, field: "reporterName")}</td>
						<td class="text-left">${fieldValue(bean: issueInstance, field: "issueDescription")}</td>
					
						<td><span class="label status-${issueInstance?.status.toLowerCase()}">${fieldValue(bean: issueInstance, field: "status")}</span></td>
					
						<td>${fieldValue(bean: issueInstance, field: "jobId")}</td>
					
						<td>${fieldValue(bean: issueInstance, field: "assignedTo")}</td>
					
						
						<td>
						<g:if test="${new Date() - issueInstance?.dateCreated == 0}">
							Today
						</g:if>
						<g:elseif test="${new Date() - issueInstance?.dateCreated == 1}">
							Yesterday
						</g:elseif>
						<g:else>
							${new Date() - issueInstance?.dateCreated } Days
						</g:else>
						</td>
						<!-- <td><g:formatDate date="${issueInstance.closedDate}" /></td>-->
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${issueInstanceCount ?: 0}" />
			</div>
	</body>
</html>
