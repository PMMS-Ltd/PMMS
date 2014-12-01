
<%@ page import="uk.org.pmms.accounts.ServiceCharge"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'serviceCharge.label', default: 'ServiceCharge')}" />
<title>Add Charges</title>
</head>
<body>
	<form method="post">
		<div class="row">
			<div class="col-xs-12">
				<h1 class="page-header">
					${client.name}<small> (${client.clientId })</small>
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4">
			<h2>Add Charges</h2>
				<table class="table">
					<thead>
						<tr>
							<th>Start Date</th>
							<th>End Date</th>
						</tr>
					<tbody>
						<tr>
							<td><input class="form-control input-sm" type="date"
								name="startDate" /></td>
							<td><input class="form-control input-sm" type="date"
								name="endDate" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8">
				<table class="table">
					<thead>
						<tr>
							<th class="col-xs-1">Type</th>
							<th class="col-xs-2">Description</th>
							<th class="col-xs-1">Ground Rent</th>
							<th class="col-xs-1">Service Charge</th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${svcTypes }" status="i" var="type">
							<tr>
								<td class="hidden"><input type="hidden"
									name="typeId[${i }]" value="${type.id }"></td>
								<td>
									${type.type }
								</td>
								<td>
									${type.description }
								</td>

								<td><input class="form-control input-sm" type="text"
									name="groundRent[${i }]" /></td>
								<td><input class="form-control input-sm" type="text"
									name="svcCharge[${i }]" /></td>

							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<button class="btn btn-success">Submit</button>
			</div>
		</div>
	</form>
</body>
</html>
