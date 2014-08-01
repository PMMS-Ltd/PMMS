<%@ page import="uk.org.pmms.Supplier"%>
<div class="row">
	<div class="col-xs-6 form-horizontal">
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'name', 'has-error')} required">
			<label for="name" class="control-label col-xs-3"> <g:message
					code="supplier.name.label" default="Name" /> <span
				class="required-indicator">*</span>
			</label>
			<div class="col-xs-6">
				<g:textField class="form-control" name="name" required=""
					value="${supplierInstance?.name}" />
		
			</div>
		</div>
		
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'accountNo', 'has-error')} ">
			<label for="accountNo" class="control-label col-xs-3"> <g:message
					code="supplier.accountNo.label" default="Account No" />
		
			</label>
			<div class="col-xs-4">
				<g:textField class="form-control" name="accountNo"
					value="${supplierInstance?.accountNo}" />
		
			</div>
		</div>
		
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'sortCode', 'has-error')} ">
			<label for="sortCode" class="control-label col-xs-3"> <g:message
					code="supplier.sortCode.label" default="Sort Code" />
		
			</label>
			<div class="col-xs-4">
				<g:textField class="form-control" name="sortCode"
					value="${supplierInstance?.sortCode}" />
		
			</div>
		</div>
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'employees', 'has-error')} ">
			<label for="employees" class="control-label col-xs-3"> <g:message
					code="supplier.employees.label" default="Employees" />
		
			</label>
			<div class="col-xs-6">
				<g:select name="employees" from="${uk.org.pmms.Person.list()}"
					multiple="multiple" optionKey="id" size="5"
					value="${supplierInstance?.employees*.id}"
					class="many-to-many form-control" />
		
			</div>
		</div>
		
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'workTypes', 'has-error')} ">
			<label for="workTypes" class="control-label col-xs-3"> <g:message
					code="supplier.workTypes.label" default="Work Types" />
		
			</label>
			<div class="col-xs-6">
				<g:select name="workTypes" from="${uk.org.pmms.SupplierType.list()}"
					multiple="multiple" optionKey="id" size="5"
					value="${supplierInstance?.workTypes*.id}"
					class="many-to-many form-control" />
					<!-- <select class="form-control">
						<g:each in="${uk.org.pmms.SupplierType.findAllByTypeParent(null)}">
						<option value="${it.id }">${it.type }</option>
						</g:each>
					</select>-->
		
			</div>
		</div>
	</div> <!-- End of Left Form Fields -->
	<div class="col-xs-6">
	<div class="row">
		<div class="form-inline col-xs-offset-3">
			<div class="form-group">
				<label class="sr-only" for="unitNo">Unit No</label> <input
					type="text" class="form-control input-sm" id="unitNo" name="address.unitNo"
					placeholder="Unit No" value="${supplierInstance?.address?.unitNo }"/>
			</div>
			<div class="form-group">
				<label class="sr-only" for="postCode">Post Code</label> <input
					type="text" class="form-control input-sm" id="postcode"
					name="address.postCode" placeholder="PostCode" value="${supplierInstance?.address?.postCode }"/>
			</div>
			<div class="form-group">
				<a href="#" class="btn btn-primary btn-sm"
					id="pcSearch" name="postCode"><i class="fa fa-fw fa-search"></i> Search</a>
			</div>
		</div> <!-- end form-inline -->
		</div> <!-- end of row -->
		<div class="row" style="margin-top: 15px;">
		<div id="addressForm" class="form-horizontal">
	 
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'address.address1', 'has-error')} required">
			<label for="addrress.address1" class="control-label col-xs-3">
				<g:message code="address.address1.label" default="Address1" /> <span
				class="required-indicator">*</span>
			</label>
			<div class="col-xs-8">
				<g:textField class="form-control" name="address.address1"
					maxlength="50" required=""
					value="${supplierInstance?.address?.address1}" />
			</div>
		</div>

		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'address.address2', 'has-error')} ">
			<label for="address.address2" class="control-label col-xs-3">
				<g:message code="address.address2.label" default="Address2" />

			</label>
			<div class="col-xs-8">
				<g:textField class="form-control" name="address.address2" maxlength="50" value="${supplierInstance?.address?.address2}" />
			</div>
		</div>

		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'address.town', 'has-error')} ">
			<label for="address.town" class="control-label col-xs-3"> <g:message
					code="address.town.label" default="Town" />

			</label>
			<div class="col-xs-6">
				<g:textField class="form-control" name="address.town"
					value="${supplierInstance?.address?.town}" />
			</div>
		</div>

		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'address.county', 'has-error')} ">
			<label for="address.county" class="control-label col-xs-3"> <g:message
					code="address.county.label" default="County" />

			</label>
			<div class="col-xs-6">
				<g:textField class="form-control" name="address.county"
					value="${supplierInstance?.address?.county}" />
			</div>
		</div>
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'address.country', 'has-error')} required">
			<label for="address.country" class="control-label col-xs-3">
				<g:message code="address.country.label" default="Country" /> <span
				class="required-indicator">*</span>
			</label>
			<div class="col-xs-6">
				<g:textField class="form-control" name="address.country" required=""
					value="${supplierInstance?.address?.country}" />
			</div>
		</div>
		
		<div class="form-group ${hasErrors(bean: supplierInstance, field: 'email', 'has-error')}">
			<label for="email" class="control-label col-xs-3">
				<g:message code="email.label" default="Email" />
			</label>
			<div class="col-xs-6">
				<g:field class="form-control" type="email" name="email"
					value="${supplierInstance?.email}" />
			</div>
		</div>
		</div>
		</div>
	</div>
</div>
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


