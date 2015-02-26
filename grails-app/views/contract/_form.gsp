<%@ page import="uk.org.pmms.Contract" %>



<div class="form-group ${hasErrors(bean: contractInstance, field: 'startDate', 'has-error')} required">
	<label for="startDate" class="control-label col-xs-4">
		<g:message code="contract.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<!--<g:datePicker name="startDate" precision="day"  value="${contractInstance?.startDate}"  />-->
		<div class='input-group' id='startDate'>
                    <input type='text' class="form-control input-sm" name="startDate" value="${formatDate(date: contractInstance?.startDate, format: 'dd/MM/yyyy')}"/>
                    <span class="input-group-addon input-sm"><span class="fa fa-calendar fa-fw"></span>
                    </span>
                </div>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'endDate', 'has-error')} ">
	<label for="endDate" class="control-label col-xs-4">
		<g:message code="contract.endDate.label" default="End Date" />
		
	</label>
	<div class="col-xs-4">
		<!--<g:datePicker name="endDate" precision="day"  value="${contractInstance?.endDate}" default="none" noSelection="['': '']" />-->
		<div class='input-group' id='endDate'>
                    <input type='text' class="form-control input-sm" name="endDate" value="${formatDate(date: contractInstance?.endDate, format: 'dd/MM/yyyy')}"/>
                    <span class="input-group-addon input-sm"><span class="fa fa-calendar fa-fw"></span>
                    </span>
                </div>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'usualDay', 'has-error')} ">
	<label for="usualDay" class="control-label col-xs-4">
		<g:message code="contract.usualDay.label" default="Usual Day" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="usualDay" from="${contractInstance.constraints.usualDay.inList}" value="${contractInstance?.usualDay}" valueMessagePrefix="contract.usualDay" noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'frequencyOfService', 'has-error')} ">
	<label for="frequencyOfService" class="control-label col-xs-4">
		<g:message code="contract.frequencyOfService.label" default="Frequency Of Service" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="frequencyOfService" from="${uk.org.pmms.Contract$Frequency?.values()}" keys="${uk.org.pmms.Contract$Frequency.values()*.name()}" value="${contractInstance?.frequencyOfService?.name()}"  noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'billingFrequency', 'has-error')} ">
	<label for="billingFrequency" class="control-label col-xs-4">
		<g:message code="contract.billingFrequency.label" default="Billing Frequency" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="billingFrequency" from="${uk.org.pmms.Contract$Frequency?.values()}" keys="${uk.org.pmms.Contract$Frequency.values()*.name()}" value="${contractInstance?.billingFrequency?.name()}"  noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: contractInstance, field: 'nominalCode', 'has-error')} ">
	<label for="nominalCode" class="control-label col-xs-4">
		<g:message code="contract.nominalCode.label" default="Nominal Code" />
		
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="nominalCode" type="number" value="${contractInstance.nominalCode}"/>

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

<div class="form-group ${hasErrors(bean: contractInstance, field: 'contractAmount', 'has-error')} required">
	<label for="contractAmount" class="control-label col-xs-4">
		<g:message code="contract.contractAmount.label" default="Contract Amount" />
		<span class="required-indicator">*</span>
	</label>
	<!-- <div class="col-xs-8">
		<g:field class="form-control" name="contractAmount" value="${fieldValue(bean: contractInstance, field: 'contractAmount')}" required=""/>

	</div>-->
	<div class="input-group col-xs-8">
  <span class="input-group-addon"><i class="fa fa-gbp fa-la"></i></span>
  <g:field type="currency" class="form-control" name="contractAmount" value="${fieldValue(bean: contractInstance, field: 'contractAmount')}" required=""/>
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

<div class="form-group ${hasErrors(bean: contractInstance, field: 'nextReviewDate', 'has-error')} required">
	<label for="nextReviewDate" class="control-label col-xs-4">
		<g:message code="contract.nextReviewDate.label" default="Next Review Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-4">
		<div class='input-group' id='nextReviewDate'>
                    <input type='text' class="form-control input-sm" name="nextReviewDate" value="${formatDate(date: contractInstance?.nextReviewDate, format: 'dd/MM/yyyy')}"/>
                    <span class="input-group-addon input-sm"><span class="fa fa-calendar fa-fw"></span>
                    </span>
                </div>

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
<r:script type="text/javascript">
    $(function () {
        $('#startDate').datetimepicker({format: 'DD/MM/YYYY'});
        $('#endDate').datetimepicker({format: 'DD/MM/YYYY'});
        $('#nextReviewDate').datetimepicker({format: 'DD/MM/YYYY'});
        $("#startDate").on("dp.change",function (e) {
            $('#endDate').data("DateTimePicker").minDate(e.date);
            $('#nextReviewDate').data("DateTimePicker").minDate(e.date);
        });
        $("#endDate").on("dp.change",function (e) {
            $('#startDate').data("DateTimePicker").maxDate(e.date);
            $('#nextReviewDate').data("DateTimePicker").maxDate(e.date);
        });
    });
</r:script>
