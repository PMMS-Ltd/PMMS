<h2>Results</h2>
<g:if test="${supplierInstanceList.size() > 0 }">
			
			<table class="table">
			<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'supplier.id.label', default: 'Supplier ID')}" />
						
						<g:sortableColumn property="name" title="${message(code: 'supplier.name.label', default: 'Supplier Name')}" />
						
						<g:sortableColumn property="address" title="${message(code: 'supplier.address.label', default: 'Email1 Type')}" />
						
						<th>Supplier Types</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
					<tr>
					
						<td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "id")}</g:link></td>
						
						<td>${fieldValue(bean: supplierInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: supplierInstance, field: "address")}</td>
					
						<td>
							<g:each in="${supplierInstance.workTypes }" var="wType">
								<span class="label label-default">${wType.type}</span>
							</g:each>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</g:if>
			<g:else>
				<h4 class="text-muted">No Results Found!</h4>
			</g:else>