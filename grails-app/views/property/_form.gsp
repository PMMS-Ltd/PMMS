<%@ page import="uk.org.pmms.Property"%>

<div class="col-lg-6">
	<div class="form-inline col-xs-12" style="margin-bottom: 15px;">
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'client', 'has-error')} col-lg-3 required">
			<label for="client" class="control-label"> <span
				class="fa fa-asterisk fa-fw text-danger"></span>
			<g:message code="property.client.label" default="Client" /></label>
			<g:select id="client" name="client.id"
				from="${uk.org.pmms.Client.list()}" optionKey="id" required=""
				value="${propertyInstance?.client?.id}" class="form-control" />
		</div>
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'propertyId', 'has-error')} col-lg-3 required">
			<label for="propertyId" class="control-label"> <span
				class="fa fa-asterisk fa-fw text-danger"></span> <g:message
					code="property.propertyId.label" default="Property Id" />
			</label>
			<g:textField class="form-control" name="propertyId"
				pattern="${propertyInstance.constraints.propertyId.matches}"
				required="" value="${propertyInstance?.propertyId}" />
		</div>
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'propertyType', 'has-error')} col-lg-3 required">
			<label for="client" class="control-label"> <span
				class="fa fa-asterisk fa-fw text-danger"></span> <g:message
					code="property.propertyType.label" default="Property Type" />
			</label>

			<g:select id="propertyType" name="propertyType"
				from="${propertyInstance.constraints.propertyType.inList}"
				value="${propertyInstance?.propertyType}" class="form-control" />
		</div>
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'serviceChargeType', 'has-error')} col-lg-3 required">
			<label for="client" class="control-label"> <g:message
					code="property.serviceChargeType.label"
					default="Service Charge Category" />
			</label>

			<g:select id="serviceChargeType" name="serviceChargeType"
				from="${uk.org.pmms.accounts.ServiceChargeType.findAllByClient(propertyInstance?.client)}"
				value="${propertyInstance?.serviceChargeType}" optionKey="id"
				class="form-control" />
		</div>
	</div>
	<div class="form-horizontal col-xs-8">
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'address.unitNo', 'has-error')} ">
			<label for="address.unitNo" class="control-label col-xs-4 col-lg-3">
				<g:message code="address.unitNo.label" default="Unit No" />
			</label>
			<div class="col-xs-4 col-md-2 col-lg-2">
				<g:textField class="form-control" name="address.unitNo"
					maxlength="5" value="${propertyInstance?.address?.unitNo}" />
			</div>
		</div>

		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'address.address1', 'has-error')} required">
			<label for="addrress.address1"
				class="control-label col-xs-4 col-lg-3"> <span
				class="fa fa-asterisk fa-fw text-danger"></span> <g:message
					code="address.address1.label" default="Address1" />
			</label>
			<div class="col-xs-8 col-md-6 col-lg-8">
				<g:textField class="form-control" name="address.address1"
					maxlength="50" required=""
					value="${propertyInstance?.address?.address1}" />
			</div>
		</div>

		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'address.address2', 'has-error')} ">
			<label for="address.address2" class="control-label col-xs-4 col-lg-3">
				<g:message code="address.address2.label" default="Address2" />

			</label>
			<div class="col-xs-8 col-md-6 col-lg-8">
				<g:textField class="form-control" name="address.address2"
					maxlength="50" value="${propertyInstance?.address?.address2}" />
			</div>
		</div>

		<div class="form-group">
			<label for="address.town" class="control-label col-xs-2 col-lg-3 ">
				<g:message code="address.town.label" default="Town" />
			</label>
			<div
				class="col-xs-6 col-md-2 col-lg-5 ${hasErrors(bean: propertyInstance, field: 'address.town', 'has-error')} ">
				<g:textField class="form-control" name="address.town"
					value="${propertyInstance?.address?.town}" />
			</div>
		</div>
		<div class="form-group">
			<label for="address.county" class="control-label col-xs-2 col-lg-3">
				<g:message code="address.county.label" default="County" />

			</label>
			<div class="col-xs-6 col-md-3 col-lg-5">
				<g:textField
					class="form-control  ${hasErrors(bean: propertyInstance, field: 'address.county', 'has-error')}"
					name="address.county" value="${propertyInstance?.address?.county}" />
			</div>
		</div>

		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'address.postCode', 'has-error')} required">
			<label for="address.postCode" class="control-label col-xs-4 col-lg-3">
				<span class="fa fa-asterisk fa-fw text-danger"></span> <g:message
					code="address.postCode.label" default="Post Code" />
			</label>
			<div class="col-xs-6 col-md-3 col-lg-4">
				<g:textField class="form-control" name="address.postCode"
					required="" value="${propertyInstance?.address?.postCode}" />
			</div>
		</div>

		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'address.country', 'has-error')} required">
			<label for="address.country" class="control-label col-xs-4 col-lg-3">
				<span class="fa fa-asterisk fa-fw text-danger"></span> <g:message
					code="address.country.label" default="Country" />
			</label>
			<div class="col-xs-6 col-md-3 col-lg-4">
				<g:textField class="form-control" name="address.country" required=""
					value="${propertyInstance?.address?.country}" />
			</div>
		</div>
	</div>
</div>
<div class="col-lg-6">
	<h2>
		Owner
		<a href="#" class="btn btn-primary btn-sm" data-toggle="modal"
			data-target="#myModal">Change Owner</a> <a href="#"
			class="btn btn-sm btn-success" id="addNewOwnerBtn"><i class="fa fa-fw fa-plus"></i>
			Add New Owner</a>
	</h2>
	<input type="hidden" class="form-control-static" id="ownerId"
		name="owner.id" value="${propertyInstance?.owner?.id }"></input>

	<div class="form-horizontal ${propertyInstance.owner? '':'hidden' }"
		id="ownerDetails">
		<div class="form-group" id="name">
			<label for="nameField" class="control-label col-xs-3 col-lg-2">Name</label>
			<p class="form-control-static col-xs-9" id="nameField">
				${propertyInstance?.owner?.lastName }, ${propertyInstance?.owner?.firstName } (${propertyInstance?.owner?.salutation })
			</p>
		</div>
		<div class="form-group" id="address">
			<label for="addressField" class="control-label col-xs-3 col-lg-2">Address</label>
			<p class="form-control-static col-xs-9" id="addressField">
				${propertyInstance?.owner?.address?.address1 }<br />
				${propertyInstance?.owner?.address?.address2 }
			</p>
		</div>
		<div class="form-group" id="town">
			<label for="townField" class="control-label col-xs-3 col-lg-2">Town</label>
			<p class="form-control-static col-xs-9" id="townField">
				${propertyInstance?.owner?.address?.town }
			</p>
		</div>
		<div class="form-group" id="county">
			<label for="countyField" class="control-label col-xs-3 col-lg-2">County</label>
			<p class="form-control-static col-xs-9" id="countyField"
				${propertyInstance?.owner?.address?.county }></p>
		</div>
		<div class="form-group" id="postcode">
			<label for="postcodeField" class="control-label col-xs-3 col-lg-2">Post
				Code</label>
			<p class="form-control-static col-xs-9" id="postcodeField">
				${propertyInstance?.owner?.address?.postCode }
			</p>
		</div>
		<div class="form-group" id="country">
			<label for="countryField" class="control-label col-xs-3 col-lg-2">Country</label>
			<p class="form-control-static col-xs-9" id="countryField">
				${propertyInstance?.owner?.address?.country }
			</p>
		</div>
	</div>

	<div class="hidden" id="newOwnerDetails">
		<div class="row">
			<div class="form-inline">
				<div
					class="form-group ${hasErrors(bean: personInstance, field: 'salutation', 'has-error')} col-xs-2">
					<label for="salutation" class="sr-only"> <g:message
							code="person.salutation.label" default="Salutation" />
					</label>
					<g:textField class="form-control input-sm" name="owner.salutation"
						value="${personInstance?.salutation}" placeholder="Title" />
				</div>

				<div
					class="form-group ${hasErrors(bean: personInstance, field: 'firstName', 'has-error')}  col-xs-4">
					<label for="firstName" class="sr-only"> <g:message
							code="person.firstName.label" default="First Name" />
					</label>
					<g:textField class="form-control input-sm" name="owner.firstName"
						value="${personInstance?.firstName}" placeholder="First Name" />
				</div>

				<div
					class="form-group ${hasErrors(bean: personInstance, field: 'initial', 'has-error')}  col-xs-2">
					<label for="initial" class="sr-only"> <g:message
							code="person.initial.label" default="Initial" />
					</label>
					<g:textField class="form-control input-sm" name="owner.initial"
						value="${personInstance?.initial}" placeholder="Initial" />
				</div>

				<div
					class="form-group ${hasErrors(bean: personInstance, field: 'lastName', 'has-error')} required  col-xs-4">
					<label for="lastName" class="sr-only"> <g:message
							code="person.lastName.label" default="Last Name" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField class="form-control input-sm" name="owner.lastName"
						required="" value="${personInstance?.lastName}"
						placeholder="Last Name" />
				</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 15px;">
			<div id="postcodeLookup" class="form-inline">
				<div class="form-group">
					<label class="sr-only" for="unitNo">Unit No</label>
					<input type="text" class="form-control input-sm" id="unitNo" name="owner.address.unitNo" placeholder="Unit No" />
				</div>
				<div class="form-group">
					<label class="sr-only" for="postCode">Postcode</label>
					<input type="text" class="form-control input-sm" id="postcode" name="owner.address.postCode" placeholder="PostCode" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-sm btn-primary" id="pcSearch" name="postCode">Search</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8" style="margin-top: 15px;">
			<div id="addressForm" class="form-horizontal">
				<div class="form-group ${hasErrors(bean: personInstance, field: 'address.address1', 'has-error')} required">
					<label for="address.address1" class="control-label col-xs-4 col-lg-3">
						<span class="fa fa-asterisk fa-fw text-danger"></span>
						<g:message code="address.address1.label" default="Address1" />
					</label>
					<div class="col-lg-8">
						<g:textField class="form-control"name="owner.address.address1" maxlength="50" required=""/>
					</div>
				</div>

				<div class="form-group ${hasErrors(bean: personInstance, field: 'address.address2', 'has-error')} ">
					<label for="address.address2" class="control-label col-xs-4 col-lg-3">
						<g:message code="address.address2.label" default="Address2" />

					</label>
					<div class="col-xs-8">
						<g:textField class="form-control" name="owner.address.address2" maxlength="50" />
					</div>
				</div>

				<div class="form-group ${hasErrors(bean: personInstance, field: 'address.town', 'has-error')} ">
					<label for="address.town" class="control-label col-xs-4 col-lg-3">
						<g:message code="address.town.label" default="Town" />

					</label>
					<div class="col-xs-6">
						<g:textField class="form-control" name="owner.address.town"/>
					</div>
				</div>

				<div
					class="form-group ${hasErrors(bean: personInstance, field: 'address.county', 'has-error')} ">
					<label for="address.county" class="control-label col-xs-4 col-lg-3">
						<g:message code="address.county.label" default="County" />

					</label>
					<div class="col-xs-6">
						<g:textField class="form-control" name="owner.address.county" />
					</div>
				</div>
				<div
					class="form-group ${hasErrors(bean: personInstance, field: 'address.country', 'has-error')} required">
					<label for="address.country" class="control-label col-xs-4 col-lg-3">
						<span class="fa fa-asterisk fa-fw text-danger"></span>
						<g:message code="address.country.label" default="Country" />
					</label>
					<div class="col-xs-6">
						<g:textField class="form-control" name="owner.address.country" required=""/>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
<g:javascript>
	 $("#pcSearch").click(function(){
	 	$.ajax({
		    url: "${request.contextPath}/address/addressFinder" ,
		    type: "GET",
		    dataType: "text",
		    data: {postCode: $('input#postcode').val(), unitNo: $('input#unitNo').val()},
		    success: function(data){
		        var json = $.parseJSON(data);
		        
		     
		       $('#addressForm input[name="owner.address.address1"]').val(json.address1);
		       $('#addressForm input[name="owner.address.address2"]').val(json.address2);
		       $('#addressForm input[name="owner.address.town"]').val(json.town);
		       $('#addressForm input[name="owner.address.county"]').val(json.county);
		       $('#addressForm input[name="owner.address.country"]').val(json.country);
		       $('#addressForm').append('<input type="hidden" name="owner.address.id" value="'+json.id+'"/>')
		       
		   }
		})
	 });
</g:javascript>