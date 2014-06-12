import uk.org.pmms.Transfer
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_transfershow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/transfer/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(0)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("PMMS")],-1)
printHtmlPart(0)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'transfer.label', default: 'Transfer'))],-1)
printHtmlPart(0)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(2)
})
invokeTag('captureHead','sitemesh',11,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('fieldValue','g',13,['bean':(transferInstance),'field':("id")],-1)
printHtmlPart(5)
expressionOut.print(transferInstance?.status)
printHtmlPart(6)
invokeTag('fieldValue','g',14,['bean':(transferInstance),'field':("id")],-1)
printHtmlPart(5)
expressionOut.print(transferInstance?.status)
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(8)
invokeTag('message','g',18,['code':("default.button.edit.label"),'default':("Edit")],-1)
printHtmlPart(9)
})
invokeTag('link','g',19,['class':("btn btn-primary btn-sm"),'action':("edit"),'resource':(transferInstance)],2)
printHtmlPart(10)
createTagBody(2, {->
printHtmlPart(8)
invokeTag('actionSubmit','g',25,['class':("btn btn-danger btn-sm"),'action':("delete"),'value':(message(code: 'default.button.delete.label', default: 'Delete')),'onclick':("return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');")],-1)
printHtmlPart(9)
})
invokeTag('ifAnyGranted','sec',26,['roles':("ROLE_ADMIN")],2)
printHtmlPart(11)
if(true && (flash.message)) {
printHtmlPart(12)
expressionOut.print(flash.message)
printHtmlPart(13)
}
printHtmlPart(14)
invokeTag('message','g',37,['code':("transfer.prop.label"),'default':("Property ID")],-1)
printHtmlPart(15)
createTagBody(2, {->
expressionOut.print(transferInstance?.prop?.encodeAsHTML())
})
invokeTag('link','g',39,['controller':("property"),'action':("show"),'id':(transferInstance?.prop?.id)],2)
printHtmlPart(16)
invokeTag('message','g',43,['code':("transfer.dateInformed.label"),'default':("Date Informed")],-1)
printHtmlPart(17)
invokeTag('formatDate','g',45,['date':(transferInstance?.dateInformed),'format':("dd-MM-yyyy")],-1)
printHtmlPart(18)
invokeTag('message','g',49,['code':("transfer.vSolicitor.label"),'default':("Vendor's Solicitor")],-1)
printHtmlPart(17)
expressionOut.print(transferInstance?.vSolicitor)
printHtmlPart(18)
invokeTag('message','g',55,['code':("transfer.vSolictorRef.label"),'default':("Vendor's Solicitor Reference")],-1)
printHtmlPart(17)
expressionOut.print(transferInstance?.vSolictorRef)
printHtmlPart(19)
createTagBody(2, {->
printHtmlPart(20)
expressionOut.print(request.contextPath)
printHtmlPart(21)
expressionOut.print(transferInstance.id)
printHtmlPart(22)
})
invokeTag('javascript','g',85,[:],2)
printHtmlPart(3)
})
invokeTag('captureBody','sitemesh',86,[:],1)
printHtmlPart(23)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1402508242421L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
