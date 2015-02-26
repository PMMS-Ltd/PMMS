<g:if test="${clientInstanceList}">
<table class="table table-bordered">
			<thead>
					<tr>
						<th class="text-center"></th>
						<g:sortableColumn property="clientId" title="${message(code: 'client.clientId.label', default: 'Client Id')}" class="text-center" style="width: 100px;"/>
						
						<g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}"/>
						
						<g:sortableColumn property="address" title="${message(code: 'client.address.label', default: 'Address')}"/>
															
						<g:sortableColumn property="yearStart" title="${message(code: 'client.yearStart.label', default: 'Year Start')}" class="text-center" style="width: 100px;"/>
					
						<g:sortableColumn property="yearEnd" title="${message(code: 'client.yearEnd.label', default: 'Year End')}" class="text-center" style="width: 100px;"/>
						
						<th class="text-center" style="width: 100px;">Properties</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr>
					
						<td style="width: 75px;"><g:link action="show" id="${clientInstance.id}" class="btn btn-xs btn-primary"><i span class="fa fa-eye fa-lg"></i> View</g:link></td>
						<td class="text-center">${fieldValue(bean: clientInstance, field: "clientId")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "name")}</td>
						
						<td>${fieldValue(bean: clientInstance, field: "address")}</td>
					
						<td class="text-center"><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearStart}" /></td>
					
						<td class="text-center"><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearEnd}" /></td>
						
						<td class="text-center"><span class="badge badge-danger">${clientInstance.units.size() }</span></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceCount ?: 0}" />
			</div>
			</g:if>
			<g:else>
				<h4 class="text-muted">No Results Found!</h4>
			</g:else>