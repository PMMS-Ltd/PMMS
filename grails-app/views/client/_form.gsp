<%@ page import="uk.org.pmms.Client" %>

<div class="col-sm-6">

<div class="form-group ${hasErrors(bean: clientInstance, field: 'name', 'has-error')} required">
	<label for="name" class="control-label col-xs-4">
		<g:message code="client.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="name" maxlength="50" required="" value="${clientInstance?.name}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'clientId', 'has-error')} required">
	<label for="clientId" class="control-label col-xs-4">
		<g:message code="client.clientId.label" default="Client Id" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
	<g:textField class="form-control" name="clientId" maxlength="4" required="" value="${clientInstance?.clientId}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'yearStart', 'has-error')} required">
	<label for="yearStart" class="control-label col-xs-4">
		<g:message code="client.yearStart.label" default="Year Start" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
	<g:datePicker class="form-control" name="yearStart" precision="day"  value="${clientInstance?.yearStart}"  />
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'yearEnd', 'has-error')} required">
	<label for="yearEnd" class="control-label col-xs-4">
		<g:message code="client.yearEnd.label" default="Year End" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
	<g:datePicker class="form-control" name="yearEnd" precision="day"  value="${clientInstance?.yearEnd}"  />
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'accountName', 'has-error')} required">
	<label for="accountName" class="control-label col-xs-4">
		<g:message code="client.accountName.label" default="Account Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="accountName" maxlength="50" required="" value="${clientInstance?.accountName}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'accountNo', 'has-error')} required">
	<label for="accountNo" class="control-label col-xs-4">
		<g:message code="client.accountNo.label" default="Account No" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
	<g:field class="form-control" name="accountNo" type="number" value="${clientInstance.accountNo}" required=""/>
	</div>
</div>
</div>
<div class="col-sm-6">
<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.unitNo', 'has-error')} ">
	<label for="address.unitNo" class="control-label col-xs-4">
		<g:message code="address.unitNo.label" default="Unit No" />
		
	</label>
	<div class="col-xs-4">
	<g:textField class="form-control" name="address.unitNo" maxlength="5" value="${clientInstance?.address?.unitNo}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.address1', 'has-error')} required">
	<label for="addrress.address1" class="control-label col-xs-4">
		<g:message code="address.address1.label" default="Address1" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="address.address1" maxlength="50" required="" value="${clientInstance?.address?.address1}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.address2', 'has-error')} ">
	<label for="address.address2" class="control-label col-xs-4">
		<g:message code="address.address2.label" default="Address2" />
		
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="address.address2" maxlength="50" value="${clientInstance?.address?.address2}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.town', 'has-error')} ">
	<label for="address.town" class="control-label col-xs-4">
		<g:message code="address.town.label" default="Town" />
		
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.town" value="${clientInstance?.address?.town}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.county', 'has-error')} ">
	<label for="address.county" class="control-label col-xs-4">
		<g:message code="address.county.label" default="County" />
		
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.county" value="${clientInstance?.address?.county}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.postCode', 'has-error')} required">
	<label for="address.postCode" class="control-label col-xs-4">
		<g:message code="address.postCode.label" default="Post Code" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.postCode" required="" value="${clientInstance?.address?.postCode}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.country', 'has-error')} required">
	<label for="address.country" class="control-label col-xs-4">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.country" required="" value="${clientInstance?.address?.country}"/>
	</div>
</div>
</div>
