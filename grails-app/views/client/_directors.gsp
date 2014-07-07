<div class="col-lg-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			Owners
		</div>
		<div class="panel-body">
			<table class="table table-condensed">
				<g:each in="${clientInstance.units }" var="prop">
					<g:if test="${prop.owner != null}">
						<tr>
							<td class="col-xs-6">${prop.owner}</td>
							<td class="col-xs-3 text-center">${prop.propertyId } </td>
							<g:if test="${clientInstance.directors.id.contains(prop.owner.id)}">
							<td class="col-xs-3">
								<g:link action="removeDirector" params="[person: prop.owner.id]" resource="${clientInstance }" class="btn btn-danger btn-xs pull-right"><i class="fa fa-fw fa-trash-o"></i> Remove</g:link>
							</td>
							</g:if>
							<g:else>
								<td class="col-xs-3">
								<g:link action="addDirector" params="[person: prop.owner.id]" resource="${clientInstance }" class="btn btn-success btn-xs pull-right"><i class="fa fa-fw fa-plus"></i> Add</g:link>
							</td>
							</g:else>
						</tr>
					</g:if>
				</g:each>
			</table>
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
			<g:if test="${clientInstance.directors }">
				<g:each in="${clientInstance.directors }" var="e">
						<li class="list-group-item">
										<div class="row">
											<div class="col-xs-1">
												<i class="fa fa-user fa-3x"></i>
											</div>
											<div class="col-xs-10 col-xs-offset-1 vcard">
												<h4 class="list-group-item-heading fn n">
													<span class="family-name">${e.lastName }</span>,
													<span class="given-name">${e.firstName }</span>
													<span class="additional-name">${e.initial? e.initial+' ':'' }</span>(${e.salutation })
												</h4>
												<p class="list-group-item-text adr">
													<span class="street-address">${e.address.unitNo } ${e.address.address1 }</span>,
													<span class="locality">${e.address.town }</span>, 
													<span class="region">${e.address.county }</span>, 
													<span class="postal-code">${e.address.postCode }</span>,								
													<span class="country-name">${e.address.country }</span>
												</p>
												<p class="list-group-item-text">
													<i class="fa fa-phone"></i> &nbsp;<span class="tel">${e.phone1 }</span>
													<strong>@</strong> &nbsp;<a class="email" href="mailto:${e.email1 }">${e.email1 }</a>
												</p>
											</div>
											<div class="col-xs-2 hidden close-icon">
												<a href="#"><i class="fa fa-times fa-lg fa-fw pull-right text-danger"></i></a>
											</div>
										</div>
									</li>
				</g:each>
				</g:if>
				<g:else>
					<span class="text-muted">Please select some directors</span>
				</g:else>
			</ul>
		</div>
	</div>
</div>