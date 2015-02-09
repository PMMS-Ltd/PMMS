
<%@ page import="uk.org.pmms.Issue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'issue.label', default: 'Issue')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-issue" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<div class="col-lg-6">
			<ol class="property-list issue">
			
				<g:if test="${issueInstance?.issueDescription}">
				<li class="fieldcontain">
					<span id="issueDescription-label" class="property-label"><g:message code="issue.issueDescription.label" default="Issue Description" /></span>
					
						<span class="property-value" aria-labelledby="issueDescription-label"><g:fieldValue bean="${issueInstance}" field="issueDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="issue.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${issueInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.jobId}">
				<li class="fieldcontain">
					<span id="jobId-label" class="property-label"><g:message code="issue.jobId.label" default="Job Id" /></span>
					
						<span class="property-value" aria-labelledby="jobId-label"><g:link controller="job" action="show" id="${issueInstance?.jobId?.id}">${issueInstance?.jobId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.assignedTo}">
				<li class="fieldcontain">
					<span id="assignedTo-label" class="property-label"><g:message code="issue.assignedTo.label" default="Assigned To" /></span>
					
						<span class="property-value" aria-labelledby="assignedTo-label"><g:fieldValue bean="${issueInstance}" field="assignedTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.clientId}">
				<li class="fieldcontain">
					<span id="clientId-label" class="property-label"><g:message code="issue.clientId.label" default="Client Id" /></span>
					
						<span class="property-value" aria-labelledby="clientId-label"><g:link controller="client" action="show" id="${issueInstance?.clientId?.id}">${issueInstance?.clientId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.closedDate}">
				<li class="fieldcontain">
					<span id="closedDate-label" class="property-label"><g:message code="issue.closedDate.label" default="Closed Date" /></span>
					
						<span class="property-value" aria-labelledby="closedDate-label"><g:formatDate date="${issueInstance?.closedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="issue.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${issueInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="issue.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${issueInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.reporterEmail}">
				<li class="fieldcontain">
					<span id="reporterEmail-label" class="property-label"><g:message code="issue.reporterEmail.label" default="Reporter Email" /></span>
					
						<span class="property-value" aria-labelledby="reporterEmail-label"><g:fieldValue bean="${issueInstance}" field="reporterEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.reporterName}">
				<li class="fieldcontain">
					<span id="reporterName-label" class="property-label"><g:message code="issue.reporterName.label" default="Reporter Name" /></span>
					
						<span class="property-value" aria-labelledby="reporterName-label"><g:fieldValue bean="${issueInstance}" field="reporterName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.reporterPhone}">
				<li class="fieldcontain">
					<span id="reporterPhone-label" class="property-label"><g:message code="issue.reporterPhone.label" default="Reporter Phone" /></span>
					
						<span class="property-value" aria-labelledby="reporterPhone-label"><g:fieldValue bean="${issueInstance}" field="reporterPhone"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:issueInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${issueInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa fw fa-comment-o"></i> Notes <button class="btn btn-xs btn-default pull-right" data-toggle="modal" data-target="#addNote"><i class="fa fa-fw fa-plus"></i></button></h3>
				</div>
				<div class="panel-body">
					<div class="list-group">
						<g:each in="${issueInstance?.notes }" var="note">
							<div class="list-group-item">
								<div class="row">
									<div class="col-xs-1">
										<i class="fa fa-fw fa-user fa-3x"></i>
									</div>
									<div class="col-xs-8">
										<span>${note.noteUser }</span>
										<p class="list-group-item-text">${note.noteBody }</p>
										<span class="text-right" style="font-size: 0.8em;"><g:formatDate date="${note.dateCreated }" format="dd/MM/yyyy HH:mm"/></span>
									</div>
									<div class="col-xs-2">
										<g:if test="${note.attachments.size() > 0 }">
											<g:link class="btn btn-sm btn-success pull-right" controller="utils" action="downloadDocument" params="[documentId: note.attachments]"><i class="fa fa-fw fa-download"></i></g:link>
										</g:if>
									</div>
								</div>
							</div>
						</g:each>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="addNote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Add Note</h4>
			</div>
			
					<g:uploadForm controller="note" action="save" class="form form-horizontal">
					<div class="modal-body">
						<input type="hidden" name="noteUser" value="${sec.loggedInUserInfo(field: 'username')}"/>
						<input type="hidden" name="repoFolderId" value="${contractInstance?.repoFolderId}"/>
						<input type="hidden" name="objectId" value="${issueInstance?.id}"/>
						<input type="hidden" name="objectType" value="Issue"/>
						<div class="form-group">
						    <label for="noteBody" class="col-xs-2 control-label">Note:</label>
						    <div class="col-xs-7">
								<textarea class="form-control input-sm" rows="4"  name="noteBody" style="resize:none;"></textarea>
						    </div>
						    <div class="col-sm-2">
							    <div class="radio">
							    	<label class="radio">
									  <input type="radio" name="noteType" id="noteType1" value="Private" checked> Private
									</label>
								</div>
								<div class="radio">
									<label class="radio">
									  <input type="radio" name="noteType" id="noteType2" value="Public"> Public
									</label>
								</div>
						    </div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-2" for="myFile">Attachment:</label>
							<div class="col-xs-7">
								<input type="file" name="myFile" class="form-control input-sm"/>
							</div>
							
						</div>
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<button class="btn btn-primary btn-sm"><i class="fa fa-fw fa-plus"></i> Add Note</button>
								<button class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-fw fa-times"></i> Cancel</button>
							</div>	
						</div>
					</g:uploadForm>
					</div>
					</div>
					</div>

	</body>
</html>
