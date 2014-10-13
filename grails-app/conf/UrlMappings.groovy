class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"					(controller:'/dashboard')
        "500"				(view:'/error')
		"/login/$action?"	(controller: "login")
		"/logout/$action?"	(controller: "logout")
		
		//"/api/transfer/$id" (controller: "transfer", action:"show", parseRequest: true)
		//"/api/supplier/$id" (controller: "supplier", action: "show", parseRequest: true)
		
		"/api/transfer" (resources: "transfer") {
			"/vSolicitor" (resources: "supplier")
		}
		"/api/supplier" (resources: "supplier") {
			"/address" (resources: "address")
		}
		
	}
}
