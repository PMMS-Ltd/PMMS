<ol class="property-list issue">
			
				<g:if test="${issueInstance?.issueDescription}">
				<li class="fieldcontain">
					<span id="issueDescription-label" class="property-label"><g:message code="issue.issueDescription.label" default="Issue Description" /></span>
					
						<span class="property-value" aria-labelledby="issueDescription-label"><g:fieldValue bean="${issueInstance}" field="issueDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="issue.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${issueInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.jobId}">
				<li class="fieldcontain">
					<span id="jobId-label" class="property-label"><g:message code="issue.jobId.label" default="Job Id" /></span>
					
						<span class="property-value" aria-labelledby="jobId-label"><g:link controller="job" action="show" id="${issueInstance?.jobId?.id}">${issueInstance?.jobId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.assignedTo}">
				<li class="fieldcontain">
					<span id="assignedTo-label" class="property-label"><g:message code="issue.assignedTo.label" default="Assigned To" /></span>
					
						<span class="property-value" aria-labelledby="assignedTo-label"><g:fieldValue bean="${issueInstance}" field="assignedTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.clientId}">
				<li class="fieldcontain">
					<span id="clientId-label" class="property-label"><g:message code="issue.clientId.label" default="Client Id" /></span>
					
						<span class="property-value" aria-labelledby="clientId-label"><g:link controller="client" action="show" id="${issueInstance?.clientId?.id}">${issueInstance?.clientId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.closedDate}">
				<li class="fieldcontain">
					<span id="closedDate-label" class="property-label"><g:message code="issue.closedDate.label" default="Closed Date" /></span>
					
						<span class="property-value" aria-labelledby="closedDate-label"><g:formatDate date="${issueInstance?.closedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="issue.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${issueInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="issue.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${issueInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.reporterEmail}">
				<li class="fieldcontain">
					<span id="reporterEmail-label" class="property-label"><g:message code="issue.reporterEmail.label" default="Reporter Email" /></span>
					
						<span class="property-value" aria-labelledby="reporterEmail-label"><g:fieldValue bean="${issueInstance}" field="reporterEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.reporterName}">
				<li class="fieldcontain">
					<span id="reporterName-label" class="property-label"><g:message code="issue.reporterName.label" default="Reporter Name" /></span>
					
						<span class="property-value" aria-labelledby="reporterName-label"><g:fieldValue bean="${issueInstance}" field="reporterName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${issueInstance?.reporterPhone}">
				<li class="fieldcontain">
					<span id="reporterPhone-label" class="property-label"><g:message code="issue.reporterPhone.label" default="Reporter Phone" /></span>
					
						<span class="property-value" aria-labelledby="reporterPhone-label"><g:fieldValue bean="${issueInstance}" field="reporterPhone"/></span>
					
				</li>
				</g:if>
			
			</ol>