
// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = 'uk.org.pmms' // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']
grails.resources.adhoc.includes = ['/images/**', '/css/**', '/js/**', '/plugins/**']

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
		grails.alfresco.repo.clientfolder = '95c63d57-e1e2-47f9-8ef3-37a248059bf0'
		grails.alfresco.repo.transferfolder = '0279bee2-e5cd-43d9-b4aa-49c65ae77905'
		
		grails.serverURL ="http://localhost:8080/PMMS"
		
		//grails.alfresco.repo.clientfolder='e4668f45-203a-4d23-969b-246d38bfd062'
		//grails.alfresco.repo.transferfolder='e4668f45-203a-4d23-969b-246d38bfd062'
    }
    production {
        grails.logging.jul.usebridge = false
		grails.alfresco.repo.clientfolder = '95c63d57-e1e2-47f9-8ef3-37a248059bf0'
		grails.alfresco.repo.transferfolder = '0279bee2-e5cd-43d9-b4aa-49c65ae77905'
		
		grails.serverURL ="http://192.168.0.49/PMMS"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

auditLog {
	verbose = false // verbosely log all changed values to db
	logIds = false  // log db-ids of associated objects.
	// Note: if you change next 2 properties, you must update your database schema!
	//tablename = 'my_audit' // table name for audit logs.
	largeValueColumnTypes = true // use large column db types for oldValue/newValue.
	TRUNCATE_LENGTH = 1000
	cacheDisabled = true
	replacementPatterns = ["org.uk.pmms.":"", "org.uk.pmms.accounts.":""] // replace with empty string.
	actorClosure = { request, session ->
	   request.applicationContext.springSecurityService.principal?.username
	}
   }


// Added by the Spring Security Core plugin:
//grails.plugin.springsecurity.useBasicAuth = false
//grails.plugin.springsecurity.basic.realmName = "Ralph's Bait and Tackle"
grails.plugin.springsecurity.userLookup.userDomainClassName = 'uk.org.pmms.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'uk.org.pmms.UserRole'
grails.plugin.springsecurity.authority.className = 'uk.org.pmms.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                              ['permitAll'],
	'/index':                         ['permitAll'],
	'/dbdoc':						  ['permitAll'],
	'/dbconsole':					  ['permitAll'],
	'/searchable/**':                 ['permitAll'],
	'/index.gsp':                     ['permitAll'],
	'/**/js/**':                      ['permitAll'],
	'/**/css/**':                     ['permitAll'],
	'/**/images/**':                  ['permitAll'],
	'/**/favicon.ico':                ['permitAll'],
	'/transfer/**':					  ['permitAll'],
	'/transaction/**':				  ['permitAll'],
	'/auditLogEvent/**':			  ['permitAll'],
	'/bankAccount/**':				  ['permitAll'],
	'/importExport/**':				  ['permitAll'],
	'/Pdf/**':				  		  ['permitAll']

]

grails.opencmis.alfresco.scope='-default-'
grails.opencmis.alfresco.apiurl='http://alfresco.pmms.org.uk/alfresco'
//grails.opencmis.alfresco.apiurl='http://192.168.0.15/alfresco'
grails.opencmis.alfresco.cmisurl='cmis/versions/1.1/atom'
grails.opencmis.alfresco.atomurl='http://alfresco.pmms.org.uk/alfresco/api/-default-/public/cmis/versions/1.1/atom'
//grails.opencmis.alfresco.atomurl='http://192.168.0.15/alfresco/api/-default-/public/cmis/versions/1.1/atom'
grails.opencmis.alfresco.user='user'
grails.opencmis.alfresco.password='bitnami'
