<%@ page import="uk.org.pmms.Property"%>

<div class="col-lg-4">
	<div class="form-inline col-xs-12" style="margin-bottom: 15px;">
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'client', 'has-error')} col-lg-4 required">
			<label for="client" class="control-label"> <span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="property.client.label" default="Client" /></label>
			<g:select id="client" name="client.id"
				from="${uk.org.pmms.Client.list()}" optionKey="id" required=""
				value="${propertyInstance?.client?.id}" class="form-control" />
		</div>
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'propertyId', 'has-error')} col-lg-4 required">
			<label for="propertyId" class="control-label"> <span
				class="fa fa-asterisk fa-fw text-danger"></span> <g:message
					code="property.propertyId.label" default="Property Id" />
			</label>
			<g:textField class="form-control" name="propertyId"
				pattern="${propertyInstance.constraints.propertyId.matches}"
				required="" value="${propertyInstance?.propertyId}" />
		</div>
		<div
			class="form-group ${hasErrors(bean: propertyInstance, field: 'propertyType', 'has-error')} col-lg-4 required">
			<label for="client" class="control-label"> <span
				class="fa fa-asterisk fa-fw text-danger"></span> <g:message
					code="property.propertyType.label" default="Property Type" />
			</label>

			<g:select id="propertyType" name="propertyType"
				from="${propertyInstance.constraints.propertyType.inList}"
				value="${propertyInstance?.propertyType}" class="form-control" />
		</div>
	</div>
	<div class="form-horizontal">
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
<div class="col-lg-4">
<h2>
		Owner
		<!-- Button trigger modal -->
		<a href="#" class="btn btn-primary btn-sm" data-toggle="modal"
			data-target="#myModal">Change Owner</a>
	</h2>
	<input type="hidden" class="form-control-static" id="ownerId" name="owner.id" value="${propertyInstance?.owner?.id }"></input>
	
	<div class="form-horizontal ${propertyInstance.owner? '':'hidden' }" id="ownerDetails">
		<div class="form-group" id="name">
			<label for="nameField" class="control-label col-xs-3">Name</label>
			<p class="form-control-static col-xs-9" id="nameField">${propertyInstance?.owner?.lastName }, ${propertyInstance?.owner?.firstName } (${propertyInstance?.owner?.salutation })</p>
		</div>
		<div class="form-group" id="address">
			<label for="addressField" class="control-label col-xs-3">Address</label>
			<p class="form-control-static col-xs-9" id="addressField">${propertyInstance?.owner?.address?.address1 }<br />${propertyInstance?.owner?.address?.address2 }</p>
		</div>
		<div class="form-group" id="town">
			<label for="townField" class="control-label col-xs-3">Town</label>
			<p class="form-control-static col-xs-9" id="townField">${propertyInstance?.owner?.address?.town }</p>
		</div>
		<div class="form-group" id="county">
			<label for="countyField" class="control-label col-xs-3">County</label>
			<p class="form-control-static col-xs-9" id="countyField"${propertyInstance?.owner?.address?.county }></p>
		</div>
		<div class="form-group" id="postcode">
			<label for="postcodeField" class="control-label col-xs-3">Post Code</label>
			<p class="form-control-static col-xs-9" id="postcodeField">${propertyInstance?.owner?.address?.postCode }</p>
		</div>
		<div class="form-group" id="country">
			<label for="countryField" class="control-label col-xs-3">Country</label>
			<p class="form-control-static col-xs-9" id="countryField">${propertyInstance?.owner?.address?.country }</p>
		</div>
	</div>
</div>