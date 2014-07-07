<%@ page import="uk.org.pmms.Supplier"%>


			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Add New Solicitor</h4>
			</div>
			<div class="modal-body">
			<g:form>
				
			

<div class="form-horizontal">
	<div
		class="form-group ${hasErrors(bean: supplierInstance, field: 'name', 'has-error')} required">
		<label for="name" class="control-label col-xs-4 col-lg-3"> <span class="fa fa-asterisk fa-fw text-danger"></span><g:message
					code="supplier.name.label" default="Name" /></label>
		<div class="col-xs-8">
			<g:textField class="form-control" name="name" required=""
				value="${supplierInstance?.name}" />

		</div>
	</div>

	<div
		class="form-group ${hasErrors(bean: supplierInstance, field: 'address.unitNo', 'has-error')} ">
		<label for="address.unitNo" class="control-label col-xs-4 col-lg-3">
			<g:message code="address.unitNo.label" default="Unit No" />
		</label>
		<div class="col-xs-4 col-md-2 col-lg-2">
			<g:textField class="form-control" name="address.unitNo" maxlength="5"
				value="${supplierInstance?.address?.unitNo}" />
		</div>
	</div>

	<div
		class="form-group ${hasErrors(bean: supplierInstance, field: 'address.address1', 'has-error')} required">
		<label for="addrress.address1" class="control-label col-xs-4 col-lg-3">
			<span class="fa fa-asterisk fa-fw text-danger"></span> <g:message
				code="address.address1.label" default="Address1" />
		</label>
		<div class="col-xs-8 col-md-6 col-lg-8">
			<g:textField class="form-control" name="address.address1"
				maxlength="50" required=""
				value="${supplierInstance?.address?.address1}" />
		</div>
	</div>

	<div
		class="form-group ${hasErrors(bean: supplierInstance, field: 'address.address2', 'has-error')} ">
		<label for="address.address2" class="control-label col-xs-4 col-lg-3">
			<g:message code="address.address2.label" default="Address2" />

		</label>
		<div class="col-xs-8 col-md-6 col-lg-8">
			<g:textField class="form-control" name="address.address2"
				maxlength="50" value="${supplierInstance?.address?.address2}" />
		</div>
	</div>

	<div class="form-group">
		<label for="address.town" class="control-label col-xs-2 col-lg-3 ">
			<g:message code="address.town.label" default="Town" />
		</label>
		<div
			class="col-xs-6 col-md-2 col-lg-5 ${hasErrors(bean: supplierInstance, field: 'address.town', 'has-error')} ">
			<g:textField class="form-control" name="address.town"
				value="${supplierInstance?.address?.town}" />
		</div>
	</div>
	<div class="form-group">
		<label for="address.county" class="control-label col-xs-2 col-lg-3">
			<g:message code="address.county.label" default="County" />

		</label>
		<div class="col-xs-6 col-md-3 col-lg-5">
			<g:textField
				class="form-control  ${hasErrors(bean: supplierInstance, field: 'address.county', 'has-error')}"
				name="address.county" value="${supplierInstance?.address?.county}" />
		</div>
	</div>

	<div
		class="form-group ${hasErrors(bean: supplierInstance, field: 'address.postCode', 'has-error')} required">
		<label for="address.postCode" class="control-label col-xs-4 col-lg-3">
			<span class="fa fa-asterisk fa-fw text-danger"></span> <g:message
				code="address.postCode.label" default="Post Code" />
		</label>
		<div class="col-xs-6 col-md-3 col-lg-4">
			<g:textField class="form-control" name="address.postCode" required=""
				value="${supplierInstance?.address?.postCode}" />
		</div>
	</div>

	<div
		class="form-group ${hasErrors(bean: supplierInstance, field: 'address.country', 'has-error')} required">
		<label for="address.country" class="control-label col-xs-4 col-lg-3">
			<span class="fa fa-asterisk fa-fw text-danger"></span> <g:message
				code="address.country.label" default="Country" />
		</label>
		<div class="col-xs-6 col-md-3 col-lg-4">
			<g:textField class="form-control" name="address.country" required=""
				value="${supplierInstance?.address?.country}" />
		</div>
	</div>
</div>
<input type="hidden" name="workTypes" id="workTypes" value="1" />
<div id="saveResult"></div>
<g:actionSubmit url="[controller: 'supplier', action: 'save', resource: supplierInstance]" update="saveResult" class="btn btn-sm btn-success" value="Create"/>
</g:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-fw fa-cross"></i> Cancel</button>
			</div>