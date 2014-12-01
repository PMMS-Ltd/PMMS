
<%@ page import="uk.org.pmms.Client"%>
<%@ page import="uk.org.pmms.accounts.ServiceCharge"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'client.label', default: 'Client')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<r:require module="printArea" />
</head>
<body>
	<h1 class="page-header">
		${clientInstance.name} <small>(${clientInstance.clientId })</small>
		<!--<span class="pull-right"> <small>Finances</small>
			<div class="btn-group">
				<a href="#" class="btn btn-xs btn-default dropdown-toggle"
					data-toggle="dropdown"> <span class="caret"></span> <span
					class="sr-only">Toggle Dropdown</span>
				</a>

				<ul class="dropdown-menu dropdown-menu-right" role="menu">
					<li><g:link action="show" resource="${clientInstance}">Overview</g:link></li>
				</ul>
			</div> <!-- ./btn-group -->
		<!-- </span>-->
		<span style="font-size: 0.5em;">
		<ul class="nav nav-pills pull-right">
		  <li role="presentation"><g:link action="show" resource="${clientInstance }">Overview</g:link></li>
		  <li role="presentation" class="active"><a href="#">Arrears</a></li>
		  <li role="presentation"><g:link action="listCharges" controller="serviceCharge" id="${clientInstance.id}">Service Charge</g:link></li>
		</ul>
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


	<div class="row">
		<div class="col-xs-12">
			<div class="row">
				<div class="col-sm-4 col-lg-2">
					<div class="small-box" style="background: #95a5a6;">
						<div class="small-box-inner">
							<h3>1</h3>
							<p>Reminder 1</p>
						</div>
						<div class="icon">1</div>
						<a href="#" class="small-box-footer">More info <i
							class="fa fa-arrow-circle-right fa-fw"></i></a>
					</div>
				</div>
				<div class="col-sm-4 col-lg-2">
					<div class="small-box bg-saffron">
						<div class="small-box-inner">
							<h3>1</h3>
							<p>Reminder 2</p>
						</div>
						<span class="icon">2</span> <a href="#" class="small-box-footer">More
							info <i class="fa fa-arrow-circle-right fa-fw"></i>
						</a>
					</div>
				</div>
				<div class="col-sm-4 col-lg-2">
					<div class="small-box bg-danger">
						<div class="small-box-inner">
							<h3>1</h3>
							<p>Reminder 3</p>
							<span class="icon">3</span>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fa fa-arrow-circle-right fa-fw"></i></a>
					</div>
				</div>
				<div class="col-sm-4 col-lg-2">
					<div class="small-box bg-primary">
						<div class="small-box-inner">
							<h3>1</h3>
							<p>Solicitor</p>
							<span class="icon"><i class="fa fa-fw fa-gavel"></i></span>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fa fa-arrow-circle-right fa-fw"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" style="height: 500px;">
		<div class="col-lg-8">
			<div class="panel panel-default" style="height: 100%;">
				<div class="panel-heading">
					<span class="panel-title">Properties
						<div class="btn-group">

							<button type="button" class="btn btn-xs dropdown-toggle"
								data-toggle="dropdown">
								<span class="caret">
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#"><i class="fa fa-fw fa-send-o"></i> Send
										Reminder</a></li>
								<li><a href="#"><i class="fa fa-fw fa-exclamation"></i>
										Add Exclusion</a></li>
								<li><a href="#"><i class="fa fa-fw fa-pencil-square-o"></i>
										Add Note</a></li>
								<li class="divider"></li>
								<li><a href="#" id="exportExcel"><i
										class="fa fa-fw fa-file-excel-o text-success"></i> Export to
										Excel</a></li>
								<li><a href="#" id="exportPDF"><i
										class="fa fa-fw fa-file-pdf-o text-danger"></i> Export to PDF</a></li>
							</ul>
						</div>
					</span>

				</div>
				<div class="panel-body"
					style="display: block; height: 452px; overflow-y: auto;">
					<table
						class="table table-striped table-condensed table-hover table-bordered"
						id="properties">
						<thead>
							<tr>
								<th class="text-center" style="width: 50px;"><input
									type="checkbox" id="selectAll"></th>
								<th class="text-center col-xs-4 col-lg-2">Property Ref</th>
								<th class="text-center col-xs-4 col-lg-1">Due</th>
								<th class="text-center col-xs-4 col-lg-1">Received</th>
								<th class="text-center col-xs-4 col-lg-1">Owed</th>
								<th class="text-center col-xs-4 col-lg-2">Arrears Stage</th>
								<th class="text-center col-xs-4 col-lg-2">Last Reminder</th>
								<th class="text-center col-xs-4 col-lg-2">Next Reminder</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<g:each in="${arrears}" var="unit">
								<tr id="${unit.id }">
									<td><input type="checkbox"></td>
									<td class="propRef">${unit.propertyId }</td>
									<td><g:formatNumber type="currency" number="${unit?.due }"
											currencyCode="GBP" currencySymbol="£" /></td>
									<td><g:formatNumber type="currency"
											number="${unit?.received}" currencyCode="GBP"
											currencySymbol="£" /></td>
									<g:if test="${unit?.owed > 0}">
										<td class="danger text-danger text-center" style="font-weight: bold;"><g:formatNumber
												type="currency" number="${unit?.owed}" currencyCode="GBP"
												currencySymbol="£" /></td>
									</g:if>
									<g:else test="${unit?.owed =< 0}">
										<td class="success text-success text-center" style="font-weight: bold;"><g:formatNumber
												type="currency" number="${unit?.owed}" currencyCode="GBP"
												currencySymbol="£" /></td>
									</g:else>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-lg-4" style="height: 75%;">
			<div class="panel panel-default" style="height: 100%;">
				<div class="panel-heading">
					<h2 class="panel-title">
						Details
						</h3>
				</div>
				<div class="panel-body" id="financeDetails">
					<span class="text-muted">Select a property to view more
						details.</span>
				</div>
			</div>
		</div>
	</div>
<form action="${request.contextPath}/importExport/exportJsonToExcel" method="POST" id="exportForm" class="hidden">
	<input name="data" id="exportData" type="hidden"/>
	<input name="headers" id="exportHeaders" type="hidden"/>
	<input name="sheetName" id="sheetName" type="hidden"/>
	<input name="fileName" id="filename" type="hidden"/>
</form>
<form action="${request.contextPath}/importExport/exportJsonToPDF" method="POST" id="exportFormPDF" class="hidden">
	<input name="data" id="exportDataPDF" type="hidden"/>
	<input name="headers" id="exportHeadersPDF" type="hidden"/>
	<input name="fileName" id="filenamePDF" type="hidden"/>
</form>
	<r:script>
$(document).ready(function() {
    $("#selectAll").click(function() {
        var checkBoxes = $("#properties tbody input[type='checkbox']");
		var selectAllState = $("#selectAll").prop("checked");
        checkBoxes.prop("checked", selectAllState);
    });
    
    $("td.propRef").click(function(event){
    	$.get(
    		'${request.contextPath }/property/financeDetails/' + $(this).parent().attr('id'),
    		function(data, status, e){
    			$('#financeDetails').html(data)
    			
    		},
    		'html'
    	);
    });    
});
$(document).on('click','#printSvc', function(){
    	$('.modal-body').printArea({mode: 'iframe'});
    });

$("#exportExcel").on('click',function(){
	var tableHeaders = getTableHeaders("properties");
	var tableData = getTableData("properties", tableHeaders);
	$("#exportData").val(JSON.stringify(tableData));
	$("#exportHeaders").val(JSON.stringify(tableHeaders));
	$("#sheetName").val("${clientInstance.name} Arrears");
	$("#exportForm").submit();
});
$("#exportPDF").on('click',function(){
	var tableHeaders = getTableHeaders("properties");
	var tableData = getTableData("properties", tableHeaders);
	$("#exportDataPDF").val(JSON.stringify(tableData));
	$("#exportHeadersPDF").val(JSON.stringify(tableHeaders));
	$("#filenamePDF").val("${clientInstance.name} Arrears");
	$("#exportFormPDF").submit();
});
    
</r:script>

</body>
</html>
