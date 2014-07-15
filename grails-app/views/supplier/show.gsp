
<%@ page import="uk.org.pmms.Supplier"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'supplier.label', default: 'Supplier')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<h1 class="page-header">
		${supplierInstance.name }
	</h1>
	<g:if test="${flash.message}">
		<div class="alert alert-warning" role="status">
			${flash.message}
		</div>
	</g:if>
	<div id="show-supplier" class="hidden-xs" role="main">
		<div class="row" style="margin-bottom: 20px; max-height: 325px;">
			<div class="col-xs-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="fa fa-cog fa-fw"></span> Details
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs" data-toggle="dropdown"> <i
								class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><g:link class="edit" action="edit"
										resource="${supplierInstance}">
										<i class="fa fa-pencil-square-o fa-fw"></i> Edit</g:link></li>

							</ul>
						</div>
					</div>
					<div class="panel-body">
						<ul class="list-group">

							<g:if test="${supplierInstance?.name}">
								<li class="list-group-item"><strong><g:message
											code="supplier.name.label" default="Name" /></strong> - <g:fieldValue
										bean="${supplierInstance}" field="name" /></li>
							</g:if>

							<g:if test="${supplierInstance?.accountNo}">
								<li class="list-group-item"><strong><g:message
											code="supplier.accountNo.label" default="Account No" /></strong> - <g:fieldValue
										bean="${supplierInstance}" field="accountNo" /></li>
							</g:if>

							<g:if test="${supplierInstance?.sortCode}">
								<li class="list-group-item"><strong><g:message
											code="supplier.sortCode.label" default="Sort Code" /></strong> - <g:fieldValue
										bean="${supplierInstance}" field="sortCode" /></li>
							</g:if>

							<g:if test="${supplierInstance?.address}">
								<li class="list-group-item"><strong><g:message
											code="supplier.address.label" default="Address" /></strong>
									<address class="list-group-item-text">
										<g:fieldValue bean="${supplierInstance}" field="address" />
									</address></li>
							</g:if>
						</ul>
					</div>
				</div>

			</div>
			<div class="col-xs-4" style="height: 100%;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="fa fa-user fa-fw fa-lg"></span> Contacts
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs" data-toggle="dropdown"> <i
								class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation">
									<g:link action="editDirectors" resource="${supplierInstance}">
										<i class="fa fa-pencil-square-o fa-fw"></i> Edit
									</g:link>
									
								</li>

							</ul>
						</div>
						<a href="#" class="btn btn-xs btn-success close-icon hidden" style="margin-top: 15px;"><i class="fa fa-fw fa-plus"></i> Add Contact</a>
					</div>
					<div class="panel-body" style="min-height: 233px; max-height:284px; overflow-y: auto;">
						<ul class="list-group">

							<g:if test="${supplierInstance?.employees}">

								<g:each in="${supplierInstance.employees}" var="e">
									<li class="list-group-item">
										<div class="row">
											<div class="col-xs-1">
												<i class="fa fa-user fa-3x"></i>
											</div>
											<div class="col-xs-9 vcard">
												<h4 class="list-group-item-heading fn n">
													<span class="family-name">${e.lastName }</span>,
													<span class="given-name">${e.firstName }</span>
													<span class="additional-name">${e.initial? e.initial+' ':'' }</span>(${e.salutation })
												</h4>
												<p class="list-group-item-text adr">
													<span class="street-address">${e.address.unitNo } ${e.address.address1 }</span>,
													<span class="locality">${e.address.town }</span>, 
													<span class="region">${e.address.county }</span>, 
													<span class="postal-code">${e.address.postCode }</span>,								
													<span class="country-name">${e.address.country }</span>
												</p>
												<p class="list-group-item-text">
													<i class="fa fa-phone"></i> &nbsp;<span class="tel">${e.phone1 }</span>
													<strong>@</strong> &nbsp;<a class="email" href="mailto:${e.email1 }">${e.email1 }</a>
												</p>
											</div>
											<div class="col-xs-2 hidden close-icon">
												<a href="#"><i class="fa fa-times fa-lg fa-fw pull-right text-danger"></i></a>
											</div>
										</div>
									</li>
								</g:each>
								
									<a href="#" class="btn btn-sm btn-success close-icon hidden pull-right" style="margin-top: 15px;"><i class="fa fa-fw fa-plus"></i> Add Contact</a>
								
							</g:if>

						</ul>
					</div>
				</div>
			</div>

			<div class="col-xs-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span>Work Areas</span>
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs" data-toggle="dropdown"> <i
								class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><g:link class="edit" action="edit"
										resource="${supplierInstance}">
										<i class="fa fa-pencil-square-o fa-fw"></i> Edit</g:link></li>

							</ul>
						</div>
					</div>
					<div class="panel-body">
						<g:if test="${supplierInstance?.workTypes}">
							<g:each in="${supplierInstance.workTypes}" var="w">
								<h4 style="display: inline-block;">
									<span class="label label-default"> ${w?.encodeAsHTML()}
									</span>
								</h4>
							</g:each>
						</g:if>
						<g:else>
							<p class="text-muted">Please add some Work Types</p>
						</g:else>
					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-xs-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="fa fa-puzzle-piece fa-fw fa-lg"></span> Contracts
						<div class="dropdown pull-right">
							<a href="#" class="dropdown-toggle btn btn-default btn-xs" data-toggle="dropdown"> <i
								class="caret"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><g:link controller="contract" action="create"
										params="['supplier': supplierInstance.id]">
										<i class="fa fa-plus fa-fw text-success"></i> Add New</g:link></li>
										<li role="presentation"><g:link action="edit" resource="${supplierInstance }">
										<i class="fa fa-pencil-square-o fa-fw"></i> Edit</g:link></li>

							</ul>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>ID</th>
									<th>Client</th>
									<th>Work Type</th>
									<th>Expiry Date</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${supplierInstance.contracts }" var="c">
									<tr>
										<td><g:link controller="contract" action="show"
												id="${c.id}">
												${c.ref}
											</g:link></td>
										<td>
											${c.client}
										</td>
										<td>
											${c.contractType}
										</td>
										<td>
											<g:formatDate date="${c.endDate}" format="dd/MM/yyyy"/>
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="col-xs-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="fa fa-file-o fa-fw fa-lg"></span> Invoices
					</div>
					<div class="panel-body">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th >Invoice No.</th>
									<th >Amount</th>
									<th >Date Received</th>
									<th >Ref</th>
									<th >Date Paid</th>
									<th >Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td >548/74</td>
									<td >£84.25</td>
									<td >02/06/2014</td>
									<td >Job 64871</td>
									<td >05/06/2014</td>
									<td ><span class="label label-success">Paid</span><td>
								</tr>
								<tr>
									<td >548/75</td>
									<td >£22.85</td>
									<td >03/06/2014</td>
									<td >Job 64887</td>
									<td></td>
									<td ><span class="label label-info">Approved</span><td>
								</tr>
								<tr>
									<td >548/81</td>
									<td >£2542.65</td>
									<td >08/06/2014</td>
									<td >Job 55421</td>
									<td></td>
									<td ><span class="label label-warning">Approval Req.</span><td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			
			</div>
		</div>
	</div>
	<g:javascript>
		$('.editBtn').click(function(){$('.close-icon').toggleClass('hidden')});
	</g:javascript>
</body>
</html>
