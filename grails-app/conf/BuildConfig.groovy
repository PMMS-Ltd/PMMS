grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = [
    // configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
    //  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],

    // configure settings for the test-app JVM, uses the daemon by default
    test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
    // configure settings for the run-app JVM
    run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
    // configure settings for the run-war JVM
    war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
    // configure settings for the Console UI JVM
    console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

		mavenRepo ("http://192.168.0.74/artifactory/repo/") {
			auth([
					username: 'user',
					password: 'bitnami'
				])
		}
				
		//grailsPlugins()
        //grailsHome()
        //mavenLocal()
        //grailsCentral()
        //mavenCentral()
        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
       //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
		
		//mavenRepo "http://repo.grails.org/grails/libs-releases/"
		//mavenRepo "http://m2repo.spockframework.org/ext/"
		//mavenRepo "http://repo.spring.io/milestone/"
		//mavenRepo "http://repo.grails.org/grails/core"
		//mavenRepo "http://maven.alfresco.com/nexus/content/groups/public/"
		
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
         runtime 'mysql:mysql-connector-java:5.1.27'
		 runtime 'org.springframework:spring-test:3.1.0.RELEASE'
		 //runtime 'com.lowagie:itext:2.1.7'
        // runtime 'org.postgresql:postgresql:9.3-1100-jdbc41'
		 
		 compile 'org.apache.chemistry.opencmis:chemistry-opencmis-commons-api:0.10.0', {
			 excludes 'log4j', 'slf4j-api', 'slf4j-log4j12'
		 }
		 compile 'org.apache.chemistry.opencmis:chemistry-opencmis-commons-impl:0.10.0', {
			 excludes 'log4j', 'slf4j-api', 'slf4j-log4j12'
		 }
		 compile 'org.apache.chemistry.opencmis:chemistry-opencmis-client-api:0.10.0', {
			 excludes 'log4j', 'slf4j-api', 'slf4j-log4j12'
		 }
		 compile 'org.apache.chemistry.opencmis:chemistry-opencmis-client-impl:0.10.0', {
			 excludes 'log4j', 'slf4j-api', 'slf4j-log4j12'
		 }
		 compile 'org.apache.chemistry.opencmis:chemistry-opencmis-client-bindings:0.10.0', {
			 excludes 'log4j', 'slf4j-api', 'slf4j-log4j12'
		 }
		 compile 'org.apache.chemistry.opencmis:chemistry-opencmis-server-support:0.10.0', {
			 excludes 'servlet-api', 'slf4j-api', 'slf4j-log4j12'
		 }
		 // Alfresco CMIS extension
		 compile 'org.alfresco.cmis.client:alfresco-opencmis-extension:0.7'
		 //compile 'org.xhtmlrenderer:flying-saucer-pdf:9.0.6'
		 compile 'org.xhtmlrenderer:core-renderer:R8pre2'
		 compile 'com.lowagie:itext:2.0.8'
		 compile ('org.docx4j:docx4j:3.1.0') {excludes "slf4j-api", "xml-apis", "commons-logging", 'slf4j-log4j12'}
		// compile ":events-calendar:1.0RC1"
    }

    plugins {
        // plugins for the build system only
        build ":tomcat:7.0.52.1"

        // plugins for the compile step
        compile ":scaffolding:2.0.3"
        compile ':cache:1.1.2'
		compile (":rendering:1.0.0") {
			excludes "flying-saucer-pdf", "itext", "core-renderer-R8"
		}
		compile ":spring-security-core:2.0-RC2"
		compile ":rest-client-builder:2.0.1"
		compile ":joda-time:1.5"
		compile ":audit-logging:1.0.1"
		compile ":excel-import:1.0.0"
		compile ":excel-export:0.2.1"
		compile ":rest-client-builder:2.0.3"
		compile ":spring-security-ldap:2.0-RC2"
		compile ":directory-service:0.10.1"
		compile ":mail:1.0.7"
		compile ":task-manager:0.1"
		compile ":calendar-manager:0.5"
		
        // plugins needed at runtime but not for compilation
        runtime ":hibernate:3.6.10.13" // or ":hibernate4:4.3.5.1"
        runtime ":database-migration:1.4.0"
        runtime ":jquery:1.11.0.2"
        runtime ":resources:1.2.7"
		runtime ":cors:1.1.4"
		
		
        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0.1"
        //runtime ":cached-resources:1.1"
        //runtime ":yui-minify-resources:0.1.5"

        // An alternative to the default resources plugin is the asset-pipeline plugin
        //compile ":asset-pipeline:1.6.1"

        // Uncomment these to enable additional asset-pipeline capabilities
        //compile ":sass-asset-pipeline:1.5.5"
        //compile ":less-asset-pipeline:1.5.3"
        //compile ":coffee-asset-pipeline:1.5.0"
        //compile ":handlebars-asset-pipeline:1.3.0.1"
    }
}
