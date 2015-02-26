
<%@ page import="uk.org.pmms.Transfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'transfer.label', default: 'Transfer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require module="wizard"/>
	</head>
	<body>
	<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" />: ${transferInstance.id }</h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
				<div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Stage 1</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#step1" class="bs-wizard-dot" data-toggle="tab"></a>
                  <div class="bs-wizard-info text-center">Initial Enquiry</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Stage 2</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#step2" class="bs-wizard-dot" data-toggle="tab"></a>
                  <div class="bs-wizard-info text-center">Supply Copypack</div>
                </div>
                
                 <div class="col-xs-2 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum">Stage 3</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#step3" class="bs-wizard-dot"  data-toggle="tab"></a>
                  <div class="bs-wizard-info text-center">Issue Apportionment Statement</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum">Stage 4</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#step3" class="bs-wizard-dot"  data-toggle="tab"></a>
                  <div class="bs-wizard-info text-center">Receive and Validate Transfer Documents</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum">Stage 5</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Register Transfer with Companies House</div>
                </div>
				
				<div class="col-xs-2 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum">Stage 6</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Transfer Complete</div>
                </div>
            </div>
			</div>
			<div class="row">
		<div id="show-transfer" class="col-md-7 col-sm-10 hidden-xs" role="main" style="height:100%;">
			<div class="panel panel-default" style="height:100%;">
					<div class="panel-heading">
						<h4 class="panel-title">Details</h4>
					</div>
					<div class="panel-body">
					<div class="tab-content">
					<div class="tab-pane active" id="step1">
					<h4>Initial Enquiry</h4>
						<ul class="list-group">
			
				
				<li class="list-group-item">
					<strong>Property ID : </strong>
					<span class="list-group-item-text" aria-labelledby="prop-label"><g:link controller="property" action="show" id="${transferInstance?.prop?.id}">${transferInstance?.prop?.encodeAsHTML()}</g:link></span>
				</li>				
				<li class="list-group-item">
					<strong><g:message code="transfer.vSolicitor.label" default="Vendor's Solicitor : " /></strong>
						<span class="list-group-item-text" aria-labelledby="vSolicitor-label"><g:link action="show" controller="supplier" id="${transferInstance.vSolicitor.id }">${transferInstance.vSolicitor}</g:link>, ${transferInstance.vSolicitor.address }</span>
				</li>
				<li class="list-group-item">
					<strong><g:message code="transfer.vSolictorRef.label" default="Vendor's Solictor's Ref : " /></strong>
					<span class="list-group-item-text" aria-labelledby="vSolictorRef-label"><g:fieldValue bean="${transferInstance}" field="vSolictorRef"/></span>
				</li>
				
				<li class="list-group-item">
					<strong><g:message code="transfer.dateCreated.label" default="Initial Enquiry Date : " /></strong>
					<span class="list-group-item-text"><g:formatDate date="${transferInstance.dateCreated }" format="dd/MM/yyyy"/></span>
				</li>
			</ul>
			<g:link action="edit" class="btn btn-sm btn-default" resource="${transferInstance}"><i class="fa fa-fw fa-pencil"></i> <g:message code="default.button.edit.label" default="Edit" /></g:link>
			</div>
			<div class="tab-pane" id="step2">
			<h4>Supply Copypack</h4>
				<ul class="list-group">
				<g:if test="${transferInstance?.completionDate}">
				<li class="fieldcontain">
					<span id="completionDate-label" class="property-label"><g:message code="transfer.completionDate.label" default="Completion Date" /></span>
					
						<span class="property-value" aria-labelledby="completionDate-label"><g:formatDate date="${transferInstance?.completionDate}" /></span>
					
				</li>
				</g:if>
			
				
				<li class="list-group-item">
					<strong><g:message code="transfer.feeReceived.label" default="Copy Pack fee received on : " /></strong>
					
						<span class="list-group-item-text" aria-labelledby="feeReceived-label"><g:formatDate date="${transferInstance?.feeReceived}" format="dd/MM/yyyy"/></span>
						<g:if test="${transferInstance?.feeReceived }">
						<g:link class="btn btn-xs btn-success" action="show" controller="invoice" id="${transferInstance.copyPackInvoice?.id }"><i class="fa fa-fw fa-eye"></i> View Invoice</g:link>
						</g:if>
					
				</li>
				
			
				
				<li class="list-group-item">
					<strong><g:message code="transfer.copypackSent.label" default="Copypack Sent on : " /></strong>
					
						<span class="list-group-item-text" aria-labelledby="copypackSent-label"><g:formatDate date="${transferInstance?.copypackSent}" format="dd/MM/yyyy"/></span>
					
				</li>
				
			
				<g:if test="${transferInstance?.newOwner}">
				<li class="fieldcontain">
					<span id="newOwner-label" class="property-label"><g:message code="transfer.newOwner.label" default="New Owner" /></span>
					
						<span class="property-value" aria-labelledby="newOwner-label"><g:link controller="person" action="show" id="${transferInstance?.newOwner?.id}">${transferInstance?.newOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				</ul>
				<g:link action="edit2" class="btn btn-sm btn-default" resource="${transferInstance}"><i class="fa fa-fw fa-pencil"></i> <g:message code="default.button.edit.label" default="Edit" /></g:link>
			</div>
			</div>
			
					</div>
			
			</div>
			<div class="hidden">
				<g:form url="[resource:transferInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${transferInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
		</div>
		<div class="col-md-5" style="height:100%;">
		<div class="panel panel-default" style="height:100%;">
					<div class="panel-heading">
						<h4 class="panel-title">History</h4>
					</div>
					<div class="panel-body">
		
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
		</div>
		</div>
	</body>
</html>
