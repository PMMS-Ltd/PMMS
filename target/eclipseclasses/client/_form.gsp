<%@ page import="uk.org.pmms.Client" %>

<div class="col-sm-6">

<div class="form-group ${hasErrors(bean: clientInstance, field: 'clientId', 'has-error')} required">
	<label for="clientId" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.clientId.label" default="Client Id" />
	</label>
	<div class="col-xs-4 col-lg-2">
	<g:textField class="form-control" name="clientId" maxlength="4" required="" value="${clientInstance?.clientId}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'name', 'has-error')} required">
	<label for="name" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.name.label" default="Name" />
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="name" maxlength="50" required="" value="${clientInstance?.name}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'yearStart', 'has-error')} required">
	<label for="yearStart" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.yearStart.label" default="Year Start" />
	</label>
	<div class="col-xs-8">
	<g:datePicker class="form-control" name="yearStart" precision="day"  value="${clientInstance?.yearStart}"  />
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'yearEnd', 'has-error')} required">
	<label for="yearEnd" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.yearEnd.label" default="Year End" />
	</label>
	<div class="col-xs-8">
	<g:datePicker class="form-control" name="yearEnd" precision="day"  value="${clientInstance?.yearEnd}"  />
	</div>
	</div>
	
	<g:if test="${!clientInstance.accounts }">
	<div class="form-group required">
	<label for="accountName" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.accounts[0].name.label" default="Account Name" />
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="accounts[0].name" maxlength="50" required=""/>
	</div>
</div>

<div class="form-group required">
	<label for="accountNo" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.accounts[0].accNo.label" default="Account No" />
	</label>
	<div class="col-xs-8 col-lg-3">
	<g:textField class="form-control" name="accounts[0].accNo" required=""/>
	</div>
</div>
<div class="form-group required">
	<label for="sortCode" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.accounts[0].sortCode.label" default="Sort Code" />
	</label>
	<div class="col-xs-8 col-lg-3">
	<g:textField class="form-control" name="accounts[0].sortCode" required=""/>
	</div>
</div>
<div class="form-group required">
	<label class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="client.accounts[0].type.label" default="Account Type" />
	</label>
	<div class="col-xs-8 col-lg-3">
	<g:select from="${uk.org.pmms.accounts.BankAccount.constraints.type.inList }" name="accounts[0].type" class="form-control"/>
	</div>
</div>
</g:if>
</div>

<div class="col-sm-6">
<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.unitNo', 'has-error')} ">
	<label for="address.unitNo" class="control-label col-xs-4 col-lg-3">
		<g:message code="address.unitNo.label" default="Unit No" />
		
	</label>
	<div class="col-xs-4 col-lg-2">
	<g:textField class="form-control" name="address.unitNo" maxlength="5" value="${clientInstance?.address?.unitNo}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.address1', 'has-error')} required">
	<label for="addrress.address1" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="address.address1.label" default="Address1" />
		
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="address.address1" maxlength="50" required="" value="${clientInstance?.address?.address1}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.address2', 'has-error')} ">
	<label for="address.address2" class="control-label col-xs-4 col-lg-3">
		<g:message code="address.address2.label" default="Address2" />
		
	</label>
	<div class="col-xs-8">
	<g:textField class="form-control" name="address.address2" maxlength="50" value="${clientInstance?.address?.address2}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.town', 'has-error')} ">
	<label for="address.town" class="control-label col-xs-4 col-lg-3">
		<g:message code="address.town.label" default="Town" />
		
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.town" value="${clientInstance?.address?.town}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.county', 'has-error')} ">
	<label for="address.county" class="control-label col-xs-4 col-lg-3">
		<g:message code="address.county.label" default="County" />
		
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.county" value="${clientInstance?.address?.county}"/>
	</div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.postCode', 'has-error')} required">
	<label for="address.postCode" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="address.postCode.label" default="Post Code" />
		
	</label>
	<div class="col-xs-6">
	<g:textField class="form-control" name="address.postCode" required="" value="${clientInstance?.address?.postCode}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.country', 'has-error')} required">
	<label for="address.country" class="control-label col-xs-4 col-lg-3">
		<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="address.country.label" default="Country" />
		
	</label>
	<div class="col-xs-6">
	<g:countrySelect class="form-control" name="address.country" required="" value="${clientInstance?.address?.country}" default="gbr"/>
	</div>
</div>
</div>