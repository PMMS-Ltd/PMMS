<table class="table">
			<thead>
					<tr>
						<th></th>
						<g:sortableColumn property="clientId" title="${message(code: 'client.clientId.label', default: 'Client Id')}" />
						
						<g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="address" title="${message(code: 'client.address.label', default: 'Address')}" />
															
						<g:sortableColumn property="yearStart" title="${message(code: 'client.yearStart.label', default: 'Year Start')}" />
					
						<g:sortableColumn property="yearEnd" title="${message(code: 'client.yearEnd.label', default: 'Year End')}" />
						
						<th>Properties</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr>
					
						<td style="width: 75px;"><g:link action="show" id="${clientInstance.id}" class="btn btn-xs btn-default"><i span class="fa fa-eye fa-lg"></i> View</g:link></td>
						<td>${fieldValue(bean: clientInstance, field: "clientId")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "name")}</td>
						
						<td>${fieldValue(bean: clientInstance, field: "address")}</td>
					
						<td class="col-xs-1"><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearStart}" /></td>
					
						<td class="col-xs-1"><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearEnd}" /></td>
						
						<td class="col-xs-1 text-center"><span class="badge">${clientInstance.units.size() }</span></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceCount ?: 0}" />
			</div>