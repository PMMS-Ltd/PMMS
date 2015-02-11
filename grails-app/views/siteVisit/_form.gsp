<%@ page import="uk.org.pmms.SiteVisit" %>

<div class="form-group ${hasErrors(bean: siteVisitInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-4">
		<g:message code="siteVisit.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<g:if test="${siteVisitInstance.client }">
			<p class="form-control-static">${siteVisitInstance.client }</p>
		</g:if>
		<g:else>
			<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${siteVisitInstance?.client?.id}"  noSelection="${['null':'']}" class="many-to-one form-control"/>
		</g:else>
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
	<g:if test="${siteVisitInstance.jobs }">
	<div class="col-xs-8">
		<ul class="list-group">
		 <g:each in="${siteVisitInstance.jobs }" var="job">
			 	<li class="list-group-item">
			 		<div class="row">
			 			<div class="col-xs-2">
			 				 <span class="badge">${job.id }</span>
			 			</div>
			 			<div class="col-xs-10">
			 				${job.faultDetails }
			 			</div>
			 		</div>
			 	</li>
			</g:each>
		</ul>
		</div>
	</g:if>
	<g:else>
		<div class="col-xs-8" id="jobs">
		<!--<g:select name="jobs" from="" multiple="multiple" optionKey="id" size="5" value="${siteVisitInstance?.jobs*.id}" class="form-control"/>-->
		<!--<g:link class="btn btn-xs btn-default" action="addJob" id="${site }"params="[jobId: '2']"><i class="fa fa-fw fa-chevron-right"></i></g:link>-->
	</div>
	</g:else>
</div>
<input type="hidden" name="requester" value="${siteVisitInstance?.requester }"/>
<r:script type="text/javascript">
    $(function () {
        $('#visitStartDate').datetimepicker({format: 'DD/MM/YYYY HH:mm', daysOfWeekDisabled: [0,6]});
        $('#visitEndDate').datetimepicker({format: 'DD/MM/YYYY HH:mm', daysOfWeekDisabled: [0,6]});
        $("#visitStartDate").on("dp.change",function (e) {
            $('#visitEndDate').data("DateTimePicker").minDate(e.date);
        });
        $("#visitEndDate").on("dp.change",function (e) {
            $('#visitStartDate').data("DateTimePicker").maxDate(e.date);
        });
        $("#client").on('change', function(){
        	$.get( "${request.contextPath }/siteVisit/getJobs/"+this.value, function( data ) {
				  $( "#jobs" ).html( data );
				  $('#jobsSelect').multiSelect();
				});
        	//$("#jobs").html($.get('${request.contextPath }/siteVisit/getJobs/'+this.value));
        	//$("#jobs").prop('disabled', false);
        	//$('#jobs').multiSelect();
        })
       
    });
</r:script>


