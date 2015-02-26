
<%@ page import="uk.org.pmms.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" />
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
		
		<div id="list-job" class="content scaffold-list" role="main">
			
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered">
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'job.id.label', default: 'Job ID')}" class="text-center" style="width: 100px;"/>
						
						<g:sortableColumn property="client.id" title="${message(code: 'job.client.label', default: 'Client')}" class="text-center"/>
						<g:sortableColumn property="status" title="${message(code: 'job.status.label', default: 'Status')}" class="text-center col-xs-1"/>
						<g:sortableColumn property="faultDetails" title="${message(code: 'job.faultDetails.label', default: 'Fault Details / Location')}" />
						<th><g:message code="job.contractor.label" default="Contractor" /></th>
					
						<g:sortableColumn property="assignedTo" title="${message(code: 'job.assignedTo.label', default: 'Assigned To')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'job.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enteredBy" title="${message(code: 'job.enteredBy.label', default: 'Entered By')}" />
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${jobInstanceList}" status="i" var="jobInstance">
					<tr>
						<td><g:link action="show" class="btn btn-xs btn-default" id="${jobInstance.id}"><i class="fa fa-fw fa-eye"></i></g:link><span class="text-center">${jobInstance.id }</span></td>
						<td class="text-center">${fieldValue(bean: jobInstance, field: "client")}</td>
						<td class="text-center"><span class="label status-${jobInstance.status.replace(' ','-').toLowerCase() }">${jobInstance.status }</span></td>
						<td>${fieldValue(bean: jobInstance, field: "faultDetails")} - ${fieldValue(bean: jobInstance, field: "faultLocation")}</td>
						<td>${fieldValue(bean: jobInstance, field: "contractor")}</td>
					
						<td>${fieldValue(bean: jobInstance, field: "assignedTo")}</td>
					
						
					
						<td><g:formatDate date="${jobInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: jobInstance, field: "enteredBy")}</td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${jobInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
