modules = {
    application {
		dependsOn: 'jquery'
		resource url:'http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css', attrs:[media:'all']
		//resource url:'http://maxcdn.bootstrapcdn.com/bootswatch/3.2.0/sandstone/bootstrap.min.css', attrs:[media:'screen']
		resource url:'http://maxcdn.bootstrapcdn.com/bootswatch/3.2.0/flatly/bootstrap.min.css', attrs:[media:'screen'] 
		resource url:'http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'
		resource url:'http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'
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
	printArea {
		dependsOn: 'jquery'
		resource url: 'js/jquery.PrintArea.js'
	}
	wizard {
		resource url: 'css/wizard.css'
	}
	wysiwyg {
		dependsOn: 'jquery'
		resource url: 'js/jquery.hotkeys.js'
		resource url: 'js/bootstrap-wysiwyg.js'
		
		
	}
}