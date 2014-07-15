modules = {
    application {
		dependsOn: 'jquery'
		resource url:'http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css', attrs:[media:'all']
		resource url:'http://maxcdn.bootstrapcdn.com/bootswatch/3.1.1/flatly/bootstrap.min.css', attrs:[media:'all']
		resource url:'http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js'
		resource url:'http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css'
		resource url:'js/application.js'
		resource url:'css/custom.css'
    }
	jquery {
		resource url:'https://code.jquery.com/jquery-1.11.0.min.js'
	}
	flot {
		dependsOn: 'application'
		resource url:'http://cdnjs.cloudflare.com/ajax/libs/flot/0.8.2/jquery.flot.min.js'
	}
	tablesorter {
		dependsOn: 'jquery'
		resource url:'http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.17.4/js/jquery.tablesorter.min.js'
		resource url:'http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.17.4/js/jquery.tablesorter.widgets.min.js'
		resource url:'http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.17.4/css/theme.bootstrap.css'
	}
}