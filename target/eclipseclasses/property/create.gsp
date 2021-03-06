<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div id="create-client" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
				<h1 class="page-title"><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form url="[resource:propertyInstance, action:'save']" class="form" >
				<div class="row">
				<g:render template="form"/>
				</div>	
				<div class="row">
				<fieldset>					
					<button name="create" type="submit" class="btn btn btn-success"><i class="fa fa-floppy-o fa-fw fa-lg"></i> Create</button>
				</fieldset>
				</div>		
			</g:form>		
		</div>
		<div class="visible-xs">
		<g:form url="[resource:propertyInstance, action:'save']" class="form" >
			<div class="row">
				<g:render template="form-small"/>
			</div>
			<div class="row">
					<fieldset>
						<button name="create" class="btn btn-sm btn-success pull-right"><i class="fa fa-floppy-o"></i> Create</button>
					</fieldset>
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
						<input type="text" name="q" class="form-control"> <span
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

</g:javascript>
	</body>
</html>
