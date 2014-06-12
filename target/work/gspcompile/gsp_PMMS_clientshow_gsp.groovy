import uk.org.pmms.Client
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_PMMS_clientshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/client/show.gsp" }
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
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'client.label', default: 'Client'))],-1)
printHtmlPart(0)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.show.label"),'args':([entityName])],-1)
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
invokeTag('fieldValue','g',15,['bean':(client),'field':("name")],-1)
printHtmlPart(3)
createTagBody(2, {->
printHtmlPart(4)
invokeTag('message','g',21,['code':("default.button.edit.label"),'default':("Edit")],-1)
printHtmlPart(5)
})
invokeTag('link','g',22,['class':("btn btn-primary"),'action':("edit"),'resource':(client)],2)
printHtmlPart(6)
createTagBody(2, {->
printHtmlPart(4)
invokeTag('actionSubmit','g',28,['class':("btn btn-danger"),'action':("delete"),'value':(message(code: 'default.button.delete.label', default: 'Delete')),'onclick':("return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');")],-1)
printHtmlPart(5)
})
invokeTag('ifAnyGranted','sec',29,['roles':("ROLE_ADMIN")],2)
printHtmlPart(7)
if(true && (flash.message)) {
printHtmlPart(8)
expressionOut.print(flash.message)
printHtmlPart(9)
}
printHtmlPart(10)
invokeTag('message','g',43,['code':("client.clientId.label"),'default':("Client Id")],-1)
printHtmlPart(11)
invokeTag('fieldValue','g',46,['bean':(client),'field':("clientId")],-1)
printHtmlPart(12)
invokeTag('message','g',49,['code':("client.yearStart.label"),'default':("Year Start")],-1)
printHtmlPart(11)
invokeTag('formatDate','g',52,['format':("dd-MM-yyyy"),'date':(client?.yearStart)],-1)
printHtmlPart(12)
invokeTag('message','g',55,['code':("client.yearEnd.label"),'default':("Year End")],-1)
printHtmlPart(11)
invokeTag('formatDate','g',58,['format':("dd-MM-yyyy"),'date':(client?.yearEnd)],-1)
printHtmlPart(12)
invokeTag('message','g',61,['code':("client.accountName.label"),'default':("Account Name")],-1)
printHtmlPart(11)
invokeTag('fieldValue','g',64,['bean':(client),'field':("accountName")],-1)
printHtmlPart(12)
invokeTag('message','g',67,['code':("client.accountNo.label"),'default':("Account No")],-1)
printHtmlPart(11)
invokeTag('formatNumber','g',71,['number':(client.accountNo),'format':("########"),'minIntegerDigits':("8")],-1)
printHtmlPart(13)
if(true && (client?.clientId)) {
printHtmlPart(14)
invokeTag('message','g',84,['code':("client.clientId.label"),'default':("Underwriter")],-1)
printHtmlPart(15)
invokeTag('fieldValue','g',87,['bean':(client),'field':("clientId")],-1)
printHtmlPart(16)
}
printHtmlPart(4)
if(true && (client?.yearStart)) {
printHtmlPart(14)
invokeTag('message','g',95,['code':("client.yearStart.label"),'default':("Broker")],-1)
printHtmlPart(15)
invokeTag('formatDate','g',98,['format':("dd-MM-yyyy"),'date':(client?.yearStart)],-1)
printHtmlPart(16)
}
printHtmlPart(4)
if(true && (client?.yearEnd)) {
printHtmlPart(14)
invokeTag('message','g',106,['code':("client.yearEnd.label"),'default':("Renewal Date")],-1)
printHtmlPart(15)
invokeTag('formatDate','g',109,['format':("dd-MM-yyyy"),'date':(client?.yearEnd)],-1)
printHtmlPart(16)
}
printHtmlPart(4)
if(true && (client?.accountName)) {
printHtmlPart(14)
invokeTag('message','g',117,['code':("client.accountName.label"),'default':("Policy No.")],-1)
printHtmlPart(15)
invokeTag('fieldValue','g',120,['bean':(client),'field':("accountName")],-1)
printHtmlPart(16)
}
printHtmlPart(4)
if(true && (client?.accountNo)) {
printHtmlPart(14)
invokeTag('message','g',128,['code':("client.accountNo.label"),'default':("Account No")],-1)
printHtmlPart(15)
invokeTag('formatNumber','g',132,['number':(client.accountNo),'format':("########"),'minIntegerDigits':("8")],-1)
printHtmlPart(16)
}
printHtmlPart(17)
if(true && (client?.units)) {
printHtmlPart(18)
for( u in (client.units) ) {
printHtmlPart(19)
createTagBody(4, {->
printHtmlPart(20)
expressionOut.print(u?.encodeAsHTML())
printHtmlPart(21)
})
invokeTag('link','g',161,['controller':("property"),'action':("show"),'id':(u.id)],4)
printHtmlPart(22)
expressionOut.print(u?.unitNo)
printHtmlPart(23)
expressionOut.print(u?.address1)
printHtmlPart(23)
expressionOut.print(u?.town)
printHtmlPart(23)
expressionOut.print(u?.county)
printHtmlPart(23)
expressionOut.print(u?.postCode)
printHtmlPart(24)
}
printHtmlPart(25)
}
else {
printHtmlPart(26)
}
printHtmlPart(27)
if(true && (files.size() > 0)) {
printHtmlPart(28)
loop:{
int i = 0
for( file in (files) ) {
printHtmlPart(29)
expressionOut.print(grailsApplication.config.grails.opencmis.alfresco.atomurl)
printHtmlPart(30)
expressionOut.print(file.'cmis:objectId')
printHtmlPart(31)
expressionOut.print(file.'cmis:name')
printHtmlPart(32)
expressionOut.print(i)
printHtmlPart(33)
expressionOut.print(file.'cmis:contentStreamLength')
printHtmlPart(34)
expressionOut.print(file.'cmis:contentStreamMimeType')
printHtmlPart(24)
i++
}
}
printHtmlPart(35)
}
else {
printHtmlPart(36)
}
printHtmlPart(37)
})
invokeTag('captureBody','sitemesh',236,[:],1)
printHtmlPart(38)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1400508339006L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
