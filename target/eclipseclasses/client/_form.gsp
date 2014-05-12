<%@ page import="uk.org.pmms.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="client.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${clientInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'clientId', 'error')} required">
	<label for="clientId">
		<g:message code="client.clientId.label" default="Client Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clientId" maxlength="4" required="" value="${clientInstance?.clientId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'yearStart', 'error')} required">
	<label for="yearStart">
		<g:message code="client.yearStart.label" default="Year Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="yearStart" precision="day"  value="${clientInstance?.yearStart}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'yearEnd', 'error')} required">
	<label for="yearEnd">
		<g:message code="client.yearEnd.label" default="Year End" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="yearEnd" precision="day"  value="${clientInstance?.yearEnd}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'accountName', 'error')} required">
	<label for="accountName">
		<g:message code="client.accountName.label" default="Account Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountName" maxlength="50" required="" value="${clientInstance?.accountName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'accountNo', 'error')} required">
	<label for="accountNo">
		<g:message code="client.accountNo.label" default="Account No" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="accountNo" type="number" value="${clientInstance.accountNo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'units', 'error')} ">
	<label for="units">
		<g:message code="client.units.label" default="Units" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clientInstance?.units?}" var="u">
    <li><g:link controller="property" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="property" action="create" params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'property.label', default: 'Property')])}</g:link>
</li>
</ul>


</div>

