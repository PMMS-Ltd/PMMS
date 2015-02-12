
<%@ page import="uk.org.pmms.Contract"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'contract.label', default: 'Contract')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<h1 class="page-header">
		${contractInstance?.ref }<br /><small>${contractInstance?.client } - ${contractInstance?.contractor } (${contractInstance?.contractType })</small>
	</h1>
	<g:if test="${flash.message}">
		<r:script>
				new PNotify({
				    //title: 'Notification',
				    text: '${flash.message}',
				    type: 'info',
				    icon: false,
				    mouse_reset: false
				});
			</r:script>
	</g:if>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Contract Details
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs"
								data-toggle="dropdown"> <i class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation">
									<g:link class="edit" action="edit" resource="${contractInstance}">
										<i class="fa fa-pencil-square-o fa-fw"></i> Edit
									</g:link>
								</li>
							</ul>
						</div>
					</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered">
						<tr>
							<th>Contractor</th>
							<td>
								${contractInstance?.contractor }
							</td>
							<th><g:message code="contract.contractType.label"
									default="Contracted Service" /></th>
							<td>
								${contractInstance?.contractType}
							</td>
						</tr>
						<tr>
							<th><g:message code="contract.startDate.label"
									default="Start Date" /></th>
							<td><g:formatDate date="${contractInstance?.startDate}"
									format="dd/MM/yyyy" /></td>

							<th><g:message code="contract.endDate.label"
									default="End Date" /></th>
							<td><g:formatDate date="${contractInstance?.endDate}"
									format="dd/MM/yyyy" /></td>
						</tr>
						<tr>
							<th><g:message code="contract.client.label" default="Client" /></th>
							<td><g:link controller="client" action="show"
									id="${contractInstance?.client?.id}">
									${contractInstance?.client?.name}
								</g:link></td>

							<th><g:message code="contract.contractAmount.label"
									default="Total Contract Cost" /></th>
							<td><g:formatNumber
									number="${contractInstance?.contractAmount}" type="currency"
									currencyCode="GBP" currencySymbol="£" /></td>
						</tr>
						<tr>
							<th><g:message code="contract.frequencyOfService.label"
									default="Frequency Of Service" /></th>
							<td>
								${contractInstance?.frequencyOfService}
							</td>

							<th><g:message code="contract.billingFrequency.label"
									default="Billing Frequency" /></th>
							<td>
								${contractInstance?.billingFrequency}
							</td>
						</tr>
						<tr>
							<th><g:message code="contract.usualDay.label"
									default="Usual Attendance Day" /></th>
							<td>
								${contractInstance?.usualDay}
							</td>

							<th><g:message code="contract.nominalCode.label"
									default="Nominal Code" /></th>
							<td>
								${contractInstance?.nominalCode}
							</td>
						</tr>
						<tr>
							<th><g:message code="contract.nextReviewDate.label"
									default="Next Review Date" /></th>
							<td><g:formatDate date="${contractInstance?.nextReviewDate}"
									format="dd/MM/yyyy" /></td>

							<th><g:message code="contract.ref.label"
									default="Contract Reference" /></th>
							<td>
								${contractInstance?.ref}
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#files"
					aria-controls="files" role="tab" data-toggle="tab">Files</a></li>
				<li role="presentation"><a href="#activity"
					aria-controls="activity" role="tab" data-toggle="tab">Activity</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="files">
					<g:render template="../templates/files" model="[files: files]" />
				</div>
				<div role="tabpanel" class="tab-pane" id="activity">
					<g:render template="../templates/auditLog"
						model="[objectId: contractInstance.id, objectType: 'Contract']" />
				</div>
			</div>
		</div>
	</div><!-- end of row -->
	<div class="row" style="margin-top: 25px;">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa fw fa-comment-o"></i> Notes <button class="btn btn-xs btn-default pull-right" data-toggle="modal" data-target="#addNote"><i class="fa fa-fw fa-plus"></i></button></h3>
				</div>
				<div class="panel-body">
					<div class="list-group">
						<g:each in="${contractInstance?.notes }" var="note">
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
						<input type="hidden" name="repoFolderId" value="${contractInstance?.repoFolderId}"/>
						<input type="hidden" name="objectId" value="${contractInstance?.id}"/>
						<input type="hidden" name="objectType" value="Contract"/>
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
					
	<g:render template="../templates/uploadFileTemplate"
		model="[folder: contractInstance.repoFolderId, objectId: contractInstance.id, objectType: 'Contract']" />
</body>
</html>
