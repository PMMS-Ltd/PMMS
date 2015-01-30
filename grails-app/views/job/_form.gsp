<%@ page import="uk.org.pmms.Job" %>


<div class="form-group ${hasErrors(bean: jobInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-4">
		<g:message code="job.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${jobInstance?.client?.id}" class="many-to-one form-control"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'faultLocation', 'has-error')} required">
	<label for="faultLocation" class="control-label col-xs-4">
		<g:message code="job.faultLocation.label" default="Fault Location" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="faultLocation" required="" value="${jobInstance?.faultLocation}"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'faultDetails', 'has-error')} required">
	<label for="faultDetails" class="control-label col-xs-4">
		<g:message code="job.faultDetails.label" default="Fault Details" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="faultDetails" required="" value="${jobInstance?.faultDetails}"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'contractor', 'has-error')} ">
	<label for="contractor" class="control-label col-xs-4">
		<g:message code="job.contractor.label" default="Contractor" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="contractor" name="contractor.id" from="${uk.org.pmms.Supplier.list()}" optionKey="id" value="${jobInstance?.contractor?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: jobInstance, field: 'assignedTo', 'has-error')} required">
	<label for="assignedTo" class="control-label col-xs-4">
		<g:message code="job.assignedTo.label" default="Assigned To" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="assignedTo" required="" value="${jobInstance?.assignedTo}"/>

	</div>
</div>



<!-- <div class="form-group ${hasErrors(bean: jobInstance, field: 'enteredBy', 'has-error')} required">
	<label for="enteredBy" class="control-label col-xs-4">
		<g:message code="job.enteredBy.label" default="Entered By" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="enteredBy" required="" value="${jobInstance?.enteredBy}"/>

	</div>
</div>-->
<input type="hidden" name="enteredBy" value="${jobInstance?.enteredBy }"/>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'priority', 'has-error')} required">
	<label for="priority" class="control-label col-xs-4">
		<g:message code="job.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="priority" required="" value="${jobInstance?.priority}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: jobInstance, field: 'reportedBy', 'has-error')} required">
	<label for="reportedBy" class="control-label col-xs-4">
		<g:message code="job.reportedBy.label" default="Reported By" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="reportedBy" name="reportedBy.id" from="${uk.org.pmms.Person.list()}" optionKey="id" required="" value="${jobInstance?.reportedBy?.id}" class="many-to-one form-control"/>

	</div>
</div>

