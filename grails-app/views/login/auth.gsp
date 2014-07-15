<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap core CSS -->
   <g:javascript library="application"/>
   <r:layoutResources/>
  </head>

  <body>

    <div class="container">
    <div class="col-xs-4 col-xs-offset-4">
    <h2 class="page-header"><g:message code="springSecurity.login.header"/></h2>
      <g:form class="form" role="form" url="${postUrl}" method="POST">
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
    </div> <!-- /container -->

	<r:layoutResources/>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>