<%@ page import="uk.org.pmms.InvoiceItem" %>



<div class="form-group ${hasErrors(bean: invoiceItemInstance, field: 'description', 'has-error')} required">
	<label for="description" class="control-label col-xs-4">
		<g:message code="invoiceItem.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="description" required="" value="${invoiceItemInstance?.description}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceItemInstance, field: 'invoice', 'has-error')} required">
	<label for="invoice" class="control-label col-xs-4">
		<g:message code="invoiceItem.invoice.label" default="Invoice" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="invoice" name="invoice.id" from="${uk.org.pmms.Invoice.list()}" optionKey="id" required="" value="${invoiceItemInstance?.invoice?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceItemInstance, field: 'lineTotal', 'has-error')} required">
	<label for="lineTotal" class="control-label col-xs-4">
		<g:message code="invoiceItem.lineTotal.label" default="Line Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="lineTotal" value="${fieldValue(bean: invoiceItemInstance, field: 'lineTotal')}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceItemInstance, field: 'quantity', 'has-error')} required">
	<label for="quantity" class="control-label col-xs-4">
		<g:message code="invoiceItem.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="quantity" type="number" value="${invoiceItemInstance.quantity}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceItemInstance, field: 'unitCost', 'has-error')} required">
	<label for="unitCost" class="control-label col-xs-4">
		<g:message code="invoiceItem.unitCost.label" default="Unit Cost" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="unitCost" value="${fieldValue(bean: invoiceItemInstance, field: 'unitCost')}" required=""/>

	</div>
</div>

