
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



		<h1 class="page-header"><g:fieldValue bean="${clientInstance}" field="name" />
		<small>Finances</small>
		<div class="btn-group">
			<a href="#" class="btn btn-xs btn-default dropdown-toggle"
				data-toggle="dropdown"> <span class="caret"></span> <span
				class="sr-only">Toggle Dropdown</span>
			</a>
	
			<ul class="dropdown-menu" role="menu">
				<li><g:link action="show" resource="${clientInstance}">Overview</g:link></li>
			</ul>
		</div> <!-- ./btn-group -->
		</h1>
	
<g:if test="${flash.message}">
	<div class="alert alert-warning col-xs-4 pull-right alert-dismissable"
		role="status">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		${flash.message}
	</div>
</g:if>

 
  <div class="row" style="height: 400px;">
  <div class="col-xs-12">
	<div class="row">
	<div class="col-sm-4 col-lg-2">
		<div class="small-box" style="background: #95a5a6;">
			<div class="small-box-inner">
				<h3>1</h3>
				<p>Reminder 1</p>
			</div>
			<div class="icon">
				1
			</div>
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
			<span class="icon">2</span>
			<a href="#" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right fa-fw"></i></a>
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
  <div class="col-lg-8">
  <div class="panel panel-default" style="height: 100%;">
  <div class="panel-heading">
  <span class="panel-title">Properties
  <div class="btn-group">
  
  <button type="button" class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
   <span class="caret">
  </button>
  <ul class="dropdown-menu" role="menu">
    <li><a href="#"><i class="fa fa-fw fa-send-o"></i> Send Reminder</a></li>
    <li><a href="#"><i class="fa fa-fw fa-exclamation"></i> Add Exclusion</a></li>
    <li><a href="#"><i class="fa fa-fw fa-pencil-square-o"></i> Add Note</a></li>
    <li class="divider"></li>
    <li><a href="#"><i class="fa fa-fw fa-file-excel-o text-success"></i> Export to Excel</a></li>
	 <li><a href="#"><i class="fa fa-fw fa-file-pdf-o text-danger"></i> Export to PDF</a></li>
  </ul>
</div></span>

</div>
  <div class="panel-body" style="display:block; height: 352px; overflow-y:auto;">
  <table class="table table-striped table-condensed table-hover table-bordered" id="properties">
    <thead>
      <tr>
	  <th class="text-center" style="width:50px;"><input type="checkbox" id="selectAll"></th>
      <th class="text-center col-xs-4 col-lg-2">Property</th>
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
        <td>${unit.propertyId }</td>
        <td><g:formatNumber type="currency" number="${unit?.due }" currencyCode="GBP" currencySymbol="£"/></td>
        <td><g:formatNumber type="currency" number="${unit?.received}" currencyCode="GBP" currencySymbol="£"/></td>
        <g:if test="${unit?.owed > 0}">
        	<th class="danger text-danger text-center"><g:formatNumber type="currency" number="${unit?.owed}" currencyCode="GBP" currencySymbol="£"/></th>
        </g:if>
        <g:else test="${unit?.owed =< 0}">
        	<th class="success text-success text-center"><g:formatNumber type="currency" number="${unit?.owed}" currencyCode="GBP" currencySymbol="£"/></th>
        </g:else>
        <td>Reminder 1</td>
        <td>01/07/2014</td>
		<td>14/07/2014</td>
      </tr>
      </g:each>
    </tbody>
  </table>
  </div>
  </div>
  </div>

	<div class="col-lg-4" style="height: 100%;">
      <div class="panel panel-default" style="height: 100%;">
	  <div class="panel-heading">
		<h2 class="panel-title">Details</h3>
	  </div>
        <div class="panel-body" id="financeDetails">
		  <span class="text-muted">Select a property to view more details.</span>
        </div>
      </div>
    </div>
  </div>

<r:script>
	$(document).ready(function() {
    $("#selectAll").click(function() {
        var checkBoxes = $("#properties tbody input[type='checkbox']");
		var selectAllState = $("#selectAll").prop("checked");
        checkBoxes.prop("checked", selectAllState);
    });
    
    $("tbody tr").click(function(event){
    	$.get(
    		'${request.contextPath }/property/financeDetails/' + $(this).attr('id'),
    		function(data, status, e){
    			$('#financeDetails').html(data)
    			//alert(data);
    		},
    		'html'
    	);
    });
    
});
</r:script>

</body>
</html>
