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
		
		
		"/api/transfer" (resources: "transfer")
		"/api/supplier" (resources: "supplier") 
		"/api/client" (resources: "client")
		"/api/person" (resources: "person")
		"/api/address" (reources: "address")
		
	}
}
