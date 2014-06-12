<%@ page import="uk.org.pmms.Person" %>



<div class="form-group ${hasErrors(bean: personInstance, field: 'salutation', 'has-error')} ">
	<label for="salutation" class="control-label col-xs-4">
		<g:message code="person.salutation.label" default="Salutation" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="salutation" value="${personInstance?.salutation}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'firstName', 'has-error')} ">
	<label for="firstName" class="control-label col-xs-4">
		<g:message code="person.firstName.label" default="First Name" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="firstName" value="${personInstance?.firstName}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'initial', 'has-error')} ">
	<label for="initial" class="control-label col-xs-4">
		<g:message code="person.initial.label" default="Initial" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="initial" value="${personInstance?.initial}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'lastName', 'has-error')} required">
	<label for="lastName" class="control-label col-xs-4">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="lastName" required="" value="${personInstance?.lastName}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'email1', 'has-error')} ">
	<label for="email1" class="control-label col-xs-4">
		<g:message code="person.email1.label" default="Email1" />
		
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" type="email" name="email1" value="${personInstance?.email1}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'email1Type', 'has-error')} ">
	<label for="email1Type" class="control-label col-xs-4">
		<g:message code="person.email1Type.label" default="Email1 Type" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="email1Type" from="${uk.org.pmms.Person$EmailType?.values()}" keys="${uk.org.pmms.Person$EmailType.values()*.name()}" value="${personInstance?.email1Type?.name()}"  noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'email2', 'has-error')} ">
	<label for="email2" class="control-label col-xs-4">
		<g:message code="person.email2.label" default="Email2" />
		
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" type="email" name="email2" value="${personInstance?.email2}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'email2Type', 'has-error')} ">
	<label for="email2Type" class="control-label col-xs-4">
		<g:message code="person.email2Type.label" default="Email2 Type" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="email2Type" from="${uk.org.pmms.Person$EmailType?.values()}" keys="${uk.org.pmms.Person$EmailType.values()*.name()}" value="${personInstance?.email2Type?.name()}"  noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'phone1', 'has-error')} required">
	<label for="phone1" class="control-label col-xs-4">
		<g:message code="person.phone1.label" default="Phone1" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="phone1" required="" value="${personInstance?.phone1}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'phone1Type', 'has-error')} required">
	<label for="phone1Type" class="control-label col-xs-4">
		<g:message code="person.phone1Type.label" default="Phone1 Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="phone1Type" from="${uk.org.pmms.Person$PhoneType?.values()}" keys="${uk.org.pmms.Person$PhoneType.values()*.name()}" required="" value="${personInstance?.phone1Type?.name()}" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'phone2', 'has-error')} ">
	<label for="phone2" class="control-label col-xs-4">
		<g:message code="person.phone2.label" default="Phone2" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="phone2" value="${personInstance?.phone2}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'phone2Type', 'has-error')} ">
	<label for="phone2Type" class="control-label col-xs-4">
		<g:message code="person.phone2Type.label" default="Phone2 Type" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="phone2Type" from="${uk.org.pmms.Person$PhoneType?.values()}" keys="${uk.org.pmms.Person$PhoneType.values()*.name()}" value="${personInstance?.phone2Type?.name()}"  noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'phone3', 'has-error')} ">
	<label for="phone3" class="control-label col-xs-4">
		<g:message code="person.phone3.label" default="Phone3" />
		
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="phone3" value="${personInstance?.phone3}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'phone3Type', 'has-error')} ">
	<label for="phone3Type" class="control-label col-xs-4">
		<g:message code="person.phone3Type.label" default="Phone3 Type" />
		
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="phone3Type" from="${uk.org.pmms.Person$PhoneType?.values()}" keys="${uk.org.pmms.Person$PhoneType.values()*.name()}" value="${personInstance?.phone3Type?.name()}"  noSelection="['': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: personInstance, field: 'address', 'has-error')} required">
	<label for="address" class="control-label col-xs-4">
		<g:message code="person.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select id="address" name="address.id" from="${uk.org.pmms.Address.list()}" optionKey="id" required="" value="${personInstance?.address?.id}" class="many-to-one form-control"/>

	</div>
</div>

