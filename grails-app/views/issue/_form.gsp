<%@ page import="uk.org.pmms.Issue" %>
<%@ page import="uk.org.pmms.LdapUserService" %>

<g:set var="ldapUser" bean="ldapUserService"/>
<div class="form-group ${hasErrors(bean: issueInstance, field: 'clientId', 'has-error')} required">
	<label for="clientId" class="control-label col-xs-3">
		<g:message code="issue.clientId.label" default="Client Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
		<g:select id="clientId" name="clientId.id" from="${uk.org.pmms.Client.list()}" optionKey="id" optionValue="name" required="" value="${issueInstance?.clientId?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: issueInstance, field: 'reporterName', 'has-error')} required">
	<label for="reporterName" class="control-label col-xs-3">
		<g:message code="issue.reporterName.label" default="Reporter Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
		<div class="input-group">
		  <span class="input-group-addon" id="basic-addon3"><i class="fa fa-fw fa-user"></i></span>
		  <input type="text" class="form-control" placeholder="Name" aria-describedby="basic-addon3" name="reporterName">
		</div>
	</div>
</div>

<div class="form-group ${hasErrors(bean: issueInstance, field: 'reporterEmail', 'has-error')} required">
	<label for="reporterEmail" class="control-label col-xs-3">
		<g:message code="issue.reporterEmail.label" default="Reporter Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
		<div class="input-group">
		  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-fw fa-at"></i></span>
		  <input type="email" class="form-control" placeholder="Email" aria-describedby="basic-addon1" name="reporterEmail">
		</div>

	</div>
</div>

<div class="form-group ${hasErrors(bean: issueInstance, field: 'reporterPhone', 'has-error')} required">
	<label for="reporterPhone" class="control-label col-xs-3">
		<g:message code="issue.reporterPhone.label" default="Reporter Phone" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-6">
		<div class="input-group">
		  <span class="input-group-addon" id="basic-addon2"><i class="fa fa-fw fa-phone"></i></span>
		  <input type="text" class="form-control" placeholder="Telephone" aria-describedby="basic-addon2" name="reporterPhone">
		</div>

	</div>
</div>
<div class="form-group ${hasErrors(bean: issueInstance, field: 'issueDescription', 'has-error')} required">
	<label for="issueDescription" class="control-label col-xs-3">
		<g:message code="issue.issueDescription.label" default="Issue Description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textArea class="form-control" name="issueDescription" cols="40" rows="5" maxlength="300" required="" value="${issueInstance?.issueDescription}"/>

	</div>
</div>


<g:if test="${issueInstance?.id }">
<div class="form-group ${hasErrors(bean: issueInstance, field: 'jobId', 'has-error')} ">
	<label for="jobId" class="control-label col-xs-3">
		<g:message code="issue.jobId.label" default="Job Id" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="jobId" name="jobId.id" from="${uk.org.pmms.Job.list()}" optionKey="id" value="${issueInstance?.jobId?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>
</g:if>

<div class="form-group ${hasErrors(bean: issueInstance, field: 'assignedTo', 'has-error')} ">
	<label for="assignedTo" class="control-label col-xs-3">
		<g:message code="issue.assignedTo.label" default="Assigned To" />
	</label>
	<div class="col-xs-8">
		<!--<g:textField class="form-control" name="assignedTo" value="${issueInstance?.assignedTo}"/>-->
		<g:select name="assignedTo" from="${ldapUser.getUsersByGroup('USER')}" value="${issueInstance?.assignedTo}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>

