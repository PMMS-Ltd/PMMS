
<%@ page import="uk.org.pmms.Client"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'client.label', default: 'Client')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>


		<h1 class="page-header"><g:fieldValue bean="${client}" field="name" />
		<div class="btn-group">
  <a href="#" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </a>
  
  <ul class="dropdown-menu" role="menu">
  
    <li><g:link
     action="edit" resource="${client}">
				<i class="fa fa-edit fa-lg"></i> <g:message code="default.button.edit.label" default="Edit" /></g:link></li>
    <li class="divider"></li>
    <sec:ifAnyGranted roles="ROLE_ADMIN">
    <li style="padding-left:20px;">
    <g:form action="delete" method="DELETE" id="${client.id}">
    	<button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash-o fa-fw"></i> <g:message code="default.button.delete.label" default="Delete"/></button>
      </g:form>	
    </li>
    </sec:ifAnyGranted>
  </ul>

</div></h1>
	<div class="clearfix"></div>
	<g:if test="${flash.message}">
		<div class="alert alert-warning col-xs-4 pull-right alert-dismissable" role="status">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${flash.message}
		</div>
	</g:if>
	<div class="row" style="min-height: 300px;">
		<div class="col-md-2 col-sm-4 col-xs-6" style="height: 100%;">

			<h3>Details</h3>
			<dl class="dl-horizontal pull-left">
				<dt>
					<g:message code="client.clientId.label" default="Client Id" />
				</dt>
				<dd>
					<g:fieldValue bean="${client}" field="clientId" />
				</dd>
				<dt>
					<g:message code="client.yearStart.label" default="Year Start" />
				</dt>
				<dd>
					<g:formatDate format="dd-MM-yyyy" date="${client?.yearStart}" />
				</dd>
				<dt>
					<g:message code="client.yearEnd.label" default="Year End" />
				</dt>
				<dd>
					<g:formatDate format="dd-MM-yyyy" date="${client?.yearEnd}" />
				</dd>
				<dt>
					<g:message code="client.accountName.label" default="Account Name" />
				</dt>
				<dd>
					<g:fieldValue bean="${client}" field="accountName" />
				</dd>
				<dt>
					<g:message code="client.accountNo.label" default="Account No" />
				</dt>
				<dd>
					<g:formatNumber number="${client.accountNo}" format="########"
						minIntegerDigits="8" />
				</dd>
			</dl>

		</div>

		<div class="col-md-2 col-sm-4 col-xs-6" style="height: 100%;">

			<h3>Insurance</h3>
			<form class="form-horizontal form-condensed pull-left" role="form">
				<g:if test="${client?.clientId}">
					<div class="form-group">
						<label for="clientId" class="col-sm-5 control-label"><g:message
								code="client.clientId.label" default="Underwriter" /></label>
						<div class="col-sm-7">
							<p class="form-control-static">
								<g:fieldValue bean="${client}" field="clientId" />
							</p>
						</div>
					</div>
				</g:if>
				<g:if test="${client?.yearStart}">
					<div class="form-group">
						<label for="clientId" class="col-sm-5 control-label"><g:message
								code="client.yearStart.label" default="Broker" /></label>
						<div class="col-sm-7">
							<p class="form-control-static">
								<g:formatDate format="dd-MM-yyyy" date="${client?.yearStart}" />
							</p>
						</div>
					</div>
				</g:if>
				<g:if test="${client?.yearEnd}">
					<div class="form-group">
						<label for="clientId" class="col-sm-5 control-label"><g:message
								code="client.yearEnd.label" default="Renewal Date" /></label>
						<div class="col-sm-7">
							<p class="form-control-static">
								<g:formatDate format="dd-MM-yyyy" date="${client?.yearEnd}" />
							</p>
						</div>
					</div>
				</g:if>
				<g:if test="${client?.accountName}">
					<div class="form-group">
						<label for="clientId" class="col-sm-5 control-label"><g:message
								code="client.accountName.label" default="Policy No." /></label>
						<div class="col-sm-7">
							<p class="form-control-static">
								<g:fieldValue bean="${client}" field="accountName" />
							</p>
						</div>
					</div>
				</g:if>
				<g:if test="${client?.accountNo}">
					<div class="form-group">
						<label for="clientId" class="col-sm-5 control-label"><g:message
								code="client.accountNo.label" default="Account No" /></label>
						<div class="col-sm-7">
							<p class="form-control-static">
								<g:formatNumber number="${client.accountNo}" format="########"
									minIntegerDigits="8" />
							</p>
						</div>
					</div>
				</g:if>
			</form>
		</div>
	</div>
	<div class="row" style="margin-top: 5px;">
		<div class="col-md-6 col-sm-12 col-xs-12">
				<h3>Properties 
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<g:link class="btn btn-success btn-xs" action="create" controller="Property" params="['client': client.id, 'address': client.address.id]"><i class="fa fa-plus"></i> Add Property</g:link>
				</sec:ifAnyGranted>
			</h3>
				<g:if test="${client?.units}">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>Property Id</th>
							<th>Address</th>
							<th>Owner</th>
							
						</tr>
					</thead>
					<tbody>
						<g:each in="${client.units.sort{it.propertyId}}" var="u">
							<tr>
								<td><g:link controller="property" action="show"
										id="${u.id}">
										${u?.encodeAsHTML()}
									</g:link></td>
								<td >
									${u?.address}
								</td>
								<td>
									${u?.owner}
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				</g:if>
				<g:else>
				<h4>No Properties to display</h4>
				</g:else>
		</div>
		
		<div class="col-md-6">
			<h3>
				Files
				<!-- <button class="btn btn-info btn-xs" data-toggle="modal"
					data-target="#uploadFile">
					<span class="fa fa-upload"></span> Upload
				</button>-->
			</h3>
			<g:if test="${files.size() > 0}">
				<table class="table table-condensed table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th>Actions</th>
							<th>Size</th>
							<th>Type</th>
						</tr>
					</thead>
					<tbody>
						<g:each var="file" in="${files}" status="i">
							<tr>
								<td><a class="btn btn-xs btn-success"
									href="${grailsApplication.config.grails.opencmis.alfresco.atomurl}/content/?id=${file.'cmis:objectId' }">
										<i class="fa fa-download"></i>
								</a> ${file.'cmis:name' }</td>
								<td><!-- <a class="btn btn-xs btn-default" href="#"> <i
										class="fa fa-pencil fa-lg"></i>
								</a>
									<button class="btn btn-xs btn-danger" data-toggle="modal"
										data-target="#confirmDelete${i}">
										<i class="fa fa-trash-o fa-lg"></i>
									</button>--></td>
								<td>
									${file.'cmis:contentStreamLength' }
								</td>
								<td
									style="max-width: 150px; text-overflow: ellipsis; overflow: hidden;">
									${file.'cmis:contentStreamMimeType' }
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>
			<g:else>
				<h4>No Files to display</h4>
			</g:else>
		</div>
	</div>
</body>
</html>
