
<%@ page import="uk.org.pmms.Transfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'transfer.label', default: 'Transfer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
		<div id="show-transfer" class="col-lg-6 col-md-8 col-sm-10 hidden-xs" role="main">
			<h4>Details</h4>
			<ol class="property-list transfer">
			
				<g:if test="${transferInstance?.completionDate}">
				<li class="fieldcontain">
					<span id="completionDate-label" class="property-label"><g:message code="transfer.completionDate.label" default="Completion Date" /></span>
					
						<span class="property-value" aria-labelledby="completionDate-label"><g:formatDate date="${transferInstance?.completionDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transferInstance?.feeReceived}">
				<li class="fieldcontain">
					<span id="feeReceived-label" class="property-label"><g:message code="transfer.feeReceived.label" default="Fee Received" /></span>
					
						<span class="property-value" aria-labelledby="feeReceived-label"><g:formatDate date="${transferInstance?.feeReceived}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transferInstance?.copypackSent}">
				<li class="fieldcontain">
					<span id="copypackSent-label" class="property-label"><g:message code="transfer.copypackSent.label" default="Copypack Sent" /></span>
					
						<span class="property-value" aria-labelledby="copypackSent-label"><g:formatDate date="${transferInstance?.copypackSent}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transferInstance?.newOwner}">
				<li class="fieldcontain">
					<span id="newOwner-label" class="property-label"><g:message code="transfer.newOwner.label" default="New Owner" /></span>
					
						<span class="property-value" aria-labelledby="newOwner-label"><g:link controller="person" action="show" id="${transferInstance?.newOwner?.id}">${transferInstance?.newOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transferInstance?.prop}">
				<li class="fieldcontain">
					<span id="prop-label" class="property-label"><g:message code="transfer.prop.label" default="Prop" /></span>
					
						<span class="property-value" aria-labelledby="prop-label"><g:link controller="property" action="show" id="${transferInstance?.prop?.id}">${transferInstance?.prop?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transferInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="transfer.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${transferInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transferInstance?.vSolicitor}">
				<li class="fieldcontain">
					<span id="vSolicitor-label" class="property-label"><g:message code="transfer.vSolicitor.label" default="V Solicitor" /></span>
					
						<span class="property-value" aria-labelledby="vSolicitor-label"><g:fieldValue bean="${transferInstance}" field="vSolicitor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transferInstance?.vSolictorRef}">
				<li class="fieldcontain">
					<span id="vSolictorRef-label" class="property-label"><g:message code="transfer.vSolictorRef.label" default="V Solictor Ref" /></span>
					
						<span class="property-value" aria-labelledby="vSolictorRef-label"><g:fieldValue bean="${transferInstance}" field="vSolictorRef"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:transferInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${transferInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		<div class="col-lg-6 col-md-4">
			<h4>History</h4>
			<ul class="list-group">
			<g:each in="${org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent.findAllByPersistedObjectIdAndClassName(transferInstance.id,'Transfer',[sort: 'dateCreated',order: 'desc', max:10])}" var="event">
			<li class="list-group-item">
			<g:if test="${event.eventName == 'UPDATE'}">
   				<p class="list-group-item-text"><i class="fa fa-fw fa-bolt"></i> <span class="text-success">${event.actor }</span>
   				<g:if test="${event.oldValue == null}">
   					set ${event.propertyName} to ${event.newValue }
   				</g:if>
   				<g:else>
   					changed ${event.propertyName} from ${event.oldValue } to ${event.newValue }
   				</g:else>
   				 </p>
			</g:if>
			<g:elseif test="${event.eventName == 'INSERT'}">
    			<p class="list-group-item-text"><i class="fa fa-fw fa-check"></i> <span class="text-success">${event.actor }</span> created ${event.className } id ${event.persistedObjectId }</p>
			</g:elseif>
			<g:else>
				<p class="list-group-item-text"><i class="fa fa-fw fa-times"></i> <span class="text-success">${event.actor }</span> deleted ${event.className } id ${event.persistedObjectId }</p>
			</g:else>
				<p class="list-group-item-text text-right"><span class="text-muted"><g:formatDate date="${event.dateCreated }" type="datetime" style="MEDIUM" timeStyle="SHORT"/></span></p>
			</li>
			</g:each>
			</ul>
		</div>
		</div>
	</body>
</html>
