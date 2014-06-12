import uk.org.pmms.Transfer
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_transfer_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/transfer/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: transferInstance, field: 'completionDate', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("transfer.completionDate.label"),'default':("Completion Date")],-1)
printHtmlPart(2)
invokeTag('datePicker','g',10,['name':("completionDate"),'precision':("day"),'value':(transferInstance?.completionDate),'default':("none"),'noSelection':(['': ''])],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: transferInstance, field: 'newOwner', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("transfer.newOwner.label"),'default':("New Owner")],-1)
printHtmlPart(2)
invokeTag('textField','g',19,['name':("newOwner"),'value':(transferInstance?.newOwner)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: transferInstance, field: 'copypackSent', 'error'))
printHtmlPart(5)
invokeTag('message','g',25,['code':("transfer.copypackSent.label"),'default':("Copypack Sent")],-1)
printHtmlPart(6)
invokeTag('datePicker','g',28,['name':("copypackSent"),'precision':("day"),'value':(transferInstance?.copypackSent),'default':("none"),'noSelection':(['': ''])],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: transferInstance, field: 'feeReceived', 'error'))
printHtmlPart(7)
invokeTag('message','g',34,['code':("transfer.feeReceived.label"),'default':("Fee Received")],-1)
printHtmlPart(6)
invokeTag('datePicker','g',37,['name':("feeReceived"),'precision':("day"),'value':(transferInstance?.feeReceived),'default':("none"),'noSelection':(['': ''])],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: transferInstance, field: 'prop', 'error'))
printHtmlPart(8)
invokeTag('message','g',43,['code':("transfer.prop.label"),'default':("Prop")],-1)
printHtmlPart(6)
invokeTag('select','g',46,['id':("prop"),'name':("prop.id"),'from':(uk.org.pmms.Property.list()),'optionKey':("id"),'required':(""),'value':(transferInstance?.prop?.id),'class':("many-to-one")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: transferInstance, field: 'status', 'error'))
printHtmlPart(9)
invokeTag('message','g',52,['code':("transfer.status.label"),'default':("Status")],-1)
printHtmlPart(6)
invokeTag('textField','g',55,['name':("status"),'required':(""),'value':(transferInstance?.status)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: transferInstance, field: 'vSolicitor', 'error'))
printHtmlPart(10)
invokeTag('message','g',61,['code':("transfer.vSolicitor.label"),'default':("V Solicitor")],-1)
printHtmlPart(6)
invokeTag('textField','g',64,['name':("vSolicitor"),'required':(""),'value':(transferInstance?.vSolicitor)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: transferInstance, field: 'vSolictorRef', 'error'))
printHtmlPart(11)
invokeTag('message','g',70,['code':("transfer.vSolictorRef.label"),'default':("V Solictor Ref")],-1)
printHtmlPart(6)
invokeTag('textField','g',73,['name':("vSolictorRef"),'required':(""),'value':(transferInstance?.vSolictorRef)],-1)
printHtmlPart(12)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1402323563785L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
