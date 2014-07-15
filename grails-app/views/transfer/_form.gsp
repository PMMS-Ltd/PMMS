<%@ page import="uk.org.pmms.Transfer" %>

<div class="form-group">
	<label for="client" class="control-label col-xs-4">Client</label>
	<div class="col-xs-4">
		<g:select id="client" name="client" from="${uk.org.pmms.Client.list(order: 'asc', sort: 'clientId')}" value="${transferInstance?.prop?.client?.id}" noSelection="${['':'']}" optionKey="id" required="" class="form-control" onChange="${remoteFunction(action:'getPropsByClient', controller: 'property', update:'prop', params: '\'id=\' + this.value') }"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'prop', 'has-error')} required">
	<label for="prop" class="control-label col-xs-4">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="transfer.prop.label" default="Property ID" />
	</label>
	<div class="col-xs-4">
		<g:select id="prop" name="prop.id" class="form-control" noSelection="${['':'']}" from="${uk.org.pmms.Property.list(order: 'asc', sort: 'propertyId')}" optionKey="id" required="" value="${transferInstance?.prop?.id}"></g:select>
	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'vSolicitor', 'has-error')} required">
	<label for="vSolicitor" class="control-label col-xs-4">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="transfer.vSolicitor.label" default="V Solicitor" />
	</label>
	<div class="col-xs-8">
		<a href="#" class="btn btn-info btn-sm" data-toggle="modal" data-target="#vSolSearch" id="selectVSol"><i class="fa fa-fw fa-search"></i> Select Solicitor</a>
		<a href="#" class="btn btn-success btn-sm" id="addVSol"><i class="fa fa-fw fa-plus"></i> Add New</a>
		
		
	
	<div class="form-horizontal ${transferInstance.vSolicitor? '':'hidden' }" id="vSolDetails">
	<!-- <input type="hidden" id="vSolId" name="vSolicitor.id" value="${transferInstance?.vSolicitor?.id }"></input>-->
		<div class="form-group" id="name">
			<label for="nameField" class="control-label col-xs-3">Name</label>
			<p class="form-control-static col-xs-9" id="nameField">${transferInstance?.vSolicitor?.name }</p>
		</div>
		<div class="form-group" id="address">
			<label for="addressField" class="control-label col-xs-3">Address</label>
			<p class="form-control-static col-xs-9" id="addressField">${transferInstance?.vSolicitor?.address?.address1 }<br />${transferInstance?.vSolicitor?.address?.address2 }</p>
		</div>
		<div class="form-group" id="town">
			<label for="townField" class="control-label col-xs-3">Town</label>
			<p class="form-control-static col-xs-9" id="townField">${transferInstance?.vSolicitor?.address?.town }</p>
		</div>
		<div class="form-group" id="county">
			<label for="countyField" class="control-label col-xs-3">County</label>
			<p class="form-control-static col-xs-9" id="countyField"${transferInstance?.vSolicitor?.address?.county }></p>
		</div>
		<div class="form-group" id="postcode">
			<label for="postcodeField" class="control-label col-xs-3">Post Code</label>
			<p class="form-control-static col-xs-9" id="postcodeField">${transferInstance?.vSolicitor?.address?.postCode }</p>
		</div>
		<div class="form-group" id="country">
			<label for="countryField" class="control-label col-xs-3">Country</label>
			<p class="form-control-static col-xs-9" id="countryField">${transferInstance?.vSolicitor?.address?.country }</p>
		</div>
	</div>
	</div>
</div>
<div id="newVSol" class="hidden">
	<div class="form-group">
		<label class="control-label col-xs-4">Company Name</label>
		<div class="col-xs-6">
			<input type="text" class="form-control" name="vSolicitor.name">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-4">Address</label>
		<div class="col-xs-6">
			<input type="text" class="form-control" name="vSolicitor.address.address1">
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-6 col-xs-offset-4">
			<input type="text" class="form-control" name="vSolicitor.address.address2">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-4">Town</label>
		<div class="col-xs-6">
			<input type="text" class="form-control" name="vSolicitor.adress.town">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-4">County</label>
		<div class="col-xs-6">
			<input type="text" class="form-control" name="vSolicitor.address.county">
		</div>
	</div>
	<div class="form-group" id="postcode">
		<label for="postcodeField" class="control-label col-xs-4">Post Code</label>
		<div class="col-xs-6">
			<input type="text" class="form-control" name="vSolicitor.address.postCode">
		</div>
	</div>
	<div class="form-group" id="country">
		<label for="countryField" class="control-label col-xs-4">Country</label>
		<div class="col-xs-6">
			<input type="text" class="form-control" name="vSolicitor.address.country">
			<input type="hidden" name="vSolicitor.workType.id" value="1">
		</div>
	</div>
</div>
<div class="form-group ${hasErrors(bean: transferInstance, field: 'vSolictorRef', 'has-error')} required">
	<label for="vSolictorRef" class="control-label col-xs-4">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="transfer.vSolictorRef.label" default="V Solictor Ref" />
	</label>
	<div class="col-xs-6">
		<g:textField class="form-control" name="vSolictorRef" required="" value="${transferInstance?.vSolictorRef}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'feeReceived', 'has-error')} ">
	<label for="feeReceived" class="control-label col-xs-4">
		<g:message code="transfer.feeReceived.label" default="Fee Received" />
		
	</label>
	<div class="col-xs-8">
		<div class="checkbox">
        <label>
          <input type="checkbox" name="receivedFee" id="receivedFee" ${transferInstance?.feeReceived ? 'checked' : '' }>
        </label>
      </div>
	</div>
</div>