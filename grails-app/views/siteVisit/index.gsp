
<%@ page import="uk.org.pmms.SiteVisit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'siteVisit.label', default: 'SiteVisit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="calendar"/>
	</head>
	<body>
		<h1 class="page-header">Scheduled Site Visits
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
<hr />
			<g:if test="${flash.message}">
		<r:script>
				new PNotify({
				    text: '${flash.message}',
				    type: '${flash.type ? flash.type : 'info' }',
				    icon: '${flash.icon ? flash.icon : 'false' }',
				    mouse_reset: false
				});
			</r:script>
	</g:if>
			<div class="row">
			<div class="col-lg-4">
			<table class="table table-bordered">
			<thead>
					<tr class="bg-primary">
					<th style="width: 80px;"></th>
						<g:sortableColumn property="id" title="${message(code: 'siteVisit.id.label', default: 'Visit ID')}" class="text-center" />
						<g:sortableColumn property="visitStartDate" title="${message(code: 'siteVisit.visitStartDate.label', default: 'Visit Date')}" class="text-center" />
						<g:sortableColumn property="client" title="${message(code:'siteVisit.client.label', default:'Client')}" class="text-center"/>
						<g:sortableColumn property="approved" title="${message(code:'siteVisit.approved.label', default:'Status')}" class="text-center"/>
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteVisitInstanceList}" status="i" var="siteVisitInstance">
					<tr>
						<td><g:link class="btn btn-xs btn-primary" action="show" id="${siteVisitInstance.id }"><i class="fa fa-fw fa-eye"></i> View</g:link></td>
						<td class="text-center">${siteVisitInstance.id }</td>
						<td class="text-center"><g:formatDate date="${siteVisitInstance.visitStartDate}" format="dd/MM/yyyy HH:mm"/> - <g:formatDate date="${siteVisitInstance.visitEndDate}" format="dd/MM/yyyy HH:mm"/></td>
						<td class="text-center">${fieldValue(bean: siteVisitInstance, field: "client")}</td>
						<td class="text-center"><span class="label label-${siteVisitInstance.status.replace(' ','-').toLowerCase() }">${siteVisitInstance.status }</span>				
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteVisitInstanceCount ?: 0}" />
			</div>
			</div>
			<div class="col-lg-8">
				<div id="siteVisitCalendar"></div>
			</div>
		</div>
		<r:script>
			$("#siteVisitCalendar").fullCalendar({
				firstDay: 1,
				weekends: false,
				minTime: "08:00:00",
				maxTime: "20:00:00",
				header:{
					left: 'prev, today, next',
					center: 'title',
					right: 'month, agendaWeek, agendaDay'
				},
				buttonIcons:{
					prev: 'left-single-arrow',
				    next: 'right-single-arrow'
				},
				eventSources: [
						{url: '${request.contextPath}/siteVisit/events'},
				],
				contentHeight: 600,
				editable: true,
				selectable: true
				});
		</r:script>
	</body>
</html>
