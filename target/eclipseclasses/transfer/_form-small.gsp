<%@ page import="uk.org.pmms.Transfer" %>



<div class="form-group ${hasErrors(bean: transferInstance, field: 'completionDate', 'has-error')} ">
	<label for="completionDate" class="control-label col-xs-4">
		<g:message code="transfer.completionDate.label" default="Completion Date" />
		
	</label>
	<div class="col-xs-8">
		<g:datePicker name="completionDate" precision="day"  value="${transferInstance?.completionDate}" default="none" noSelection="['': '']" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'feeReceived', 'has-error')} ">
	<label for="feeReceived" class="control-label col-xs-4">
		<g:message code="transfer.feeReceived.label" default="Fee Received" />
		
	</label>
	<div class="col-xs-8">
		<g:datePicker name="feeReceived" precision="day"  value="${transferInstance?.feeReceived}" default="none" noSelection="['': '']" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'copypackSent', 'has-error')} ">
	<label for="copypackSent" class="control-label col-xs-4">
		<g:message code="transfer.copypackSent.label" default="Copypack Sent" />
		
	</label>
	<div class="col-xs-8">
		<g:datePicker name="copypackSent" precision="day"  value="${transferInstance?.copypackSent}" default="none" noSelection="['': '']" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'newOwner', 'has-error')} ">
	<label for="newOwner" class="control-label col-xs-4">
		<g:message code="transfer.newOwner.label" default="New Owner" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="newOwner" name="newOwner.id" from="${uk.org.pmms.Person.list()}" optionKey="id" value="${transferInstance?.newOwner?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'prop', 'has-error')} required">
	<label for="prop" class="control-label col-xs-4">
		<g:message code="transfer.prop.label" default="Prop" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="prop" name="prop.id" from="${uk.org.pmms.Property.list()}" optionKey="id" required="" value="${transferInstance?.prop?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'status', 'has-error')} required">
	<label for="status" class="control-label col-xs-4">
		<g:message code="transfer.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="status" required="" value="${transferInstance?.status}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'vSolicitor', 'has-error')} required">
	<label for="vSolicitor" class="control-label col-xs-4">
		<g:message code="transfer.vSolicitor.label" default="V Solicitor" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="vSolicitor" required="" value="${transferInstance?.vSolicitor}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transferInstance, field: 'vSolictorRef', 'has-error')} required">
	<label for="vSolictorRef" class="control-label col-xs-4">
		<g:message code="transfer.vSolictorRef.label" default="V Solictor Ref" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="vSolictorRef" required="" value="${transferInstance?.vSolictorRef}"/>

	</div>
</div>

