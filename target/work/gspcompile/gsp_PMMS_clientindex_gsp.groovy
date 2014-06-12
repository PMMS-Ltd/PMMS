import uk.org.pmms.Client
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_clientindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/client/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("PMMS")],-1)
printHtmlPart(2)
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'client.label', default: 'Client'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',9,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',14,['code':("default.list.label"),'args':([entityName])],-1)
printHtmlPart(5)
createTagBody(2, {->
createClosureForHtmlPart(6, 3)
invokeTag('link','g',18,['class':("btn btn-success"),'action':("create"),'controller':("client")],3)
})
invokeTag('ifAnyGranted','sec',18,['roles':("ROLE_ADMIN")],2)
printHtmlPart(7)
if(true && (flash.message)) {
printHtmlPart(8)
expressionOut.print(flash.message)
printHtmlPart(9)
}
printHtmlPart(10)
invokeTag('sortableColumn','g',29,['property':("name"),'title':(message(code: 'client.name.label', default: 'Name'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',31,['property':("clientId"),'title':(message(code: 'client.clientId.label', default: 'Client Id'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',33,['property':("yearStart"),'title':(message(code: 'client.yearStart.label', default: 'Year Start'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',35,['property':("yearEnd"),'title':(message(code: 'client.yearEnd.label', default: 'Year End'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',37,['property':("accountName"),'title':(message(code: 'client.accountName.label', default: 'Account Name'))],-1)
printHtmlPart(11)
invokeTag('sortableColumn','g',39,['property':("accountNo"),'title':(message(code: 'client.accountNo.label', default: 'Account No'))],-1)
printHtmlPart(12)
loop:{
int i = 0
for( clientInstance in (clientInstanceList) ) {
printHtmlPart(13)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(14)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: clientInstance, field: "name"))
})
invokeTag('link','g',47,['action':("show"),'id':(clientInstance.id)],3)
printHtmlPart(15)
expressionOut.print(fieldValue(bean: clientInstance, field: "clientId"))
printHtmlPart(15)
invokeTag('formatDate','g',51,['format':("dd-MM-yyyy"),'date':(clientInstance.yearStart)],-1)
printHtmlPart(15)
invokeTag('formatDate','g',53,['format':("dd-MM-yyyy"),'date':(clientInstance.yearEnd)],-1)
printHtmlPart(15)
expressionOut.print(fieldValue(bean: clientInstance, field: "accountName"))
printHtmlPart(15)
invokeTag('formatNumber','g',57,['number':(clientInstance.accountNo),'format':("########"),'minIntegerDigits':("8")],-1)
printHtmlPart(16)
invokeTag('formatNumber','g',59,['number':(clientInstance.accountNo),'type':("number"),'minIntegerDigits':("8")],-1)
printHtmlPart(17)
i++
}
}
printHtmlPart(18)
invokeTag('paginate','g',66,['total':(clientInstanceCount ?: 0)],-1)
printHtmlPart(19)
})
invokeTag('captureBody','sitemesh',69,[:],1)
printHtmlPart(20)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1399380067975L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
