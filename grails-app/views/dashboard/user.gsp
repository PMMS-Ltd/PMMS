<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<title>Dashboard</title>
<r:require modules="flot"/>
</head>
<body>
	<h1 class="page-header hidden-xs">${user.getDisplayName() }'s Dashboard</h1>
	<hr class="hidden-xs"/>
	
	<div class="row" style="height: 309px;">
		<div class="col-xs-4 hidden-xs">
		<div class="panel panel-default">
			<div class="panel-heading"><h3 class="panel-title text-center">Statistics</h3></div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-4">
						<g:render template="smallBox" model="[boxclass: 'bg-fountain-blue',value: 34, name: 'New Jobs', icon: 'fa-bolt']"/>
					</div>
					<div class="col-xs-4">
						<g:render template="smallBox" model="[boxclass: 'bg-danger',value: 55, name: 'Expired Jobs', icon: 'fa-exclamation']"/>
					</div>
					<div class="col-xs-4">
						<g:render template="smallBox" model="[boxclass: 'bg-saffron',value: 18, name: 'Notifications', icon: 'fa-bullhorn']"/>
					</div>
					</div>
					<div class="row">
					<div class="col-xs-4">
						<g:render template="smallBox" model="[boxclass: 'bg-success',value: 5, name: 'Approvals', icon: 'fa-check']"/>
					</div>
					<div class="col-xs-4">
						<g:render template="smallBox" model="[boxclass: 'bg-primary',value: visits, name: 'Site Visits', icon: 'fa-location-arrow', controller: 'siteVisit', action: 'index']"/>
					</div>
					<div class="col-xs-4">
						<g:render template="smallBox" model="[boxclass: 'bg-info',value: 1, name: 'Requests', icon: 'fa-question']"/>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row visible-xs" style="margin-top: 30px;'">
		<ul class="list-group">
		  <li class="list-group-item list-group-item-info"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-bolt fa-lg"></i> New Jobs <span class="badge pull-right">34</span></a></li>
		  <li class="list-group-item list-group-item-danger"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-exclamation fa-lg"></i> Expired Jobs <span class="badge pull-right">55</span></a></li>
		  <li class="list-group-item list-group-item-warning"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-bullhorn fa-lg"></i> Notifications <span class="badge pull-right">12</span></a></li>
		  <li class="list-group-item list-group-item-success"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-gavel fa-lg"></i> Approvals <span class="badge pull-right">5</span></a></li>
		</ul>

	</div>
		<div class="col-xs-4" style="height:100%;">
			<div class="panel panel-default" style="height:100%;">
				<div class="panel-heading"><h3 class="panel-title text-center">Todays Tasks</h3></div>
				<div class="panel-body">
					<g:render plugin="task-manager" template="/task/taskTable" model="[tasks: tasks]"/>
				</div>
			</div>
		</div>
		<div class="col-xs-4" style="height:100%;">
			<div class="panel panel-default" style="height:100%;">
				<div class="panel-heading"><h3 class="panel-title text-center">This Weeks Tasks</h3></div>
				<div class="panel-body">
					<g:render plugin="task-manager" template="/task/taskTable" model="[tasks: weekTasks]"/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4" >
			<h3 class="text-center">Chart 1</h3>
			<div id="chart-1" style="height:300px;"></div>
		</div>
		<div class="col-sm-4" >
			<h3 class="text-center">Chart 2</h3>
			<div id="chart-2" style="height:300px;"></div>
		</div>
		<div class="col-sm-4" >
			<h3 class="text-center">Chart 3</h3>
			<div id="chart-3" style="height:300px;"></div>
		</div>
	</div>
	
	</body>
	<!-- FLOT CHARTS -->
        <g:javascript>
        	

	$(function() {

		var d1 = [];
		for (var i = 0; i < 14; i += 0.5) {
			d1.push([i, Math.sin(i)]);
		}

		var d2 = [[0, 3], [4, 8], [8, 5], [9, 13]];

		// A null signifies separate line segments

		var d3 = [[0, 12], [7, 12], null, [7, 2.5], [12, 2.5]];

		$.plot("#chart-1",[d1]);
		$.plot("#chart-2",[d2]);
		$.plot("#chart-3",[d3]);
		
	});
        </g:javascript>
</html>