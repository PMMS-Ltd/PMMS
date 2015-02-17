
<%@ page import="uk.org.pmms.Job"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'job.label', default: 'Job')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<h1 class="page-header">
		<g:message code="default.show.label" args="[entityName]" />
	</h1>
	<g:if test="${flash.message}">
		<div class="alert alert-warning" role="status">
			${flash.message}
		</div>
	</g:if>
	<div class="row">
		<div class="col-xs-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Job Details</h3>
				</div>
				<div class="panel-body">
					<ol class="property-list job">

						<g:if test="${jobInstance?.contractor}">
							<li class="fieldcontain"><span id="contractor-label"
								class="property-label"><g:message
										code="job.contractor.label" default="Contractor" /></span> <span
								class="property-value" aria-labelledby="contractor-label"><g:link
										controller="supplier" action="show"
										id="${jobInstance?.contractor?.id}">
										${jobInstance?.contractor?.encodeAsHTML()}
									</g:link></span></li>
						</g:if>

						<g:if test="${jobInstance?.assignedTo}">
							<li class="fieldcontain"><span id="assignedTo-label"
								class="property-label"><g:message
										code="job.assignedTo.label" default="Assigned To" /></span> <span
								class="property-value" aria-labelledby="assignedTo-label"><g:fieldValue
										bean="${jobInstance}" field="assignedTo" /></span></li>
						</g:if>

						<g:if test="${jobInstance?.client}">
							<li class="fieldcontain"><span id="client-label"
								class="property-label"><g:message code="job.client.label"
										default="Client" /></span> <span class="property-value"
								aria-labelledby="client-label"><g:link
										controller="client" action="show"
										id="${jobInstance?.client?.id}">
										${jobInstance?.client?.encodeAsHTML()}
									</g:link></span></li>
						</g:if>

						<g:if test="${jobInstance?.dateCreated}">
							<li class="fieldcontain"><span id="dateCreated-label"
								class="property-label"><g:message
										code="job.dateCreated.label" default="Date Created" /></span> <span
								class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
										date="${jobInstance?.dateCreated}" /></span></li>
						</g:if>

						<g:if test="${jobInstance?.enteredBy}">
							<li class="fieldcontain"><span id="enteredBy-label"
								class="property-label"><g:message
										code="job.enteredBy.label" default="Entered By" /></span> <span
								class="property-value" aria-labelledby="enteredBy-label"><g:fieldValue
										bean="${jobInstance}" field="enteredBy" /></span></li>
						</g:if>

						<g:if test="${jobInstance?.faultDetails}">
							<li class="fieldcontain"><span id="faultDetails-label"
								class="property-label"><g:message
										code="job.faultDetails.label" default="Fault Details" /></span> <span
								class="property-value" aria-labelledby="faultDetails-label"><g:fieldValue
										bean="${jobInstance}" field="faultDetails" /></span></li>
						</g:if>

						<g:if test="${jobInstance?.lastUpdated}">
							<li class="fieldcontain"><span id="lastUpdated-label"
								class="property-label"><g:message
										code="job.lastUpdated.label" default="Last Updated" /></span> <span
								class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
										date="${jobInstance?.lastUpdated}" /></span></li>
						</g:if>

						<g:if test="${jobInstance?.priority}">
							<li class="fieldcontain"><span id="priority-label"
								class="property-label"><g:message
										code="job.priority.label" default="Priority" /></span> <span
								class="property-value" aria-labelledby="priority-label"><g:fieldValue
										bean="${jobInstance}" field="priority" /></span></li>
						</g:if>

						<g:if test="${jobInstance?.reportedBy}">
							<li class="fieldcontain"><span id="reportedBy-label"
								class="property-label"><g:message
										code="job.reportedBy.label" default="Reported By" /></span> <span
								class="property-value" aria-labelledby="reportedBy-label"><g:link
										controller="person" action="show"
										id="${jobInstance?.reportedBy?.id}">
										${jobInstance?.reportedBy?.encodeAsHTML()}
									</g:link></span></li>
						</g:if>

					</ol>
				</div>
				<div class="panel-footer">
					<g:form url="[resource:jobInstance, action:'delete']"
						method="DELETE">
						<fieldset class="buttons">
							<g:link class="btn btn-default btn-sm" action="edit"
								resource="${jobInstance}">
								<i class="fa fa-fw fa-pencil"></i>
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="btn btn-danger btn-sm" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>


		</div>
		<div class="col-xs-6">
			<g:render template="../templates/auditLog"
				model="[objectId: jobInstance.id, objectType: 'Job']" />
		</div>
	</div> <!-- end of row -->
	<div class="row" style="margin-top: 25px;">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa fw fa-comment-o"></i> Notes <button class="btn btn-xs btn-default pull-right" data-toggle="modal" data-target="#addNote"><i class="fa fa-fw fa-plus"></i></button></h3>
				</div>
				<div class="panel-body">
					<div class="list-group">
						<g:each in="${jobInstance?.notes }" var="note">
							<div class="list-group-item">
								<div class="row">
									<div class="col-xs-10">
										<h4 class="list-group-item-heading"><g:formatDate date="${note.dateCreated }" format="dd/MM/yyyy HH:mm"/> - ${note.noteUser }</h4>
									<p class="list-group-item-text">${note.noteBody }</p>
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
						<input type="hidden" name="noteUser" value="${sec.loggedInUserInfo(field: 'displayName')}"/>
						<g:if test="${jobInstance.repoFolderId }">
							<input type="hidden" name="repoFolderId" value="${jobInstance?.repoFolderId}"/>
						</g:if>
						<input type="hidden" name="objectId" value="${jobInstance?.id}"/>
						<input type="hidden" name="objectType" value="Job"/>
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
						<g:if test="${jobInstance.repoFolderId }">
							<div class="form-group">
								<label class="control-label col-xs-2" for="myFile">Attachment:</label>
								<div class="col-xs-7">
									<input type="file" name="myFile" class="form-control input-sm"/>
								</div>
							</div>
						</g:if>
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
