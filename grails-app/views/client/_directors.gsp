<div class="col-lg-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			Owners
		</div>
		<div class="panel-body">
			<ul class="list-group">
				<g:each in="${clientInstance.units }" var="prop">
					<g:if test="${prop.owner != null}">
						<li class="list-group-item">
							<span>${prop.owner}</span>
							<g:if test="${clientInstance.directors.id.contains(prop.owner.id)}">
							<span class="pull-right">
								<g:link action="removeDirector" params="[person: prop.owner.id]" resource="${clientInstance }" class="btn btn-danger btn-xs"><i class="fa fa-fw fa-trash-o"></i> Remove</g:link>
							</span>
							</g:if>
							<g:else>
								<span class="pull-right">
								<g:link action="addDirector" params="[person: prop.owner.id]" resource="${clientInstance }" class="btn btn-success btn-xs"><i class="fa fa-fw fa-plus"></i> Add</g:link>
							</span>
							</g:else>
							<span class="pull-right">${prop.propertyId } </span>
						</li>
					</g:if>
				</g:each>
			</ul>
		</div>
	</div>
</div>
<div class="col-lg-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			Directors
		</div>
		<div class="panel-body">
			<ul class="list-group">
				<g:each in="${clientInstance.directors }" var="dir">
						<li class="list-group-item">
							${dir.firstName }
						</li>
				</g:each>
			</ul>
		</div>
	</div>
</div>