<%@ page import="uk.org.pmms.accounts.ServiceCharge" %>

<div class="form-group">
	<label for="client" class="control-label col-xs-4">Client</label>
	<div class="col-xs-8">
		<g:select id="clientId" name="clientId" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${serviceChargeInstance?.serviceChargeType?.client?.clientId}" class="form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: serviceChargeInstance, field: 'serviceChargeType', 'has-error')} required">
	<label for="serviceChargeType" class="control-label col-xs-4">
		<g:message code="serviceCharge.serviceChargeType.label" default="Service Charge Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="serviceChargeType" name="serviceChargeType.id" from="${uk.org.pmms.accounts.ServiceChargeType.list() }" optionKey="id" required="" value="${serviceChargeInstance?.serviceChargeType?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: serviceChargeInstance, field: 'startDate', 'has-error')} required">
	<label for="startDate" class="control-label col-xs-4">
		<g:message code="serviceCharge.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:datePicker name="startDate" precision="day"  value="${serviceChargeInstance?.startDate}"  />

	</div>
</div>

<div class="form-group ${hasErrors(bean: serviceChargeInstance, field: 'endDate', 'has-error')} required">
	<label for="endDate" class="control-label col-xs-4">
		<g:message code="serviceCharge.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:datePicker name="endDate" precision="day"  value="${serviceChargeInstance?.endDate}"  />

	</div>
</div>

<div class="form-group ${hasErrors(bean: serviceChargeInstance, field: 'groundRent', 'has-error')} required">
	<label for="groundRent" class="control-label col-xs-4">
		<g:message code="serviceCharge.groundRent.label" default="Ground Rent" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field type="number" class="form-control" name="groundRent" value="${fieldValue(bean: serviceChargeInstance, field: 'groundRent')}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: serviceChargeInstance, field: 'serviceCharge', 'has-error')} required">
	<label for="serviceCharge" class="control-label col-xs-4">
		<g:message code="serviceCharge.serviceCharge.label" default="Service Charge" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field type="number" class="form-control" name="serviceCharge" value="${serviceChargeInstance?.serviceCharge}" required=""/>

	</div>
</div>
<g:javascript>
	$("#clientId").on('change',function(){
		$.ajax({
			type: 'POST',
			url: '${request.contextPath}/serviceChargeType/getTypes',
			data: {clientId: $(this).val()},
			success: function(data){
				$("#serviceChargeType").html(data);
			}
		});
		event.preventDefault();
	});
</g:javascript>


