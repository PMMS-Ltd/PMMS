
<%@ page import="uk.org.pmms.SiteVisit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'siteVisit.label', default: 'SiteVisit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-siteVisit" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<div class="col-lg-6">
			<ol class="property-list siteVisit">
			
				<g:if test="${siteVisitInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="siteVisit.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${siteVisitInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteVisitInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="siteVisit.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${siteVisitInstance?.client?.id}">${siteVisitInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteVisitInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="siteVisit.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${siteVisitInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteVisitInstance?.jobs}">
				<li class="fieldcontain">
					<span id="jobs-label" class="property-label"><g:message code="siteVisit.jobs.label" default="Jobs" /></span>
					
						<g:each in="${siteVisitInstance.jobs}" var="j">
						<span class="property-value" aria-labelledby="jobs-label"><g:link controller="job" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${siteVisitInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="siteVisit.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${siteVisitInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteVisitInstance?.visitStartDate}">
				<li class="fieldcontain">
					<span id="visitDate-label" class="property-label"><g:message code="siteVisit.visitStartDate.label" default="Visit Start Date" /></span>
					
						<span class="property-value" aria-labelledby="visitDate-label"><g:formatDate date="${siteVisitInstance?.visitStartDate}" /></span>
					
				</li>
				</g:if>
				<g:if test="${siteVisitInstance?.visitEndDate}">
				<li class="fieldcontain">
					<span id="visitDate-label" class="property-label"><g:message code="siteVisit.visitEndDate.label" default="Visit End Date" /></span>
					
						<span class="property-value" aria-labelledby="visitDate-label"><g:formatDate date="${siteVisitInstance?.visitEndDate}" /></span>
					
				</li>
				</g:if>
				<li>
					Status - <span class="label label-${siteVisitInstance?.status.replace(' ','-').toLowerCase()}">${siteVisitInstance?.status}</span>
				</li>
			</ol>
			<g:if test="${siteVisitInstance.approved == false }">
			<g:link class="btn btn-sm btn-success" action="approveVisit" id="${siteVisitInstance.id}"><i class="fa fa-fw fa-check"></i> Approve Visit</g:link>
			</g:if>
			<g:form url="[resource:siteVisitInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${siteVisitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
			<div class="col-lg-6">
				<g:if test="${siteVisitInstance.approved}">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Approval Status</h3>
						</div>
						<div class="pabel-body">
							<table class="table table-bordered">
								<tr>
									<th>Approved By</th>
									<td>${siteVisitInstance.approver }</td>
								</tr>
								<tr>
									<th>Approval Date</th>
									<td><g:formatDate date="${siteVisitInstance.approvalDate }" format="dd/MM/yyyy"/></td>
								</tr>
							</table>
						</div>
					</div>
				</g:if>
			</div>
		</div>
	</body>
</html>
