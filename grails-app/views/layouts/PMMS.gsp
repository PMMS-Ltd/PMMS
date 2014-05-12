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
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">

        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">PMMS</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/PMMS">Home</a></li>
            <li><g:link controller="Client" action="index">Clients</g:link></li>
            <li><g:link controller="Property" action="index">Properties</g:link></li>
          </ul>
		  <sec:ifNotLoggedIn>
		  <g:form class="navbar-form navbar-right" role="form" url="PMMS/j_spring_security_check" method="POST">
            <div class="form-group">
              <input type="text" placeholder="Username" class="form-control" name='j_username' id='username'>
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" name='j_password' id='password'>
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </g:form>
		  </sec:ifNotLoggedIn>
		  <sec:ifLoggedIn>
		  <g:form class="navbar-form navbar-right" role="form" url="[controller:'logout', action:'index']" method="POST" >
              <button type="submit" class="btn btn-danger">Logout</button>
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
