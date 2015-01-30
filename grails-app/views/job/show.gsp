
<%@ page import="uk.org.pmms.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-job" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list job">
			
				<g:if test="${jobInstance?.contractor}">
				<li class="fieldcontain">
					<span id="contractor-label" class="property-label"><g:message code="job.contractor.label" default="Contractor" /></span>
					
						<span class="property-value" aria-labelledby="contractor-label"><g:link controller="supplier" action="show" id="${jobInstance?.contractor?.id}">${jobInstance?.contractor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.assignedTo}">
				<li class="fieldcontain">
					<span id="assignedTo-label" class="property-label"><g:message code="job.assignedTo.label" default="Assigned To" /></span>
					
						<span class="property-value" aria-labelledby="assignedTo-label"><g:fieldValue bean="${jobInstance}" field="assignedTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="job.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${jobInstance?.client?.id}">${jobInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="job.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${jobInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.enteredBy}">
				<li class="fieldcontain">
					<span id="enteredBy-label" class="property-label"><g:message code="job.enteredBy.label" default="Entered By" /></span>
					
						<span class="property-value" aria-labelledby="enteredBy-label"><g:fieldValue bean="${jobInstance}" field="enteredBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.faultDetails}">
				<li class="fieldcontain">
					<span id="faultDetails-label" class="property-label"><g:message code="job.faultDetails.label" default="Fault Details" /></span>
					
						<span class="property-value" aria-labelledby="faultDetails-label"><g:fieldValue bean="${jobInstance}" field="faultDetails"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="job.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${jobInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="job.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${jobInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobInstance?.reportedBy}">
				<li class="fieldcontain">
					<span id="reportedBy-label" class="property-label"><g:message code="job.reportedBy.label" default="Reported By" /></span>
					
						<span class="property-value" aria-labelledby="reportedBy-label"><g:link controller="person" action="show" id="${jobInstance?.reportedBy?.id}">${jobInstance?.reportedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:jobInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${jobInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
