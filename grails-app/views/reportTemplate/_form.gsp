<%@ page import="uk.org.pmms.reporting.ReportTemplate" %>



<div class="form-group ${hasErrors(bean: reportTemplateInstance, field: 'dataFields', 'has-error')} ">
	<label for="dataFields" class="control-label col-xs-4">
		<g:message code="reportTemplate.dataFields.label" default="Data Fields" />
		
	</label>
	<div class="col-xs-8">
		<g:select name="dataFields" from="${uk.org.pmms.reporting.DataField.list()}" multiple="multiple" optionKey="id" size="5" value="${reportTemplateInstance?.dataFields*.id}" class="many-to-many form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: reportTemplateInstance, field: 'docServerTemplate', 'has-error')} required">
	<label for="docServerTemplate" class="control-label col-xs-4">
		<g:message code="reportTemplate.docServerTemplate.label" default="Doc Server Template" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="docServerTemplate" required="" value="${reportTemplateInstance?.docServerTemplate}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: reportTemplateInstance, field: 'name', 'has-error')} required">
	<label for="name" class="control-label col-xs-4">
		<g:message code="reportTemplate.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="name" required="" value="${reportTemplateInstance?.name}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: reportTemplateInstance, field: 'parentObject', 'has-error')} required">
	<label for="parentObject" class="control-label col-xs-4">
		<g:message code="reportTemplate.parentObject.label" default="Parent Object" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="parentObject" required="" value="${reportTemplateInstance?.parentObject}"/>

	</div>
</div>

