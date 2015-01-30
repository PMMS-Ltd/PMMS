<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"></link>
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}"></link>
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}"></link>
		<g:layoutHead/>
		<g:javascript library="application"/>
		
		<r:require modules="flot, jquery, PNotify"/>
		<r:layoutResources />		
	</head>
	<body>
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">

        <div class="navbar-header" style="margin-left:15px;">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-left" style="margin-left:15px;">
          	<li><img src="${resource (dir: 'images', file: 'PMMS Icon.png') }" style="width: 180px; padding: 5px;"/></li>
            <li><a href="${request.contextPath}">Dashboard</a></li>
            <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Management<b class="caret"></b></a>
	          <ul class="dropdown-menu">
	            <li><g:link controller="Client" action="index"><span class="fa fa-users fa-lg fa-fw pull-left"></span>&nbsp; Clients</g:link></li>
            	<li><g:link controller="Property" action="index"><span class="fa fa-building-o fa-lg fa-fw pull-left"></span>&nbsp; Properties</g:link></li>
            	<li><g:link controller="Transfer" action="index"><span class="fa fa-exchange fa-lg fa-fw pull-left"></span>&nbsp; Transfers</g:link></li>
	            <li class="divider"></li>
	            <li><g:link controller="Person" action="index"><span class="fa fa-book fa-fw fa-lg pull-left"></span>&nbsp; Contacts</g:link></li>
	            <li><g:link controller="Supplier" action="index"><span class="fa fa-truck fa-fw fa-lg pull-left"></span>&nbsp; Suppliers</g:link></li>
	          </ul>
	        </li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Accounts<b class="caret"></b></a>
	          <ul class="dropdown-menu">
	            <li><g:link controller="Invoice" action="index"><span class="fa fa-file-o fa-fw fa-lg"></span>&nbsp; Invoices</g:link></li>
	            <li class="disabled"><a href="#"><span class="fa fa-money fa-fw fa-lg"></span>&nbsp; Arrears</a></li>
	            <li><g:link controller="ServiceCharge" action="index"><span class="fa fa-gbp fa-fw fa-lg"></span>&nbsp; Service Charges</g:link></li>
	            <li class="disabled"><a href="#"><span class="fa fa-university fa-fw fa-lg"></span>&nbsp; Bank Statements</a></li>
	            <li class="disabled"><a href="#"><span class="fa fa-briefcase fa-fw fa-lg"></span>&nbsp; Budgets</a></li>
	            <sec:ifAnyGranted roles="ROLE_ADMIN">
					<li class="divider"/>
					<li><g:link controller="Transaction" action="index"><span class="fa fa-cubes fa-lg fa-fw pull-left"></span>&nbsp; Transactions</g:link></li>
				</sec:ifAnyGranted>
	          </ul>
	        </li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Maintenance<b class="caret"></b></a>
	          <ul class="dropdown-menu">
	          	<li><g:link controller="Job" action="create"><span class="fa fa-plus fa-fw fa-lg text-success"></span><span class="fa fa-wrench fa-fw fa-lg text-success"></span> New Job</g:link></li>
	          	<li><g:link controller="Job" action="create"><span class="fa fa-plus fa-fw fa-lg text-success"></span><span class="fa fa-flash fa-fw fa-lg text-success"></span> New Issue</g:link></li>
	          	<li class="divider"></li>
	            <li><!-- <a href="#"><span class="fa-stack fa-lg">
					  <i class="fa fa-wrench fa-flip-horizontal fa-stack-1x"></i>
					  <i class="fa fa-check fa-stack-1x text-success"></i>
					</span> Open Jobs</a>--><g:link controller="job" action="index"><i class="fa fa-fw fa-lg fa-wrench"></i> Jobs</g:link></li>
	            <li><!-- <a href="#"><span class="fa-stack fa-lg fa-fw pull-left">
					  <i class="fa fa-wrench fa-flip-horizontal fa-stack-1x"></i>
					  <i class="fa fa-ban fa-stack-1x text-danger"></i>
					</span> Closed Jobs</a>--><a href="#"><i class="fa fa-fw fa-lg fa-flash"></i> Issues</a></li>
	            <li><g:link controller="contract"><span class="fa fa-puzzle-piece fa-fw fa-lg pull-left"></span> Contracts</g:link></li>
	             <li><g:link controller="siteVisit"><span class="fa fa-location-arrow fa-fw fa-lg pull-left"></span> Site Visits</g:link></li>
	          </ul>
	        </li>
          </ul>
		
		  <ul class="nav navbar-nav navbar-right" style="margin-right: 20px;">
		    <sec:ifNotLoggedIn>
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <strong class="caret"></strong></a>
			  <div class="dropdown-menu" style="padding: 15px; width: 275px;">
				<g:form class="form" role="form" url="PMMS/j_spring_security_check" method="POST">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						<input type="text" placeholder="Username" class="form-control" name='j_username' id='username'>
					</div>
					</div>
					<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<input type="password" placeholder="Password" class="form-control" name='j_password' id='password'>
					</div>
					</div>
					<button type="submit" class="btn btn-success btn-sm"><span class="fa fa-sign-in"></span>  Sign in</button>
					<g:link class="btn btn-primary btn-sm"><span class="fa fa-question"></span>  Reset Password</g:link>
				</g:form>
			  </div>
		  </sec:ifNotLoggedIn>
		  <sec:ifLoggedIn>
			
			<li>
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user fa-lg fa-fw"></i>
				<sec:loggedInUserInfo field="displayName"/> <span class="caret"></span>
			  </a>
			  <ul class="dropdown-menu" role="menu">
				<li class="text-center">
				<g:form controller="logout" action="index">
					<button type="submit" class="btn btn-danger btn-sm"><span class="fa fa-sign-out fa-fw fa-lg"></span> Logout</button>
				</g:form>
				</li>
			  </ul>
			  </li>
		  </sec:ifLoggedIn>
		   </ul>
        </div><!--/.nav-collapse -->
     
    </div>
	<div class="container">
		
			<g:layoutBody/>
		
	</div>	
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript>
			// Fix input element click problem
		$('.dropdown input, .dropdown label').click(function(e) {
			e.stopPropagation();
		});
		</g:javascript>
		
		<r:layoutResources />
	</body>
</html>
