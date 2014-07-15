<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<title>Dashboard</title>
<r:require modules="flot"/>
</head>
<body>
	<h1 class="page-header hidden-xs">${user.firstName } ${user.lastName }'s Dashboard</h1>
	<div class="row hidden-xs">
		<div class="col-sm-3 col-lg-2">
			<div class="small-box bg-fountain-blue">
				<div class="small-box-inner">
					<h3>34</h3>
					<p>New Jobs</p>
				</div>
				<div class="icon">
					<i class="fa fa-bolt"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-3 col-lg-2">
			<div class="small-box bg-danger">
				<div class="small-box-inner">
					<h3>55</h3>
					<p>Expired jobs</p>
				</div>
				<div class="icon">
					<i class="fa fa-exclamation"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-3 col-lg-2">
			<div class="small-box bg-saffron">
				<div class="small-box-inner">
					<h3>18</h3>
					<p>Notifications</p>
				</div>
				<div class="icon">
					<i class="fa fa-bullhorn"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-3 col-lg-2">
			<div class="small-box bg-shamrock">
				<div class="small-box-inner">
					<h3>5</h3>
					<p>Approvals</p>
				</div>
				<div class="icon">
					<i class="fa fa-gavel"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-3 col-lg-2">
			<div class="small-box bg-primary">
				<div class="small-box-inner">
					<h3>9</h3>
					<p>Upcoming Events</p>
				</div>
				<div class="icon">
					<i class="fa fa-calendar"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
		<div class="col-sm-3 col-lg-2">
			<div class="small-box" style="background:#95a5a6;">
				<div class="small-box-inner">
					<h3>1</h3>
					<p>Requests</p>
				</div>
				<div class="icon">
					<i class="fa fa-question"></i>
				</div>
				<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right fa-fw"></i></a>
			</div>
		</div>
	</div>
	<div class="row visible-xs">
		<ul class="list-group">
		  <li class="list-group-item list-group-item-info"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-bolt fa-lg"></i> New Jobs <span class="badge pull-right">34</span></a></li>
		  <li class="list-group-item list-group-item-danger"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-exclamation fa-lg"></i> Expired Jobs <span class="badge pull-right">55</span></a></li>
		  <li class="list-group-item list-group-item-warning"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-bullhorn fa-lg"></i> Notifications <span class="badge pull-right">12</span></a></li>
		  <li class="list-group-item list-group-item-success"><a href="#" style="color:#fff;"><i class="fa fa-fw fa-gavel fa-lg"></i> Approvals <span class="badge pull-right">5</span></a></li>
		</ul>
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
        <script src="" type="text/javascript"></script>
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