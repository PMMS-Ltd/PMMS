<%@ page import="uk.org.pmms.reporting.DataField" %>



<div class="form-group ${hasErrors(bean: dataFieldInstance, field: 'name', 'has-error')} required">
	<label for="name" class="control-label col-xs-4">
		<g:message code="dataField.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="name" required="" value="${dataFieldInstance?.name}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: dataFieldInstance, field: 'parentClass', 'has-error')} required">
	<label for="parentClass" class="control-label col-xs-4">
		<g:message code="dataField.parentClass.label" default="Parent Class" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="parentClass" required="" value="${dataFieldInstance?.parentClass}"/>

	</div>
</div>

