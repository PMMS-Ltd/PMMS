import uk.org.pmms.Client
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_client_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/client/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: clientInstance, field: 'name', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("client.name.label"),'default':("Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['name':("name"),'maxlength':("50"),'required':(""),'value':(clientInstance?.name)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clientInstance, field: 'clientId', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("client.clientId.label"),'default':("Client Id")],-1)
printHtmlPart(2)
invokeTag('textField','g',19,['name':("clientId"),'maxlength':("4"),'required':(""),'value':(clientInstance?.clientId)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clientInstance, field: 'yearStart', 'error'))
printHtmlPart(5)
invokeTag('message','g',25,['code':("client.yearStart.label"),'default':("Year Start")],-1)
printHtmlPart(2)
invokeTag('datePicker','g',28,['name':("yearStart"),'precision':("day"),'value':(clientInstance?.yearStart)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clientInstance, field: 'yearEnd', 'error'))
printHtmlPart(6)
invokeTag('message','g',34,['code':("client.yearEnd.label"),'default':("Year End")],-1)
printHtmlPart(2)
invokeTag('datePicker','g',37,['name':("yearEnd"),'precision':("day"),'value':(clientInstance?.yearEnd)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clientInstance, field: 'accountName', 'error'))
printHtmlPart(7)
invokeTag('message','g',43,['code':("client.accountName.label"),'default':("Account Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',46,['name':("accountName"),'maxlength':("50"),'required':(""),'value':(clientInstance?.accountName)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clientInstance, field: 'accountNo', 'error'))
printHtmlPart(8)
invokeTag('message','g',52,['code':("client.accountNo.label"),'default':("Account No")],-1)
printHtmlPart(2)
invokeTag('field','g',55,['name':("accountNo"),'type':("number"),'value':(clientInstance.accountNo),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clientInstance, field: 'units', 'error'))
printHtmlPart(9)
invokeTag('message','g',61,['code':("client.units.label"),'default':("Units")],-1)
printHtmlPart(10)
for( u in (clientInstance?.units) ) {
printHtmlPart(11)
createTagBody(2, {->
expressionOut.print(u?.encodeAsHTML())
})
invokeTag('link','g',67,['controller':("property"),'action':("show"),'id':(u.id)],2)
printHtmlPart(12)
}
printHtmlPart(13)
createTagBody(1, {->
expressionOut.print(message(code: 'default.add.label', args: [message(code: 'property.label', default: 'Property')]))
})
invokeTag('link','g',70,['controller':("property"),'action':("create"),'params':(['client.id': clientInstance?.id])],1)
printHtmlPart(14)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1398775383907L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
