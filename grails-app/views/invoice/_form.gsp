<%@ page import="uk.org.pmms.Invoice" %>


<div class=" form-horizontal">
<div class="form-group ${hasErrors(bean: invoiceInstance, field: 'billTo', 'has-error')} required">
	<label for="billTo" class="control-label col-xs-4">
		<g:message code="invoice.billTo.label" default="Bill To" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="billTo" name="billTo.id" from="${uk.org.pmms.Supplier.list()}" optionKey="id" required="" value="${invoiceInstance?.billTo?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceInstance, field: 'invoiceItems', 'has-error')} ">
	<label for="invoiceItems" class="control-label col-xs-4">
		<g:message code="invoice.invoiceItems.label" default="Invoice Items" />
		
	</label>
	<div class="col-xs-8">
		
<ul class="one-to-many">
<g:each in="${invoiceInstance?.invoiceItems?}" var="i">
    <li><g:link controller="invoiceItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="invoiceItem" action="create" params="['invoice.id': invoiceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem')])}</g:link>
</li>
</ul>


	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceInstance, field: 'subTotal', 'has-error')} required">
	<label for="subTotal" class="control-label col-xs-4">
		<g:message code="invoice.subTotal.label" default="Sub Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="subTotal" value="${fieldValue(bean: invoiceInstance, field: 'subTotal')}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceInstance, field: 'total', 'has-error')} required">
	<label for="total" class="control-label col-xs-4">
		<g:message code="invoice.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="total" value="${fieldValue(bean: invoiceInstance, field: 'total')}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceInstance, field: 'vat', 'has-error')} required">
	<label for="vat" class="control-label col-xs-4">
		<g:message code="invoice.vat.label" default="Vat" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="vat" value="${fieldValue(bean: invoiceInstance, field: 'vat')}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: invoiceInstance, field: 'balance', 'has-error')} required">
	<label for="balance" class="control-label col-xs-4">
		<g:message code="invoice.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="balance" value="${fieldValue(bean: invoiceInstance, field: 'balance')}" required=""/>

	</div>
</div>
</div>
