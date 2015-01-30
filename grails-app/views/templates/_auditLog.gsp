<h3>History</h3>
<ul class="list-group">
	<g:each
		in="${org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent.findAllByPersistedObjectIdAndClassName(objectId,objectType,[sort: 'dateCreated',order: 'desc', max:10])}"
		var="event">
		<li class="list-group-item"><g:if
				test="${event.eventName == 'UPDATE'}">
				<span class="list-group-item-text">
					<i class="fa fa-fw fa-bolt"></i> <span class="text-success">
						${event.actor }
					</span>
					<g:if test="${event.oldValue == null}">
   					set ${event.propertyName} to ${event.newValue }
					</g:if>
					<g:else>
   					changed ${event.propertyName} from ${event.oldValue } to ${event.newValue }
					</g:else>
				</span>
			</g:if> <g:elseif test="${event.eventName == 'INSERT'}">
				<span class="list-group-item-text">
					<i class="fa fa-fw fa-check"></i> <span class="text-success">
						${event.actor }
					</span> created
					${event.className }
					id
					${event.persistedObjectId }
				</span>
			</g:elseif> <g:else>
				<span class="list-group-item-text">
					<i class="fa fa-fw fa-times"></i> <span class="text-success">
						${event.actor }
					</span> deleted
					${event.className }
					id
					${event.persistedObjectId }
				</span>
			</g:else>
			<span class="text-muted" style="float:right;">
				<g:formatDate
						date="${event.dateCreated }" type="datetime" style="MEDIUM"
						timeStyle="SHORT" />
			</span></li>
	</g:each>
</ul>