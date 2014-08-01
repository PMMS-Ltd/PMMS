<%@ page import="uk.org.pmms.accounts.Transaction" %>



<div class="form-group ${hasErrors(bean: transactionInstance, field: 'type', 'has-error')} required">
	<label for="type" class="control-label col-xs-4">
		<g:message code="transaction.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="type" from="${1..18}" class="range" required="" value="${fieldValue(bean: transactionInstance, field: 'type')}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'client', 'has-error')} required">
	<label for="client" class="control-label col-xs-4">
		<g:message code="transaction.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="client" name="client.id" from="${uk.org.pmms.Client.list()}" optionKey="id" required="" value="${transactionInstance?.client?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'jobId', 'has-error')} ">
	<label for="jobId" class="control-label col-xs-4">
		<g:message code="transaction.jobId.label" default="Job Id" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="jobId" value="${transactionInstance?.jobId}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'propertyId', 'has-error')} ">
	<label for="propertyId" class="control-label col-xs-4">
		<g:message code="transaction.propertyId.label" default="Property Id" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="propertyId" name="propertyId.id" from="${uk.org.pmms.Property.list()}" optionKey="id" value="${transactionInstance?.propertyId?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'supplier', 'has-error')} ">
	<label for="supplier" class="control-label col-xs-4">
		<g:message code="transaction.supplier.label" default="Supplier" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="supplier" name="supplier.id" from="${uk.org.pmms.Supplier.list()}" optionKey="id" value="${transactionInstance?.supplier?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'datePaid', 'has-error')} ">
	<label for="datePaid" class="control-label col-xs-4">
		<g:message code="transaction.datePaid.label" default="Date Paid" />
		
	</label>
	<div class="col-xs-8">
		<g:datePicker name="datePaid" precision="day"  value="${transactionInstance?.datePaid}" default="none" noSelection="['': '']" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'details', 'has-error')} ">
	<label for="details" class="control-label col-xs-4">
		<g:message code="transaction.details.label" default="Details" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="details" value="${transactionInstance?.details}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'invoiceNo', 'has-error')} ">
	<label for="invoiceNo" class="control-label col-xs-4">
		<g:message code="transaction.invoiceNo.label" default="Invoice No" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="invoiceNo" value="${transactionInstance?.invoiceNo}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'paymentType', 'has-error')} ">
	<label for="paymentType" class="control-label col-xs-4">
		<g:message code="transaction.paymentType.label" default="Payment Type" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="paymentType" from="${transactionInstance.constraints.paymentType.inList}" value="${transactionInstance?.paymentType}" valueMessagePrefix="transaction.paymentType" noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'grp', 'has-error')} required">
	<label for="grp" class="control-label col-xs-4">
		<g:message code="transaction.grp.label" default="Grp" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="grp" from="${transactionInstance.constraints.grp.inList}" required="" value="${transactionInstance?.grp}" valueMessagePrefix="transaction.grp"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'amount', 'has-error')} required">
	<label for="amount" class="control-label col-xs-4">
		<g:message code="transaction.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="amount" value="${fieldValue(bean: transactionInstance, field: 'amount')}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'bankAccount', 'has-error')} required">
	<label for="bankAccount" class="control-label col-xs-4">
		<g:message code="transaction.bankAccount.label" default="Bank Account" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="bankAccount" name="bankAccount.id" from="${uk.org.pmms.accounts.BankAccount.list()}" optionKey="id" required="" value="${transactionInstance?.bankAccount?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'nominalCode', 'has-error')} required">
	<label for="nominalCode" class="control-label col-xs-4">
		<g:message code="transaction.nominalCode.label" default="Nominal Code" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="nominalCode" required="" value="${transactionInstance?.nominalCode}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'paid', 'has-error')} ">
	<label for="paid" class="control-label col-xs-4">
		<g:message code="transaction.paid.label" default="Paid" />
		
	</label>
	<div class="col-xs-8">
		<g:checkBox name="paid" value="${transactionInstance?.paid}" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'reconciled', 'has-error')} ">
	<label for="reconciled" class="control-label col-xs-4">
		<g:message code="transaction.reconciled.label" default="Reconciled" />
		
	</label>
	<div class="col-xs-8">
		<g:checkBox name="reconciled" value="${transactionInstance?.reconciled}" />

	</div>
</div>

