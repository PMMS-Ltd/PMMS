<%@ page import="uk.org.pmms.Supplier" %>



<div class="form-group ${hasErrors(bean: supplierInstance, field: 'name', 'has-error')} required">
	<label for="name" class="control-label col-xs-4">
		<g:message code="supplier.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="name" required="" value="${supplierInstance?.name}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: supplierInstance, field: 'accountNo', 'has-error')} ">
	<label for="accountNo" class="control-label col-xs-4">
		<g:message code="supplier.accountNo.label" default="Account No" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="accountNo" value="${supplierInstance?.accountNo}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: supplierInstance, field: 'sortCode', 'has-error')} ">
	<label for="sortCode" class="control-label col-xs-4">
		<g:message code="supplier.sortCode.label" default="Sort Code" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="sortCode" value="${supplierInstance?.sortCode}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: supplierInstance, field: 'address', 'has-error')} required">
	<label for="address" class="control-label col-xs-4">
		<g:message code="supplier.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="address" name="address.id" from="${uk.org.pmms.Address.list()}" optionKey="id" required="" value="${supplierInstance?.address?.id}" class="many-to-one form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: supplierInstance, field: 'employees', 'has-error')} ">
	<label for="employees" class="control-label col-xs-4">
		<g:message code="supplier.employees.label" default="Employees" />
		
	</label>
	<div class="col-xs-8">
		<g:select name="employees" from="${uk.org.pmms.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${supplierInstance?.employees*.id}" class="many-to-many form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: supplierInstance, field: 'workTypes', 'has-error')} ">
	<label for="workTypes" class="control-label col-xs-4">
		<g:message code="supplier.workTypes.label" default="Work Types" />
		
	</label>
	<div class="col-xs-8">
		<g:select name="workTypes" from="${uk.org.pmms.SupplierType.list()}" multiple="multiple" optionKey="id" size="5" value="${supplierInstance?.workTypes*.id}" class="many-to-many form-control"/>

	</div>
</div>

