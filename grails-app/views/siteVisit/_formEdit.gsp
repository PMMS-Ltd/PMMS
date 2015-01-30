<%@ page import="uk.org.pmms.SiteVisit" %>

<div class="form-group ${hasErrors(bean: siteVisitInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-4">
		<g:message code="siteVisit.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${siteVisitInstance?.client?.id}" class="many-to-one form-control"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: siteVisitInstance, field: 'visitStartDate', 'has-error')} required">
	<label for="visitDate" class="control-label col-xs-4">
		<g:message code="siteVisit.visitStartDate.label" default="Visit Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<!--<g:datePicker name="visitDate" precision="day"  value=""  />-->
	<div class='input-group' id='visitStartDate'>
                    <input type='text' class="form-control input-sm" name="visitStartDate" value="${formatDate(date: siteVisitInstance?.visitStartDate, format: 'dd/MM/yyyy hh:mm:ss')}"/>
                    <span class="input-group-addon input-sm"><span class="fa fa-calendar fa-fw"></span>
                    </span>
                </div>

	</div>
</div>
<div class="form-group ${hasErrors(bean: siteVisitInstance, field: 'visitEndDate', 'has-error')} required">
	<label for="visitDate" class="control-label col-xs-4">
		<g:message code="siteVisit.visitEndDate.label" default="Visit Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<!--<g:datePicker name="visitDate" precision="day"  value=""  />-->
	<div class='input-group' id='visitEndDate'>
                    <input type='text' class="form-control input-sm" name="visitEndDate" value="${formatDate(date: siteVisitInstance?.visitEndDate, format: 'dd/MM/yyyy hh:mm:ss')}"/>
                    <span class="input-group-addon input-sm"><span class="fa fa-calendar fa-fw"></span>
                    </span>
                </div>

	</div>
</div>
<div class="form-group ${hasErrors(bean: siteVisitInstance, field: 'details', 'has-error')} required">
	<label for="details" class="control-label col-xs-4">
		<g:message code="siteVisit.details.label" default="Details" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textArea class="form-control" name="details" cols="40" rows="5" maxlength="500" required="" value="${siteVisitInstance?.details}"/>

	</div>
</div>
<div class="form-group ${hasErrors(bean: siteVisitInstance, field: 'jobs', 'has-error')} ">
	<label for="jobs" class="control-label col-xs-4">
		<g:message code="siteVisit.jobs.label" default="Jobs" />
		
	</label>
	<div class="col-xs-8">
		<g:select name="jobs" from="${uk.org.pmms.Job.list()}" multiple="multiple" optionKey="id" size="5" value="${siteVisitInstance?.jobs*.id}" class="many-to-many form-control"/>
	</div>
</div>
<input type="hidden" name="requester" value="${siteVisitInstance?.requester }"/>
<r:script type="text/javascript">
    $(function () {
        $('#visitStartDate').datetimepicker({format: 'DD/MM/YYYY HH:mm', daysOfWeekDisabled: [0,6]});
        $('#visitEndDate').datetimepicker({format: 'DD/MM/YYYY HH:mm', daysOfWeekDisabled: [0,6]});
    });
</r:script>


