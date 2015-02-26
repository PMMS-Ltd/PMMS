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

  <body style="background-color: #efefef;">

    <div class="container">
    <div class="row">
    <div class="col-xs-4 col-xs-offset-4">
    <img src="${resource (dir: 'images', file: 'PMMSlogo.png') }" style="width: 100%; padding: 5px; margin-bottom: 25px;"/>
    </div>
 	</div>
 	<div class="row">
    <div class="col-xs-3 center-block bg-danger" style="padding: 40px; float:none; border-radius: 6px;">
   		
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
					<div class="text-center">
					<button type="submit" class="btn btn-success btn-sm"><span class="fa fa-sign-in"></span>  Sign in</button>
					<g:link class="btn btn-default btn-sm"><span class="fa fa-question"></span>  Reset Password</g:link>
					</div>
				</g:form>
				
		</div>
		</div> <!--  row  -->
    </div> <!-- /container -->

	<r:layoutResources/>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>