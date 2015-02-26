<%@ page import="uk.org.pmms.Person"%>

<div class="row">
	<div class="form-inline">
		<div class="form-group ${hasErrors(bean: personInstance, field: 'salutation', 'has-error')} col-xs-2">
			<label for="salutation" class="sr-only"> <g:message
					code="person.salutation.label" default="Salutation" />
			</label>
				<g:textField class="form-control" name="salutation"	value="${personInstance?.salutation}" placeholder="Title" />
		</div>

		<div class="form-group ${hasErrors(bean: personInstance, field: 'firstName', 'has-error')}  col-xs-4">
			<label for="firstName" class="sr-only"> <g:message
					code="person.firstName.label" default="First Name" />
			</label>
			<g:textField class="form-control" name="firstName"
				value="${personInstance?.firstName}" placeholder="First Name" />
		</div>

		<div class="form-group ${hasErrors(bean: personInstance, field: 'initial', 'has-error')}  col-xs-2">
			<label for="initial" class="sr-only"> <g:message
					code="person.initial.label" default="Initial" />
			</label>
			<g:textField class="form-control" name="initial"
				value="${personInstance?.initial}" placeholder="Initial" />
		</div>

		<div class="form-group ${hasErrors(bean: personInstance, field: 'lastName', 'has-error')} required  col-xs-4">
			<label for="lastName" class="sr-only"> 
				<g:message code="person.lastName.label" default="Last Name" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="form-control" name="lastName" required="" value="${personInstance?.lastName}" placeholder="Last Name" />
		</div>
	</div><!-- form-inline -->
</div><!-- row -->
<div class="row" style="margin-top:15px;">
	 <div class="col-sm-6">
	
	
	<div id="postcodeLookup" class="form-inline" style="margin-bottom: 15px;">
		 <div class="form-group col-xs-3">
	 		<label class="sr-only" for="unitNo">Unit No</label>
	 		<input type="text" class="form-control" id="unitNo" name="address.unitNo" placeholder="Unit No" value="${personInstance?.address?.unitNo }"/>
	 	</div>
	 	<div class="form-group col-xs-4">
	 		<label class="sr-only" for="postCode">Postcode</label>
	 		<input type="text" class="form-control" id="postcode" name="address.postCode" placeholder="PostCode" value="${personInstance?.address?.postCode }"/>
	 	</div>
	 	<div class="form-group">
	 		<button type="submit" class="form-control btn btn-sm btn-primary" id="pcSearch" name="postCode">Search</button>
	 	</div>
	 </div>
	 <div class="clearfix"></div>
	 <div id="addressForm" class="form-horizontal">
	 <fieldset>
		<div class="form-group ${hasErrors(bean: personInstance, field: 'address.address1', 'has-error')} required">
			<label for="addrress.address1" class="control-label col-xs-4 col-lg-3">
				<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="address.address1.label" default="Address1" />
			</label>
			<div class="col-xs-8">
				<g:textField class="form-control" name="address.address1"
					maxlength="50" required=""
					value="${personInstance?.address?.address1}" />
			</div>
		</div>

		<div class="form-group ${hasErrors(bean: personInstance, field: 'address.address2', 'has-error')} ">
			<label for="address.address2" class="control-label col-xs-4 col-lg-3">
				<g:message code="address.address2.label" default="Address2" />

			</label>
			<div class="col-xs-8">
				<g:textField class="form-control" name="address.address2" maxlength="50" value="${personInstance?.address?.address2}" />
			</div>
		</div>

		<div class="form-group ${hasErrors(bean: personInstance, field: 'address.town', 'has-error')} ">
			<label for="address.town" class="control-label col-xs-4 col-lg-3"> <g:message
					code="address.town.label" default="Town" />

			</label>
			<div class="col-xs-6">
				<g:textField class="form-control" name="address.town"
					value="${personInstance?.address?.town}" />
			</div>
		</div>

		<div class="form-group ${hasErrors(bean: personInstance, field: 'address.county', 'has-error')} ">
			<label for="address.county" class="control-label col-xs-4 col-lg-3"> <g:message
					code="address.county.label" default="County" />

			</label>
			<div class="col-xs-6">
				<g:textField class="form-control" name="address.county"
					value="${personInstance?.address?.county}" />
			</div>
		</div>
		<div class="form-group ${hasErrors(bean: personInstance, field: 'address.country', 'has-error')} required">
			<label for="address.country" class="control-label col-xs-4 col-lg-3">
				<span class="fa fa-asterisk fa-fw text-danger"></span><g:message code="address.country.label" default="Country" />
			</label>
			<div class="col-xs-6">
				<g:countrySelect class="form-control" name="address.country" required="" default="gbr"
					value="${personInstance?.address?.country}" />
			</div>
		</div>
		</fieldset>
		</div>
	</div> <!-- col-sm-6 -->
	<div class="col-sm-6 form-horizontal">
		<div class="form-group">
			<label for="email1" class="sr-only"> <g:message
					code="person.email1.label" default="Email1" />

			</label>
			<div class="col-xs-9">
				<div class="input-group ${hasErrors(bean: personInstance, field: 'email1', 'has-error')} ">
					<span class="input-group-addon"><i class="fa fa-fw fa-envelope-o text-danger"></i></span>
					<g:field class="form-control" type="email" name="email1" value="${personInstance?.email1}" />					
				</div>
			</div>
			<div class="col-xs-3">
				<g:select class="form-control ${hasErrors(bean: personInstance, field: 'email1Type', 'has-error')}" name="email1Type"
					from="${uk.org.pmms.Person$EmailType?.values()}"
					keys="${uk.org.pmms.Person$EmailType.values()*.name()}"
					value="${personInstance?.email1Type?.name()}"
					/>
			</div>
		</div>
		<div class="form-group">
			<label for="email2" class="sr-only"> <g:message
					code="person.email2.label" default="Email2" />

			</label>
			<div class="col-xs-9">
			<div class="input-group ${hasErrors(bean: personInstance, field: 'email2', 'has-error')} ">
				<span class="input-group-addon"><i class="fa fa-envelope-o"></i> &nbsp;</span>
				<g:field class="form-control" type="email" name="email2"
					value="${personInstance?.email2}" />
			</div>
			</div>

			<label for="email2Type" class="sr-only"> <g:message
					code="person.email2Type.label" default="Email2 Type" />

			</label>
			<div class="col-xs-3">
				<g:select class="form-control ${hasErrors(bean: personInstance, field: 'email2Type', 'has-error')}" name="email2Type"
					from="${uk.org.pmms.Person$EmailType?.values()}"
					keys="${uk.org.pmms.Person$EmailType.values()*.name()}"
					value="${personInstance?.email2Type?.name()}"
					/>

			</div>
		</div>
		<div class="form-group required">
			<label for="phone1" class="sr-only"> <g:message
					code="person.phone1.label" default="Phone1" />
			</label>
			<div class="col-xs-9">
				<div class="input-group ${hasErrors(bean: personInstance, field: 'phone1', 'has-error')}">
					<span class="input-group-addon"><i class="fa fa-fw fa-phone text-danger"></i></span>
					<g:textField class="form-control" name="phone1" required="" value="${personInstance?.phone1}" />
				</div>
			</div>
			<label for="phone1Type" class="sr-only"> <g:message
					code="person.phone1Type.label" default="Phone1 Type" />
			</label>
			<div class="col-xs-3">
				<g:select class="form-control ${hasErrors(bean: personInstance, field: 'phone1Type', 'has-error')}" name="phone1Type"
					from="${uk.org.pmms.Person$PhoneType?.values()}"
					keys="${uk.org.pmms.Person$PhoneType.values()*.name()}" required=""
					value="${personInstance?.phone1Type?.name()}"
					/>
			</div>
		</div>
		<div class="form-group">
			<label for="phone2" class="sr-only"> <g:message
					code="person.phone2.label" default="phone2" />
			</label>
			<div class="col-xs-9">
				<div class="input-group ${hasErrors(bean: personInstance, field: 'phone2', 'has-error')}">
					<span class="input-group-addon"><i class="fa fa-phone"></i> &nbsp;</span>
					<g:textField class="form-control" name="phone2" value="${personInstance?.phone2}" />
				</div>
			</div>
			<label for="phone2Type" class="sr-only"> <g:message
					code="person.phone2Type.label" default="phone2 Type" />
			</label>
			<div class="col-xs-3">
				<g:select class="form-control ${hasErrors(bean: personInstance, field: 'phone2Type', 'has-error')}" name="phone2Type"
					from="${uk.org.pmms.Person$PhoneType?.values()}"
					keys="${uk.org.pmms.Person$PhoneType.values()*.name()}" required=""
					value="${personInstance?.phone2Type?.name()}"
					/>
			</div>
		</div>

		<div class="form-group">
			<label for="phone3" class="sr-only"> <g:message
					code="person.phone3.label" default="phone3" />
			</label>
			<div class="col-xs-9">
				<div class="input-group ${hasErrors(bean: personInstance, field: 'phone3', 'has-error')}">
					<span class="input-group-addon"><i class="fa fa-phone"></i> &nbsp;</span>
					<g:textField class="form-control" name="phone3" value="${personInstance?.phone3}" />
				</div>
			</div>
			<label for="phone3Type" class="sr-only"> <g:message
					code="person.phone3Type.label" default="phone3 Type" />
			</label>
			<div class="col-xs-3">
				<g:select class="form-control ${hasErrors(bean: personInstance, field: 'phone3Type', 'has-error')}" name="phone3Type"
					from="${uk.org.pmms.Person$PhoneType?.values()}"
					keys="${uk.org.pmms.Person$PhoneType.values()*.name()}" required=""
					value="${personInstance?.phone3Type?.name()}"
					/>
			</div>
		</div>
		
	</div><!-- col-sm-6 -->
</div><!-- row -->
<g:javascript>
	 $("#pcSearch").click(function(){
	 	$.ajax({
		    url: "${request.contextPath}/address/addressFinder" ,
		    type: "GET",
		    dataType: "text",
		    data: {postCode: $('input#postcode').val(), unitNo: $('input#unitNo').val()},
		    success: function(data){
		        var json = $.parseJSON(data);
		        
		     
		       $('#addressForm input[name="address.address1"]').val(json.address1);
		       $('#addressForm input[name="address.address2"]').val(json.address2);
		       $('#addressForm input[name="address.town"]').val(json.town);
		       $('#addressForm input[name="address.county"]').val(json.county);
		       $('#addressForm input[name="address.country"]').val(json.country);
		       $('#addressForm').append('<input type="hidden" name="address" value="'+json.id+'"/>')
		       
		   }
		})
	 });
</g:javascript>


