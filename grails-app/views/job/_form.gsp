<%@ page import="uk.org.pmms.Job" %>


<div class="form-group ${hasErrors(bean: jobInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-3">
		<g:message code="job.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" optionValue="name" required="" value="${jobInstance?.client?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'faultLocation', 'has-error')} required">
	<label for="faultLocation" class="control-label col-xs-3">
		<g:message code="job.faultLocation.label" default="Fault Location" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="faultLocation" required="" value="${jobInstance?.faultLocation}"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'faultDetails', 'has-error')} required">
	<label for="faultDetails" class="control-label col-xs-3">
		<g:message code="job.faultDetails.label" default="Fault Details" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textArea class="form-control" name="faultDetails" required="" value="${jobInstance?.faultDetails}" rows="4" columns="20" style="resize: none;"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'category', 'has-error')} ">
	<label for="category" class="control-label col-xs-3">
		<g:message code="job.category.label" default="Category" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="category" name="category.id" from="${uk.org.pmms.SupplierType.list()}" optionKey="id" value="${jobInstance?.category?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
	</div>
</div>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'contractor', 'has-error')} ">
	<label for="contractor" class="control-label col-xs-3">
		<g:message code="job.contractor.label" default="Contractor" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="contractor" name="contractor.id" from="${uk.org.pmms.Supplier.list()}" optionKey="id" value="${jobInstance?.contractor?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: jobInstance, field: 'assignedTo', 'has-error')} required">
	<label for="assignedTo" class="control-label col-xs-3">
		<g:message code="job.assignedTo.label" default="Assigned To" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<select class="form-control" name="assignedTo">
			<option value="null"></option>
			<g:each in="${users}" var="user">
				<g:if test="${user.uid == jobInstance?.assignedTo}">
					<option value="${user.uid}" selected="selected">${user.displayName }</option>
				</g:if>
				<g:else>
					<option value="${user.uid}">${user.displayName }</option>
				</g:else>
			</g:each>
		</select>
		<!--<g:textField class="form-control" name="assignedTo" required="" value="${jobInstance?.assignedTo}"/>-->

	</div>
</div>

<input type="hidden" name="enteredBy" value="${jobInstance?.enteredBy }"/>
<div class="form-group ${hasErrors(bean: jobInstance, field: 'priority', 'has-error')} required">
	<label for="priority" class="control-label col-xs-3">
		<g:message code="job.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-3">
		<g:select id="priority" name="priority" from="${jobInstance.constraints.priority.inList}" required="" value="${jobInstance?.priority}" class="form-control"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: jobInstance, field: 'reportedBy', 'has-error')} required">
	<label for="reportedBy" class="control-label col-xs-3">
		<g:message code="job.reportedBy.label" default="Reported By" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="reportedBy" name="reportedBy.id" from="${uk.org.pmms.Person.list()}" optionKey="id" required="" value="${jobInstance?.reportedBy?.id}" class="many-to-one form-control"/>

	</div>
</div>
<g:if test="${jobInstance.id }">
	<div class="form-group">
		<label for="requiresSV" class="control-label col-xs-3">
			<g:message code="job.requiresSV.label" default="Requires Site Visit?" />
		</label>
		<div class="col-xs-8">
			<div class="checkbox">
	        <label>
	          <input type="checkbox" name="requiresSV" ${jobInstance?.requiresSV ? 'checked' : '' }>
	        </label>
	      </div>
		</div>
	</div>
</g:if>