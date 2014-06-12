
<%@ page import="uk.org.pmms.Transfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'transfer.label', default: 'Transfer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-transfer" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
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
	</body>
</html>
