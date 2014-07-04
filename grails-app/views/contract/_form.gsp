<%@ page import="uk.org.pmms.Contract" %>



<div class="form-group ${hasErrors(bean: contractInstance, field: 'startDate', 'has-error')} required">
	<label for="startDate" class="control-label col-xs-4">
		<g:message code="contract.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:datePicker name="startDate" precision="day"  value="${contractInstance?.startDate}"  />

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'endDate', 'has-error')} ">
	<label for="endDate" class="control-label col-xs-4">
		<g:message code="contract.endDate.label" default="End Date" />
		
	</label>
	<div class="col-xs-8">
		<g:datePicker name="endDate" precision="day"  value="${contractInstance?.endDate}" default="none" noSelection="['': '']" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-4">
		<g:message code="contract.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${contractInstance?.client?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'contractType', 'has-error')} required">
	<label for="contractType" class="control-label col-xs-4">
		<g:message code="contract.contractType.label" default="Contract Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="contractType" name="contractType.id" from="${uk.org.pmms.SupplierType.list()}" optionKey="id" required="" value="${contractInstance?.contractType?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'contractor', 'has-error')} required">
	<label for="contractor" class="control-label col-xs-4">
		<g:message code="contract.contractor.label" default="Contractor" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="contractor" name="contractor.id" from="${uk.org.pmms.Supplier.list()}" optionKey="id" required="" value="${contractInstance?.contractor?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'ref', 'has-error')} required">
	<label for="ref" class="control-label col-xs-4">
		<g:message code="contract.ref.label" default="Ref" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="ref" required="" value="${contractInstance?.ref}"/>

	</div>
</div>

