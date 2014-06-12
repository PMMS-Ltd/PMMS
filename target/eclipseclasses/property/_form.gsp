<%@ page import="uk.org.pmms.Property" %>



<div class="form-group ${hasErrors(bean: propertyInstance, field: 'propertyId', 'has-error')} required">
	<label for="propertyId" class="control-label col-xs-4">
		<g:message code="property.propertyId.label" default="Property Id" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<g:textField class="form-control" name="propertyId" pattern="${propertyInstance.constraints.propertyId.matches}" required="" value="${propertyInstance?.propertyId}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'address.unitNo', 'has-error')} ">
	<label for="address.unitNo" class="control-label col-xs-4">
		<g:message code="address.unitNo.label" default="Unit No" />
	</label>
	<div class="col-xs-4">
		<g:textField class="form-control" name="address.unitNo" maxlength="5" value="${propertyInstance?.address?.unitNo}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'address.address1', 'has-error')} required">
	<label for="addrress.address1" class="control-label col-xs-4">
		<g:message code="address.address1.label" default="Address1" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="address.address1" maxlength="50" required="" value="${propertyInstance?.address?.address1}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'address.address2', 'has-error')} ">
	<label for="address.address2" class="control-label col-xs-4">
		<g:message code="address.address2.label" default="Address2" />
		
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="address.address2" maxlength="50" value="${propertyInstance?.address?.address2}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'address.town', 'has-error')} ">
	<label for="address.town" class="control-label col-xs-4">
		<g:message code="address.town.label" default="Town" />
		
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.town" value="${propertyInstance?.address?.town}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'address.county', 'has-error')} ">
	<label for="address.county" class="control-label col-xs-4">
		<g:message code="address.county.label" default="County" />
		
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.county" value="${propertyInstance?.address?.county}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'address.postCode', 'has-error')} required">
	<label for="address.postCode" class="control-label col-xs-4">
		<g:message code="address.postCode.label" default="Post Code" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.postCode" required="" value="${propertyInstance?.address?.postCode}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'address.country', 'has-error')} required">
	<label for="address.country" class="control-label col-xs-4">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.country" required="" value="${propertyInstance?.address?.country}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: propertyInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-4">
		<g:message code="property.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${propertyInstance?.client?.id}" class="many-to-one form-control"/>
	</div>
</div>


