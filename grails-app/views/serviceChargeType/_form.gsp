<%@ page import="uk.org.pmms.accounts.ServiceChargeType" %>

<div class="form-group ${hasErrors(bean: serviceChargeTypeInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-3">
		<g:message code="serviceChargeType.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${serviceChargeTypeInstance?.client?.id}" class="many-to-one form-control"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: serviceChargeTypeInstance, field: 'type', 'has-error')} required">
	<label for="type" class="control-label col-xs-3">
		<g:message code="serviceChargeType.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
		<g:textField class="form-control" name="type" required="" value="${serviceChargeTypeInstance?.type}"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: serviceChargeTypeInstance, field: 'description', 'has-error')} required">
	<label for="description" class="control-label col-xs-3">
		<g:message code="serviceChargeType.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
		<g:textField class="form-control" name="description" required="" value="${serviceChargeTypeInstance?.description}"/>

	</div>
</div>
<div class="form-group required">
	<label for="payment-plans" class="control-label col-xs-3">
		Payment Options
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
<label class="checkbox-inline">
  <input type="checkbox" id="annually" name="annually" value="${serviceChargeTypeInstance?.annually}"> Annually
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="half-yearly" name="half-yearly" value="${serviceChargeTypeInstance?.halfYearly}"> Half Yearly
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="quarterly" name="quarterly" value="${serviceChargeTypeInstance?.quarterly}"> Quarterly
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="monthly" name="monthly" value="${serviceChargeTypeInstance?.monthly}"> Monthly
</label>
</div>
</div>

<div class="form-group ${hasErrors(bean: serviceChargeTypeInstance, field: 'charges', 'has-error')} ">
	<label for="charges" class="control-label col-xs-3">
		<g:message code="serviceChargeType.charges.label" default="Charges" />
		
	</label>
	<div class="col-xs-8">
		
<ul class="one-to-many">
<g:each in="${serviceChargeTypeInstance?.charges?}" var="c">
    <li><g:link controller="serviceCharge" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="serviceCharge" action="create" params="['serviceChargeType.id': serviceChargeTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serviceCharge.label', default: 'ServiceCharge')])}</g:link>
</li>
</ul>


	</div>
</div>

