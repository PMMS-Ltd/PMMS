<g:if test="${clientInstanceList.size() > 0 }">
<table class="table table-bordered">
			<thead>
					<tr>
						<th class="text-center bg-primary"></th>
						<g:sortableColumn property="clientId" title="${message(code: 'client.clientId.label', default: 'Client Id')}" class="text-center bg-primary"/>
						
						<g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" class=" bg-primary"/>
						
						<g:sortableColumn property="address" title="${message(code: 'client.address.label', default: 'Address')}" class="bg-primary"/>
															
						<g:sortableColumn property="yearStart" title="${message(code: 'client.yearStart.label', default: 'Year Start')}" class="text-center bg-primary"/>
					
						<g:sortableColumn property="yearEnd" title="${message(code: 'client.yearEnd.label', default: 'Year End')}" class="text-center bg-primary"/>
						
						<th class="text-center bg-primary">Properties</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr>
					
						<td style="width: 75px;"><g:link action="show" id="${clientInstance.id}" class="btn btn-xs btn-primary"><i span class="fa fa-eye fa-lg"></i> View</g:link></td>
						<td class="col-xs-1 text-center">${fieldValue(bean: clientInstance, field: "clientId")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "name")}</td>
						
						<td>${fieldValue(bean: clientInstance, field: "address")}</td>
					
						<td class="col-xs-1 text-center"><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearStart}" /></td>
					
						<td class="col-xs-1 text-center"><g:formatDate format="dd-MM-yyyy" date="${clientInstance.yearEnd}" /></td>
						
						<td class="col-xs-1 text-center"><span class="badge badge-danger">${clientInstance.units.size() }</span></td>
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