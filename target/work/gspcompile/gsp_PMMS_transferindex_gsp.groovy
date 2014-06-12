import uk.org.pmms.Transfer
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_transferindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/transfer/index.gsp" }
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
invokeTag('message','g',9,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(0)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('message','g',14,['code':("default.list.label"),'args':([entityName])],-1)
printHtmlPart(3)
createTagBody(2, {->
printHtmlPart(4)
createClosureForHtmlPart(5, 3)
invokeTag('link','g',20,['class':("btn btn-success"),'action':("create")],3)
printHtmlPart(6)
})
invokeTag('ifAnyGranted','sec',21,['roles':("ROLE_ADMIN")],2)
printHtmlPart(7)
if(true && (flash.message)) {
printHtmlPart(8)
expressionOut.print(flash.message)
printHtmlPart(9)
}
printHtmlPart(10)
invokeTag('sortableColumn','g',37,['property':("id"),'class':("text-center"),'title':(message(code: 'transfer.id.label', default: 'Transfer ID'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',39,['property':("prop"),'title':(message(code: 'transfer.prop.label', default: 'Property ID'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',41,['property':("dateInformed"),'class':("text-center"),'title':(message(code: 'transfer.dateInformed.label', default: 'Date Informed'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',43,['property':("status"),'class':("text-center"),'title':(message(code: 'transfer.status.label', default: 'Status'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',45,['property':("vSolicitor"),'title':(message(code: 'transfer.vSolicitor.label', default: 'V Solicitor'))],-1)
printHtmlPart(12)
for( transferInstance in (transferInstanceList) ) {
printHtmlPart(13)
createTagBody(3, {->
printHtmlPart(14)
expressionOut.print(fieldValue(bean: transferInstance, field: "id"))
printHtmlPart(15)
})
invokeTag('link','g',55,['action':("show"),'id':(transferInstance.id)],3)
printHtmlPart(16)
createTagBody(3, {->
printHtmlPart(14)
expressionOut.print(fieldValue(bean: transferInstance, field: "prop"))
printHtmlPart(15)
})
invokeTag('link','g',59,['controller':("property"),'action':("show"),'id':(transferInstance.prop.id)],3)
printHtmlPart(17)
invokeTag('formatDate','g',61,['date':(transferInstance.dateInformed),'format':("dd-MM-yyyy")],-1)
printHtmlPart(18)
expressionOut.print(fieldValue(bean: transferInstance, field: "status"))
printHtmlPart(19)
expressionOut.print(fieldValue(bean: transferInstance, field: "vSolicitor"))
printHtmlPart(20)
}
printHtmlPart(21)
invokeTag('paginate','g',73,['total':(transferInstanceCount ?: 0)],-1)
printHtmlPart(22)
})
invokeTag('captureBody','sitemesh',76,[:],1)
printHtmlPart(23)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1402326870972L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
