<%@ page import="uk.org.pmms.Property"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'property.label', default: 'Property')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<r:require module="printArea" />
</head>
<body>
	<div id="show-property" role="main">
		<h1 class="page-header">
			${propertyInstance?.propertyId }
			<div class="btn-group">
				<a href="#" class="btn btn-xs btn-default dropdown-toggle"
					data-toggle="dropdown"> <span class="caret"></span> <span
					class="sr-only">Toggle Dropdown</span>
				</a>

				<ul class="dropdown-menu" role="menu">

					<sec:ifAnyGranted roles="ROLE_USER">
						<li><g:link action="edit" id="${propertyInstance.id }">
								<i class="fa fa-pencil fa-fw"></i> Edit</g:link></li>
					</sec:ifAnyGranted>
				</ul>

			</div>
			<br />
			<small>
				${propertyInstance?.address }
			</small>
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row" style="margin-bottom: 25px; height: 245px;">
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Property Details</h3>
					</div>
					<div class="panel-body">

						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>Client</th>
									<td>
										${propertyInstance?.client?.name}
									</td>
								</tr>
								<tr>
									<th>Property Id</th>
									<td>
										${propertyInstance?.propertyId }
									</td>
								</tr>
								<tr>
									<th>Property Address</th>
									<td>
										${propertyInstance?.address }
									</td>
								</tr>
								<tr>
									<th>Property Type</th>
									<td>
										${propertyInstance?.propertyType }
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<g:if test="${propertyInstance?.owner}">
				<div class="col-lg-4" style="height: 100%;">
					<div class="panel panel-default" style="height: 100%;">
						<div class="panel-heading">
							<h3 class="panel-title">Owner Details</h3>
						</div>
						<div class="panel-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>Name</th>
										<td>
											${propertyInstance?.owner} &nbsp; <g:if
												test="${propertyInstance?.client?.createCriteria().list{directors{eq('id',propertyInstance?.owner?.id)}}.size() > 0}">
												<span class="label label-info">Director</span>
											</g:if>
										</td>
									</tr>
									<tr>
										<th>Contact Address</th>
										<td>
											${propertyInstance?.owner?.address }
										</td>
									</tr>
									<g:if test="${propertyInstance?.owner?.email1 }">
										<tr>
											<th><i class="fa fa-fw fa-envelope"></i> Email</th>
											<td>
												${propertyInstance?.owner?.email1 }
											</td>
										</tr>
									</g:if>
									<g:if test="${propertyInstance?.owner?.phone1 }">
										<tr>
											<th><i class="fa fa-fw fa-phone"></i> Phone</th>
											<td>
												${propertyInstance?.owner?.phone1 }
											</td>
										</tr>
									</g:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</g:if>
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Recent Issues</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-condensed">
							<thead>
								<tr>
									<th>ID</th>
									<th>Status</th>
									<th>Last Updated</th>
									<th>Priority</th>
								</tr>
								<tr>
									<td>48795</td>
									<td><span class="label label-success">Open</span>
									<td>10/01/2015</td>
									<td><i class="fa fa-fw fa-flag text-info"></i></td>
								</tr>
								<tr>
									<td>48796</td>
									<td><span class="label label-warning">Waiting</span>
									<td>15/01/2015</td>
									<td><i class="fa fa-fw fa-flag text-success"></i></td>
								</tr>
								<tr>
									<td>48797</td>
									<td><span class="label label-danger">Closed</span>
									<td>18/01/2015</td>
									<td><i class="fa fa-fw fa-flag text-danger"></i></td>
								</tr>
							</thead>
						</table>
						<div class="paginate"></div>
					</div>
				</div>
			</div>
		</div><!-- end of row -->
		<div class="row" style="height: 395px;">
			<div class="col-lg-3" style="height: 100%;">
				<div class="panel panel-default" style="height: 100%;">
					<div class="panel-heading">
						<h3 class="panel-title">
							Finances <span class="text-muted">(<g:formatDate
									date="${propertyInstance?.serviceChargeType?.currentCharge()?.startDate }"
									format="dd/MM/yyy" /> - <g:formatDate
									date="${propertyInstance?.serviceChargeType?.currentCharge()?.endDate }"
									format="dd/MM/yyy" />)
							</span>
						</h3>
					</div>
					<div class="panel-body">

						<table class="table table-bordered">
							<tr>
								<th>Service Charge Type</th>
								<td>
									${propertyInstance?.serviceChargeType} (${propertyInstance?.serviceChargeType?.description})
								</td>
							</tr>
							<tr>
								<th>Current Service Charge</th>
								<td><g:formatNumber
										number="${propertyInstance?.serviceChargeType?.currentCharge()?.serviceCharge}"
										type="currency" currencyCode="GBP" currencySymbol="£" /></td>
							</tr>
							<tr>
								<th>Current Ground Rent</th>
								<td><g:formatNumber
										number="${propertyInstance?.serviceChargeType?.currentCharge()?.groundRent}"
										type="currency" currencyCode="GBP" currencySymbol="£" /></td>
							</tr>
							<tr>
								<th>Payment Options</th>
								<td>
									<table class="table">
										<tr
											class="${propertyInstance?.serviceChargeType?.monthly? '':'text-muted' }">
											<td>Monthly</td>
											<td><g:formatNumber
													number="${propertyInstance?.serviceChargeType?.currentCharge()?.monthlyAmount }"
													type="currency" currencyCode="GBP" currencySymbol="£" /></td>
											</td>
										</tr>
										<tr
											class="${propertyInstance?.serviceChargeType?.quarterly? '':'text-muted' }">
											<td>Quaterly</td>
											<td><g:formatNumber
													number="${propertyInstance?.serviceChargeType?.currentCharge()?.quarterlyAmount }"
													type="currency" currencyCode="GBP" currencySymbol="£" /></td>
											</td>
										</tr>
										<tr
											class="${propertyInstance?.serviceChargeType?.halfYearly? '':'text-muted' }">
											<td>Half Yearly</td>
											<td><g:formatNumber
													number="${propertyInstance?.serviceChargeType?.currentCharge()?.halfYearlyAmount }"
													type="currency" currencyCode="GBP" currencySymbol="£" /></td>
											</td>
										</tr>
										<tr
											class="${propertyInstance?.serviceChargeType?.annually? '':'text-muted' }">
											<td>Annually</td>
											<td><g:formatNumber
													number="${propertyInstance?.serviceChargeType?.currentCharge()?.annualAmount }"
													type="currency" currencyCode="GBP" currencySymbol="£" /></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-3" style="height: 100%;">
				<div class="panel panel-default" style="height: 100%;">
					<div class="panel-heading">

						<h3 class="panel-title">
							Arrears
							<g:link controller="property" action="svcStatement"
								id="${propertyInstance.id}"
								class="btn btn-default btn-xs pull-right" data-toggle="modal"
								data-target=".svcStatementModal" style="color: #fff;">
								<i class="fa fa-fw fa-file"></i>Statement</g:link>
						</h3>
					</div>
					<div class="panel-body">



						<table class="table table-bordered">
							<tr>
								<th class="col-lg-3">Due</th>
								<td><g:formatNumber number="${arrears.due }"
										type="currency" currencyCode="GBP" currencySymbol="£" /></td>
							</tr>
							<tr>
								<th>Arrears</th>
								<td class="${arrears.arrears < 0 ? 'text-danger': '' }"><g:formatNumber
										number="${arrears.arrears }" type="currency"
										currencyCode="GBP" currencySymbol="£" /></td>
							</tr>
							<tr>
								<th>Received</th>
								<td><g:formatNumber number="${arrears.received }"
										type="currency" currencyCode="GBP" currencySymbol="£" /></td>
							</tr>
							<tr>
								<th>Owed</th>
								<td class="${arrears.owed > 0 ? 'text-danger': '' }"><g:formatNumber
										number="${arrears.owed }" type="currency" currencyCode="GBP"
										currencySymbol="£" /></td>
							</tr>
							<tr>
								<th>Reminders</th>
								<td>
									<table class="table">
										<tr>
											<th>Reminder 1</th>
											<td>Date</td>
											<td>Amount</td>
										</tr>
										<tr>
											<th>Reminder 2</th>
											<td>Date</td>
											<td>Amount</td>
										</tr>
										<tr>
											<th>Reminder 3</th>
											<td>Date</td>
											<td>Amount</td>
										</tr>
										<tr>
											<th>Solicitors</th>
											<td>Date</td>
											<td>Amount</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<!--<g:link controller="property" action="svcStatement" id="${propertyInstance.id}" class="btn btn-success btn-sm" data-toggle="modal" data-target=".svcStatementModal"><i class="fa fa-fw fa-file"></i> View Statement</g:link>-->
					</div>
				</div>
			</div>
			<div class="col-lg-6" style="height: 100%;">
				<div class="panel panel-default" style="height: 100%;">
					<div class="panel-heading">
						<h3 class="panel-title">Files</h3>
					</div>

					<div class="panel-body">
						<g:render template="../templates/files"	model="[files: files, objectType: 'Property', objectId: propertyInstance.id]" />
					</div>
				</div>
			</div>
		</div><!--  end of row -->
		<div class="modal fade svcStatementModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content"></div>
			</div>
		</div>
		<r:script>
			$(document).on('click','#printSvc', function(){
    			$('#svcStatement.modal-body').printArea({mode: 'iframe'});
 			});
    </r:script>
		<g:render template="../templates/uploadFileTemplate"
			model="[folder: propertyInstance.repoFolderId, objectId: propertyInstance.id, objectType: 'Property']" />
</body>
</html>
