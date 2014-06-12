import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_admin_contentBrowser_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/admin/_contentBrowser.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
if(true && (files.size() > 0)) {
printHtmlPart(1)
loop:{
int i = 0
for( file in (files) ) {
printHtmlPart(2)
expressionOut.print(i)
printHtmlPart(3)
createClosureForHtmlPart(4, 3)
invokeTag('link','g',33,['action':("deleteDocument"),'params':([Id: file.'cmis:objectId', folder: folder.'cmis:objectId']),'class':("btn btn-primary")],3)
printHtmlPart(5)
expressionOut.print(grailsApplication.config.grails.opencmis.alfresco.atomurl)
printHtmlPart(6)
expressionOut.print(file.'cmis:objectId')
printHtmlPart(7)
expressionOut.print(file.'cmis:name')
printHtmlPart(8)
expressionOut.print(i)
printHtmlPart(9)
expressionOut.print(file.'cmis:contentStreamLength')
printHtmlPart(10)
expressionOut.print(file.'cmis:contentStreamMimeType')
printHtmlPart(11)
i++
}
}
printHtmlPart(12)
}
else {
printHtmlPart(13)
}
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1402326697598L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
