
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
				<g:render template="issue" model="[issueInstance: issueInstance]"/>
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
