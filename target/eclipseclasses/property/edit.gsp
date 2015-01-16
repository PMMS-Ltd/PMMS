<%@ page import="uk.org.pmms.Property" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
		<h1 class="page-header"><g:message code="default.edit.label" args="[entityName]" /> ${propertyInstance.propertyId }</h1>
			<div id="edit-property" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
				
				<g:if test="${flash.message}">
				<div class="alert">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${propertyInstance}">
				
					<g:eachError bean="${propertyInstance}" var="error">
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
		<div class="hidden-xs">
		<g:form url="[resource:propertyInstance, action:'update']" class="form" method="PUT">
			<div class="row">
				<g:render template="form"/>
			</div>
			<div class="row">
				<button name="update" class="btn btn-sm btn-success"><i class="fa fa-fw fa-lg fa-refresh"></i> Update</button>
				<g:link class="btn btn-sm btn-danger" action="index"><i class="fa fa-fw fa-lg fa-times"></i> Cancel</g:link>
			</div>
			</g:form>
		</div>
		<div class="visible-xs">
		<g:form url="[resource:propertyInstance, action:'update']" class="form" method="PUT">
			<div class="row">
				<g:render template="form-small"/>
			</div>
			<div class="row">
				<g:submitButton name="update" class="btn btn-sm btn-success" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<g:link class="btn btn-sm btn-danger" action="index"> Cancel</g:link>
			</div>
		</g:form>
		</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Search Owners</h4>
			</div>
			<div class="modal-body">
				<form class="form">
					<div class="input-group">
					<input type="hidden" name="popUp" value="true"/>
						<input type="text" name="search" class="form-control"> <span
							class="input-group-btn"> <!--<button class="btn btn-default" type="button"><i class="fa fa-search"></i> Search</button>-->
							<g:submitToRemote update="updateMe" class="btn btn-default"
								value="Search" url="[controller: 'person', action: 'personSearch']"></g:submitToRemote>
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
 	
 	$('#ownerId').attr("value",$(this).find('#personId').attr('value'));
 	$('#ownerDetails').removeClass('hidden');
 	$('#ownerDetails #name p').html($(this).find('h4').html());
 	$('#ownerDetails #address p').html($(this).find('input#address').attr('value'));
 	$('#ownerDetails #town p').html($(this).find('input#town').attr('value'));
 	$('#ownerDetails #county p').html($(this).find('input#county').attr('value'));
 	$('#ownerDetails #postcode p').html($(this).find('input#postcode').attr('value'));
 	$('#ownerDetails #country p').html($(this).find('input#country').attr('value'));
 	$('#myModal').modal('hide')
 
 
 });
 $('#addNewOwnerBtn').click(function(){
 	$('#newOwnerDetails').removeClass('hidden');
 	$('#newOwnerDetails').append('<input type="hidden" name="createNewOwner" value="true"/>');
 	
 })
</g:javascript>
	</body>
</html>
