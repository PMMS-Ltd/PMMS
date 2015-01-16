<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
		<div class="row">
		<div class="col-md-2">
			<div style="margin-left:10px;">
			<h3>Application Status</h3>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h3>Installed Plugins</h3>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
			</div>
		</div>
		<div class="col-md-10">
			<div class="jumbotron">
				<h1>Welcome to Grails</h1>
				<p>Congratulations, you have successfully started your first Grails application! At the moment
				   this is the default page, feel free to modify it to either redirect to a controller or display whatever
				   content you may choose. Below is a list of controllers that are currently deployed in this application,
				   click on each to execute its default action:</p>
			</div>
			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
		</div>
	</body>
</html>
