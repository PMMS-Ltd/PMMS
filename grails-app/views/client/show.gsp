
<%@ page import="uk.org.pmms.Client"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'client.label', default: 'Client')}" />
	<g:set var="transfers" bean="transferService"/>
<title>${clientInstance.clientId } - Overview</title>
</head>
<body>


	<h1 class="page-header">
		<g:fieldValue bean="${clientInstance}" field="name" />
		<span class="pull-right">
		<small>Overview</small>
		<div class="btn-group">
			<a href="#" class="btn btn-xs btn-default dropdown-toggle"
				data-toggle="dropdown"> <span class="caret"></span> <span
				class="sr-only">Toggle Dropdown</span>
			</a>
			<ul class="dropdown-menu dropdown-menu-right" role="menu">
				<li><g:link action="finances" resource="${clientInstance }">Finances</g:link></li>
			</ul>
		</div>
		</span>
	</h1>
	<g:if test="${flash.message}">
		<div class="alert alert-warning col-xs-4 pull-right alert-dismissable"
			role="status">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			${flash.message}
		</div>
	</g:if>
	<div class="row hidden-xs">
		<div class="col-sm-4 col-lg-2">
			<div class="small-box bg-fountain-blue">
				<div class="small-box-inner">
					<h3>34</h3>
					<p>Open Jobs</p>
				</div>
				<div class="icon">
					<i class="fa fa-wrench"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-4 col-lg-2">
			<div class="small-box bg-danger">
				<div class="small-box-inner">
					<h3>55</h3>
					<p>Arrears</p>
				</div>
				<div class="icon">
					<i class="fa fa-gbp"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-4 col-lg-2">
			<div class="small-box bg-saffron">
				<div class="small-box-inner">
					<h3>18</h3>
					<p>Notifications</p>
				</div>
				<div class="icon">
					<i class="fa fa-bullhorn"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-4 col-lg-2">
			<div class="small-box bg-shamrock">
				<div class="small-box-inner">
					<h3>5</h3>
					<p>Approvals</p>
				</div>
				<div class="icon">
					<i class="fa fa-gavel"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-4 col-lg-2">
			<div class="small-box bg-rebecca-purple">
				<div class="small-box-inner">
					<h3>9</h3>
					<p>Upcoming Events</p>
				</div>
				<div class="icon">
					<i class="fa fa-calendar"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-4 col-lg-2">
			<div class="small-box" style="background: #95a5a6;">
				<div class="small-box-inner">
					<h3>${transfers.getTransfersByClient(clientInstance).size()}</h3>
					<p>Transfers</p>
				</div>
				<div class="icon">
					<i class="fa fa-exchange"></i>
				</div>
				<g:link controller="transfer" action="index" class="small-box-footer" params="['filter.client':clientInstance.id]">More info <i
					class="fa fa-arrow-circle-right fa-fw"></i></g:link>
			</div>
		</div>
	</div>
	<div class="row" style="height: 250px;">
		<div class="col-lg-6 col-sm-8 col-xs-12" style="height: 100%;">
			<div class="panel panel-default" style="height: 100%;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-fw fa-cog"></i> Details
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs"
								data-toggle="dropdown"> <i class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><g:link class="edit"
										action="edit" resource="${clientInstance}">
										<i class="fa fa-pencil-square-o fa-fw"></i> Edit
									</g:link></li>

							</ul>
						</div>
					</h3>
				</div>
				<div class="panel-body">
					<div class="row">
					<div class="col-xs-12 col-sm-6">
						<table class="table table-condensed">
					<tr>
						<th class="col-xs-4">
							<g:message code="client.clientId.label" default="Client Id" />
						</th>
						<td>
							<g:fieldValue bean="${clientInstance}" field="clientId" />
						</td>
					</tr>
					<tr>
						<th>Address</th>
						<td>
							${clientInstance.address }
						
						</td>
					</tr>
					<tr>
						<th>
							<g:message code="client.yearStart.label" default="Year Start" />
						</th>
						<td>
							<g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearStart}" />
						</td>
					</tr>
					<tr>
						<th>
							<g:message code="client.yearEnd.label" default="Year End" />
						</th>
						<td>
							<g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearEnd}" />
						</td>
					</tr>
					</table>
					</div>
					<div class="col-xs-6 hidden-xs">
					<img
						src="http://maps.googleapis.com/maps/api/staticmap?center=${clientInstance.address}&amp;zoom=17&amp;size=400x200&amp;sensor=false&amp;scale=1&amp;maptype=roadmap&amp;markers=color:red%7C${clientInstance.address}" width="90%"/>
					</div>
				</div>
				
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-sm-4 col-xs-12" style="height: 100%;">
			<div class="panel panel-default" style="height: 100%;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-shield fa-fw"></i> Insurance
					</h3>
				</div>
				<div class="panel-body">
				
					<form class="form-horizontal" role="form">
						<g:if test="${clientInstance?.clientId}">
							<div class="form-group">
								<label for="clientId" class="col-xs-4 control-label"><g:message
										code="client.clientId.label" default="Underwriter" /></label>
								<div class="col-sm-8">
									<p class="form-control-static">
										<g:fieldValue bean="${clientInstance}" field="clientId" />
									</p>
								</div>
							</div>
						</g:if>
						<g:if test="${clientInstance?.yearStart}">
							<div class="form-group">
								<label for="clientId" class="col-xs-4 control-label"><g:message
										code="client.yearStart.label" default="Broker" /></label>
								<div class="col-sm-8">
									<p class="form-control-static">
										<g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearStart}" />
									</p>
								</div>
							</div>
						</g:if>
						<g:if test="${clientInstance?.yearEnd}">
							<div class="form-group">
								<label for="clientId" class="col-xs-4 control-label"><g:message
										code="client.yearEnd.label" default="Renewal Date" /></label>
								<div class="col-sm-8">
									<p class="form-control-static">
										<g:formatDate format="dd-MM-yyyy" date="${clientInstance?.yearEnd}" />
									</p>
								</div>
							</div>
						</g:if>
					</form>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-sm-4 col-xs-12" style="height: 100%;">
			<div class="panel panel-default" style="height: 100%;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<!--<i class="fa fa-file-o fa-fw"></i> Recent Files-->
						<i class="fa fa-fw fa-gbp"></i>Current Service Charge
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs"
								data-toggle="dropdown"> <i class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><g:link controller="serviceCharge" action="listCharges" id="${clientInstance.id}">
										More Info <i class="fa fa-arrow-circle-right fa-fw"></i>
									</g:link></li>

							</ul>
						</div>
					</h3>
				</div>
				<div class="panel-body">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">Type</th>
								<th class="text-center">Service Charge</th>
								<th class="text-center">Ground Rent</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${uk.org.pmms.accounts.ServiceChargeType.findAllByClient(clientInstance) }" var="type">
							<tr class="text-center">
								<td>${type.type }</td>
								<td><g:formatNumber type="currency" number="${type.currentCharge()?.serviceCharge }" currency="GBP" currencySymbol="£"/></td>
								<td><g:formatNumber type="currency" number="${type.currentCharge()?.groundRent }" currency="GBP" currencySymbol="£"/></td>
							</tr>
							</g:each>
						</tbody>
					
					
					</table>
					<!--<g:if test="${files.size() > 0}">
						<table class="table table-condensed table-striped">
							<thead>
								<tr>
									<th>Name</th>
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
						<span class="text-muted">No Files to display</span>
					</g:else>-->
				</div>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top: 15px; margin-bottom: 20px; height: 400px;">
		<div class="col-lg-6 col-sm-12 col-xs-12" style="height: 100%;">
			<div class="panel panel-default" style="height: 100%;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-building-o fa-fw"></i> Properties &nbsp;<span class="badge">${clientInstance?.units?.size() }</span>

						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs"
								data-toggle="dropdown"><i class="caret"></i></a>
							<ul class="dropdown-menu" role="menu">
								<!--<li>View All</li>-->
								<sec:ifAnyGranted roles="ROLE_ADMIN">

									<li><g:link action="create" controller="Property"
											params="['client': clientInstance.id, 'address': clientInstance.address.id]">
											<i class="fa fa-plus text-success"></i> Add Property</g:link></li>
									<li><g:link action="downloadPropertyTemplate" controller="importExport" params="[clientId: clientInstance.clientId]">
											<i class="fa fa-file-excel-o text-success"></i> Download Template</g:link></li>
									<!-- <li><g:link action="uploadProperties" controller="importExport" params="[clientId: clientInstance.clientId]">
											<i class="fa fa-upload text-info"></i> Import Properties</g:link></li>-->
											<li><a href="#" id="importProps"><i class="fa fa-upload text-info"></i> Import Properties</a></li>
								</sec:ifAnyGranted>

							</ul>
						</div>
					</h3>
				</div>
				<div class="panel-body" style="height: 352px; overflow-y: auto;">

					<g:if test="${clientInstance?.units}">
						<table class="table table-condensed table-striped">
							<thead>
								<tr>
									<th>Property ID</th>
									<th>Address</th>
									<th>Type</th>
									<th>Owner</th>

								</tr>
							</thead>
							<tbody>
								<g:each in="${clientInstance.units.sort{it.propertyId}}" var="u">
									<tr>
										<td><g:link controller="property" action="show"
												id="${u.id}">
												${u?.encodeAsHTML()}
											</g:link></td>
											<td>${u.address?.unitNo } ${u.address?.address1 }</td>
											<td>
											${u.propertyType}
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
			</div>
		</div>
		<div class="col-lg-4 col-xs-12" style="height: 100%;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="fa fa-user fa-fw"></span> Directors
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs"
								data-toggle="dropdown"> <i class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><g:link class="edit"
										action="editDirectors" resource="${clientInstance}">
										<i class="fa fa-pencil-square-o fa-fw"></i> Edit
									</g:link></li>

							</ul>
						</div>
						<a href="#" class="btn btn-xs btn-success close-icon hidden"
							style="margin-top: 15px;"><i class="fa fa-fw fa-plus"></i>
							Add Director</a>
					</h3>
				</div>
				<div class="panel-body" style="max-height: 284px; overflow-y: auto;">
					<ul class="list-group">

						<g:if test="${clientInstance?.directors}">

							<g:each in="${clientInstance.directors}" var="e">
								<li class="list-group-item">
									<div class="row">
										<div class="col-xs-2">
											<i class="fa fa-user fa-3x"></i>
										</div>
										<div class="col-xs-10 vcard">
											<h4 class="list-group-item-heading fn n">
												<span class="family-name">
													${e.lastName }
												</span>, <span class="given-name">
													${e.firstName }
												</span> <span class="additional-name">
													${e.initial? e.initial+' ':'' }
												</span>(${e.salutation })
											</h4>
											<p class="list-group-item-text adr">
												<span class="street-address">
													${e.address.unitNo } ${e.address.address1 }
												</span>, <span class="locality">
													${e.address.town }
												</span>, <span class="region">
													${e.address.county }
												</span>, <span class="postal-code">
													${e.address.postCode }
												</span>, <span class="country-name">
													${e.address.country }
												</span>
											</p>
											<p class="list-group-item-text">
												<i class="fa fa-phone"></i> &nbsp;<span class="tel">
													${e.phone1 }
												</span> <strong>@</strong> &nbsp;<a class="email"
													href="mailto:${e.email1 }">
													${e.email1 }
												</a>
											</p>
										</div>
										<div class="col-xs-2 hidden close-icon">
											<a href="#"><i
												class="fa fa-times fa-lg fa-fw pull-right text-danger"></i></a>
										</div>
									</div>
								</li>
							</g:each>

							<a href="#"
								class="btn btn-sm btn-success close-icon hidden pull-right"
								style="margin-top: 15px;"><i class="fa fa-fw fa-plus"></i>
								Add Director</a>

						</g:if>
						<g:else>
							<span class="text-muted">Please add some Directors</span>
						</g:else>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Upload Properties Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <g:form action="uploadProperties" controller="importExport" method="post" enctype="multipart/form-data" class="form">
      	<div class="modal-header">
      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      		<h4 class="modal-title">Import properties</h4>
      	</div>
      	<div class="modal-body">
				<label for="file" class="control-label">Choose a file to import:</label>
				<input type="file" name="file" class="form-control" id="file" />
				<input type="hidden" name="id" value="${clientInstance.id }"/>
		</div>
		<div class="modal-footer">
			<button class="btn btn-sm btn-info" type="submit"><i class="fa fa-fw fa-upload"></i> Upload</button>
		</div>
		</g:form>
    </div>
  </div>
</div>
<g:javascript>
	$(document).on('click','#importProps',function(){
		$('#myModal').modal('show');
	})
</g:javascript>
</body>
</html>
