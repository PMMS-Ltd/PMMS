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
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<g:layoutHead/>
		<g:javascript library="application"/>		
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
          <a class="navbar-brand" href="#">PMMS</a>
        </div>
        <div class="collapse navbar-collapse" style="margin-right:15px;">
          <ul class="nav navbar-nav">
            <li><a href="/PMMS">Dashboard</a></li>
            <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Management<b class="caret"></b></a>
	          <ul class="dropdown-menu">
	            <li><g:link controller="Client" action="index"><span class="fa fa-users fa-lg"></span>&nbsp; Clients</g:link></li>
            	<li><g:link controller="Property" action="index"><span class="fa fa-building-o fa-lg"></span>&nbsp; All Properties</g:link></li>
            	<li><g:link controller="Transfer" action="index"><span class="fa fa-exchange fa-lg"></span>&nbsp; Transfers</g:link></li>
	            <li class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	          </ul>
	        </li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Accounts<b class="caret"></b></a>
	          <ul class="dropdown-menu">
	            <li><a href="#"><span class="fa fa-file-o fa-fw fa-lg"></span>&nbsp; Invoices</a></li>
	            <li><a href="#"><span class="fa fa-money fa-fw fa-lg"></span>&nbsp; Arrears</a></li>
	            <li><a href="#"><span class="fa fa-gbp fa-fw fa-lg"></span>&nbsp; Service Charges</a></li>
	            <li><a href="#"><span class="fa fa-university fa-fw fa-lg"></span>&nbsp; Bank Statements</a></li>
	            <li><a href="#"><span class="fa fa-briefcase fa-fw fa-lg"></span>&nbsp; Budgets</a></li>
	          </ul>
	        </li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Maintenance<b class="caret"></b></a>
	          <ul class="dropdown-menu">
	          	<li><a href="#"><span class="fa fa-plus fa-fw fa-lg"></span>&nbsp; New Job</a></li>
	          	<li class="divider"></li>
	            <li><a href="#"><span class="fa-stack fa-lg">
					  <i class="fa fa-wrench fa-flip-horizontal fa-stack-1x"></i>
					  <i class="fa fa-check fa-stack-1x text-success"></i>
					</span> Open Jobs</a></li>
	            <li><a href="#"><span class="fa-stack fa-lg">
					  <i class="fa fa-wrench fa-flip-horizontal fa-stack-1x"></i>
					  <i class="fa fa-ban fa-stack-1x text-danger"></i>
					</span> Closed Jobs</a></li>
	            <li><a href="#"><span class="fa fa-puzzle-piece fa-fw fa-lg"></span>&nbsp; Contracts</a></li>
	          </ul>
	        </li>
          </ul>
		  <sec:ifNotLoggedIn>
		  <g:form class="navbar-form navbar-right" role="form" url="PMMS/j_spring_security_check" method="POST">
            <div class="form-group">
              <input type="text" placeholder="Username" class="form-control" name='j_username' id='username'>
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" name='j_password' id='password'>
            </div>
            <button type="submit" class="btn btn-success btn-sm"><span class="fa fa-sign-in"></span>  Sign in</button>
          </g:form>
		  </sec:ifNotLoggedIn>
		  <sec:ifLoggedIn>
		  <g:form class="navbar-form navbar-right" role="form" url="[controller:'logout', action:'index']" method="POST" >
		  		Signed in as: <sec:loggedInUserInfo field="username"/>
              <button type="submit" class="btn btn-danger btn-sm"><span class="fa fa-sign-out"></span> Logout</button>
		  </g:form>
		  </sec:ifLoggedIn>
        </div><!--/.nav-collapse -->
     
    </div>
	<div style="padding-bottom: 10px; margin: 60px 25px 10px 25px;">
		
			<g:layoutBody/>
		
	</div>	
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<r:layoutResources />
	</body>
</html>
