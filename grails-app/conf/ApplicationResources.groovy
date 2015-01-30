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
	PNotify {
		resource url:'js/pnotify.custom.min.js'
		resource url:'css/pnotify.custom.min.css'
	}
	datepicker {
		resource url:'http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js'
		resource url:'http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/v4.0.0/src/js/bootstrap-datetimepicker.js'
		resource url:'http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/v4.0.0/build/css/bootstrap-datetimepicker.css'
	}
	multiSelect {
		resource url:'js/jquery.multi-select.js'
		resource url:'css/multi-select.css'
		resource url:'images/switch.png'
	}
}