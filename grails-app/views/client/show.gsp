
<%@ page import="uk.org.pmms.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
			
		<div class="page-header">	
			<h1><g:fieldValue bean="${clientInstance}" field="name"/></h1>
		</div>
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group">
				<g:link class="btn btn-primary" action="edit" resource="${clientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
			</div>
			<div class="btn-group">
				<sec:ifAnyGranted roles="ROLE_ADMIN"><g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAnyGranted>
			</div>
		</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row" style="min-height: 300px;">
			<div class="col-md-2 col-sm-4 col-xs-6" style="height: 100%;">
			
			<h3>Details</h3>
			<dl class="dl-horizontal pull-left">
              <dt><g:message code="client.clientId.label" default="Client Id" /></dt>
              <dd><g:fieldValue bean="${clientInstance}" field="clientId"/></dd>
              <dt><g:message code="client.yearStart.label" default="Year Start" /></dt>
              <dd><g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearStart}" /></dd>
			  <dt><g:message code="client.yearEnd.label" default="Year End" /></dt>
			  <dd><g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearEnd}" /></dd>
			  <dt><g:message code="client.accountName.label" default="Account Name" /></dt>
			  <dd><g:fieldValue bean="${clientInstance}" field="accountName"/></dd>
			  <dt><g:message code="client.accountNo.label" default="Account No" /></dt>
			  <dd><g:formatNumber number="${clientInstance.accountNo}" format="########" minIntegerDigits="8" /></dd>
            </dl>  
				
			</div>
			
			<div class="col-md-2 col-sm-4 col-xs-6" style="height: 100%;">
			
				<h3>Insurance</h3>
				<form class="form-horizontal form-condensed pull-left" role="form">				
				<g:if test="${clientInstance?.clientId}">
				<div class="form-group">
					<label for="clientId" class="col-sm-5 control-label"><g:message code="client.clientId.label" default="Underwriter" /></label>
					<div class="col-sm-7">
						<p class="form-control-static"><g:fieldValue bean="${clientInstance}" field="clientId"/></p>
					</div>
				</div>
				</g:if>
				<g:if test="${clientInstance?.yearStart}">
				<div class="form-group">
					<label for="clientId" class="col-sm-5 control-label"><g:message code="client.yearStart.label" default="Broker" /></label>
					<div class="col-sm-7">
						<p class="form-control-static"><g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearStart}" /></p>
					</div>
				</div>
				</g:if>
				<g:if test="${clientInstance?.yearEnd}">
				<div class="form-group">
					<label for="clientId" class="col-sm-5 control-label"><g:message code="client.yearEnd.label" default="Renewal Date" /></label>
					<div class="col-sm-7">
						<p class="form-control-static"><g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearEnd}" /></p>
					</div>
				</div>
				</g:if>
				<g:if test="${clientInstance?.accountName}">
				<div class="form-group">
					<label for="clientId" class="col-sm-5 control-label"><g:message code="client.accountName.label" default="Policy No." /></label>
					<div class="col-sm-7">
						<p class="form-control-static"><g:fieldValue bean="${clientInstance}" field="accountName"/></p>
					</div>
				</div>
				</g:if>
				<g:if test="${clientInstance?.accountNo}">
				<div class="form-group">
					<label for="clientId" class="col-sm-5 control-label"><g:message code="client.accountNo.label" default="Account No" /></label>
					<div class="col-sm-7">
						<p class="form-control-static"><g:formatNumber number="${clientInstance.accountNo}" format="########" minIntegerDigits="8" /></p>
					</div>
				</div>
				</g:if>
				</form>
			</div>
		</div>
		<div class="row" style=" margin-top: 5px;">
			<div class="col-md-6 col-sm-12 col-xs-12" style="border: 1px solid #efefef;">
				<g:if test="${clientInstance?.units}">
			<h3>Properties</h3>
				<table class="table table-condensed">
				<thead>
					<tr>
						<td>Property Id</td>
						<td>Unit No</td>
						<td>Address</td>
						<td>Town</td>
						<td>County</td>
						<td>Post Code</td>
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstance.units}" var="u">
					<tr>
						<td><g:link controller="property" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></td>
						<td class="text-center">${u?.unitNo}</td>
						<td>${u?.address1}</td>
						<td>${u?.town}</td>
						<td>${u?.county}</td>
						<td>${u?.postCode}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</g:if>
			<div class="col-md-6 col-sm-12 col-xs-12" style="border: 1px solid #efefef;">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed commodo lacus non libero ultrices, vitae ullamcorper est tempus. Maecenas condimentum euismod sem, quis feugiat sapien. Quisque ultrices nunc in tortor dapibus ornare. Praesent mollis nibh ut sagittis hendrerit. Integer blandit rhoncus congue. Nam luctus lacus id tellus faucibus, vel accumsan diam luctus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi vitae ullamcorper odio. Nunc vehicula, tellus in scelerisque condimentum, dui urna ornare leo, ac tincidunt orci nisl in neque. Quisque quis velit lobortis elit aliquam euismod. Nulla vehicula leo ut erat consectetur consectetur. Integer risus elit, imperdiet a dignissim quis, aliquet vulputate velit. Nam pharetra ipsum vel tellus pharetra, pellentesque lobortis eros condimentum. Mauris et tristique purus, vitae iaculis diam. Curabitur at neque sed magna ornare scelerisque at non sapien. Fusce rhoncus at dui vitae scelerisque. Nulla et metus ut dui gravida fringilla in a lacus. Proin pellentesque mauris sit amet nisi tincidunt sollicitudin. Nunc aliquam faucibus arcu rutrum molestie.</p>
			</div>
		</div>
	</body>
</html>
