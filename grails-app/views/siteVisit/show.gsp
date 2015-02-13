
<%@ page import="uk.org.pmms.SiteVisit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'siteVisit.label', default: 'SiteVisit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<div class="row hidden-xs">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Site Visit Details</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<tr>
								<th>Visit ID</th>
								<td>${siteVisitInstance.id }</td>
								<th>Client Name</th>
								<td>${siteVisitInstance.client.name }</td>
							</tr>
							<tr>
								<th>Visit Date</th>
								<td><g:formatDate date="${siteVisitInstance.visitStartDate }" format="dd/MM/yyyy"/> <g:formatDate date="${siteVisitInstance.visitStartDate }" format="HH:mm"/> - <g:formatDate date="${siteVisitInstance.visitEndDate }" format="HH:mm"/></td>
								<th>Status</th>
								<td class="text-center"><span class="label label-${siteVisitInstance?.status.replace(' ','-').toLowerCase()}">${siteVisitInstance?.status}</span></td>
							</tr>
							<tr>
								<th>Details</th>
								<td colspan="3">${siteVisitInstance.details }</td>
							</tr>
							<tr>
								<th>Jobs</th>
								<td colspan=3>
									<table class="table">
										<g:each in="${siteVisitInstance?.jobs }" var="job">
											<tr>
												<th>${job.id }</th>
												<td>${job.faultDetails }</td>
											</tr>
										</g:each>
									</table>
								</td>
							</tr>
						</table>
						<sec:ifAllGranted roles="ROLE_APPROVERS">
			<g:if test="${!siteVisitInstance.approved && siteVisitInstance.status == 'Draft'}">
				<g:link class="btn btn-sm btn-success" action="approveVisit" id="${siteVisitInstance.id}"><i class="fa fa-fw fa-thumbs-up"></i> Approve Visit</g:link>
				<g:link class="btn btn-sm btn-danger" action="rejectVisit" id="${siteVisitInstance.id}"><i class="fa fa-fw fa-thumbs-down"></i> Reject Visit</g:link>
			</g:if>
			</sec:ifAllGranted>
			<g:if test="${siteVisitInstance.status == 'Draft' || siteVisitInstance.status == 'Rejected' }">
				<g:form url="[resource:siteVisitInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${siteVisitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				

			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
					<a href="#activity" aria-controls="activity" role="tab" data-toggle="tab">Activity</a>
				</li>
				<li role="presentation">
					<a href="#files" aria-controls="files" role="tab" data-toggle="tab">Files</a>
				</li>
			</ul>
			<div class="tab-content">
				
				<div role="tabpanel" class="tab-pane active" id="activity">
					<g:render template="../templates/auditLog" model="[objectId: siteVisitInstance.id, objectType: 'SiteVisit']" />
				</div>
				<div role="tabpanel" class="tab-pane" id="files">
					<p class="text-muted">No files present</p>
				</div>
			</div>
		</div>
</div>
	</body>
</html>
