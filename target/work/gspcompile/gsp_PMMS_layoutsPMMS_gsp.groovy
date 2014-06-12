import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_layoutsPMMS_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/layouts/PMMS.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("Content-Type"),'content':("text/html; charset=UTF-8")],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':(""),'http-equiv':("X-UA-Compatible"),'content':("IE=edge,chrome=1")],-1)
printHtmlPart(1)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('layoutTitle','g',10,['default':("Grails")],-1)
})
invokeTag('captureTitle','sitemesh',10,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',10,[:],2)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',11,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("viewport"),'content':("width=device-width, initial-scale=1.0")],-1)
printHtmlPart(2)
expressionOut.print(resource(dir: 'images', file: 'favicon.ico'))
printHtmlPart(3)
expressionOut.print(resource(dir: 'images', file: 'apple-touch-icon.png'))
printHtmlPart(4)
expressionOut.print(resource(dir: 'images', file: 'apple-touch-icon-retina.png'))
printHtmlPart(5)
invokeTag('layoutHead','g',15,[:],-1)
printHtmlPart(1)
invokeTag('javascript','g',16,['library':("application")],-1)
printHtmlPart(6)
invokeTag('layoutResources','r',17,[:],-1)
printHtmlPart(7)
})
invokeTag('captureHead','sitemesh',18,[:],1)
printHtmlPart(7)
createTagBody(1, {->
printHtmlPart(8)
createClosureForHtmlPart(9, 2)
invokeTag('link','g',37,['controller':("Client"),'action':("index")],2)
printHtmlPart(10)
createClosureForHtmlPart(11, 2)
invokeTag('link','g',38,['controller':("Property"),'action':("index")],2)
printHtmlPart(12)
createTagBody(2, {->
printHtmlPart(13)
createClosureForHtmlPart(14, 3)
invokeTag('form','g',79,['class':("navbar-form navbar-right"),'role':("form"),'url':("PMMS/j_spring_security_check"),'method':("POST")],3)
printHtmlPart(13)
})
invokeTag('ifNotLoggedIn','sec',80,[:],2)
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(13)
createTagBody(3, {->
printHtmlPart(15)
invokeTag('loggedInUserInfo','sec',83,['field':("username")],-1)
printHtmlPart(16)
})
invokeTag('form','g',85,['class':("navbar-form navbar-right"),'role':("form"),'url':([controller:'logout', action:'index']),'method':("POST")],3)
printHtmlPart(13)
})
invokeTag('ifLoggedIn','sec',86,[:],2)
printHtmlPart(17)
invokeTag('layoutBody','g',92,[:],-1)
printHtmlPart(18)
invokeTag('message','g',95,['code':("spinner.alt"),'default':("Loading&hellip;")],-1)
printHtmlPart(19)
invokeTag('layoutResources','r',96,[:],-1)
printHtmlPart(7)
})
invokeTag('captureBody','sitemesh',97,[:],1)
printHtmlPart(20)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1402420376828L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
