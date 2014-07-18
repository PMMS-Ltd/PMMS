<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'transfer.label', default: 'Transfer')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div id="create-client" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
				<h1 class="page-title"><g:message code="default.create.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="alert">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${transferInstance}">
				
					<g:eachError bean="${transferInstance}" var="error">
					<div class="alert alert-danger alert-dismissable" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<g:message error="${error}"/>
					</div>
					</g:eachError>
				
				</g:hasErrors>
			</div>
			<div class="visible-xs">
				<h3 class="page-title"><g:message code="default.create.label" args="[entityName]" /></h3>
			</div>
		</div>
		<div class="col-lg-6 col-md-8 col-sm-10 hidden-xs">
		<g:form url="[resource:transferInstance, action:'save']" class="form form-horizontal" >
			<div class="row">
				<g:render template="form"/>
			</div>
			<div class="row">
					<fieldset>
						<g:submitButton name="create" class="btn btn-sm btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
			</div>
		</g:form>
		</div>
		<div class="visible-xs">
		<g:form url="[resource:transferInstance, action:'save']" class="form" >
			<div class="row">
				<g:render template="form-small"/>
			</div>
			<div class="row">
					<fieldset>
						<g:submitButton name="create" class="btn btn-sm btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
			</div>
		</g:form>
		</div>
		<div class="modal fade" id="vSolSearch" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Search Solicitors</h4>
			</div>
			<div class="modal-body">
				<form class="form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"> <span
							class="input-group-btn">
							<g:submitToRemote update="updateMe" class="btn btn-default"
								value="Search" url="[controller: 'supplier', action: 'search']"></g:submitToRemote>
						</span>
					</div>
					<!-- /input-group -->
				</form>
				<ul class="list-group" id="updateMe" style="margin-top: 15px;"></ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
		<g:javascript>
 $(document).on("click", ".list-group-item", function(){
 	
 	$('#vSolDetails').removeClass('hidden');
 	$('#vSolDetails #name p').html($(this).find('h4').html());
 	$('#vSolDetails #address p').html($(this).find('input#address').attr('value'));
 	$('#vSolDetails #town p').html($(this).find('input#town').attr('value'));
 	$('#vSolDetails #county p').html($(this).find('input#county').attr('value'));
 	$('#vSolDetails #postcode p').html($(this).find('input#postcode').attr('value'));
 	$('#vSolDetails #country p').html($(this).find('input#country').attr('value'));
 	$('#vSolDetails').append('<input type="hidden" name="vSolicitor.id" value="'+$(this).find('#supplierId').attr('value')+'"/>')
 	$('#vSolSearch').modal('hide');
 	$('#selectVSol').toggle();
 
 
 });
 $('#addVSol').click(function(){
 	$('#newVSol').removeClass('hidden');
 	$('#addVSol').attr('disabled','disabled');
 });
</g:javascript>
	</body>
</html>
