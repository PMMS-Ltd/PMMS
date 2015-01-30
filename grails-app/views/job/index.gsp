
<%@ page import="uk.org.pmms.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1 class="page-header">job
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
		<!-- <a href="#list-job" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-job" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>-->
			<table class="table table-striped">
			<thead>
					<tr>
					
						<th><g:message code="job.contractor.label" default="Contractor" /></th>
					
						<g:sortableColumn property="assignedTo" title="${message(code: 'job.assignedTo.label', default: 'Assigned To')}" />
					
						<th><g:message code="job.client.label" default="Client" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'job.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enteredBy" title="${message(code: 'job.enteredBy.label', default: 'Entered By')}" />
					
						<g:sortableColumn property="faultDetails" title="${message(code: 'job.faultDetails.label', default: 'Fault Details')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${jobInstanceList}" status="i" var="jobInstance">
					<tr>
					
						<td><g:link action="show" id="${jobInstance.id}">${fieldValue(bean: jobInstance, field: "contractor")}</g:link></td>
					
						<td>${fieldValue(bean: jobInstance, field: "assignedTo")}</td>
					
						<td>${fieldValue(bean: jobInstance, field: "client")}</td>
					
						<td><g:formatDate date="${jobInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: jobInstance, field: "enteredBy")}</td>
					
						<td>${fieldValue(bean: jobInstance, field: "faultDetails")}</td>
					
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
