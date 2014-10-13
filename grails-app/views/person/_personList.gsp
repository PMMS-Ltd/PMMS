<%@ page import="uk.org.pmms.Person.PhoneType"%>
<g:if test="${personInstanceList.size() > 0 }">
			
			<table class="table">
			<thead>
					<tr>
						<th style="width:110px;"></th>
						<g:sortableColumn property="salutation" title="${message(code: 'person.salutation.label', default: 'Salutation')}" style="width: 50px;" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'person.firstName.label', default: 'First Name')}" class="col-lg-1" />
					
						<g:sortableColumn property="initial" title="${message(code: 'person.initial.label', default: 'Initial')}"  style="width:50px;"/>
					
						<g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}"  class="col-lg-1"/>
						
						<th class="col-lg-4">Address</th>
					
						<th>Contact Details</th>
						
						<th>Type</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr>
					
						<td>
							<div class="btn-group">
							<g:link action="show" id="${personInstance.id}" class="btn btn-xs btn-default"><i class="fa fa-fw fa-eye"></i> View</g:link>
			<button class="btn btn-xs btn-default dropdown-toggle"
				data-toggle="dropdown"><span class="caret"></span> <span
				class="sr-only">Toggle Dropdown</span>
			</button>

			<ul class="dropdown-menu" role="menu">
				<li><g:link action="edit" id="${personInstance.id }" style="text-decoration: none;">
						<i class="fa fa-pencil fa-fw"></i> Edit Contact</g:link>
				</li>
				<g:if test="${personInstance?.email1 }">
				<li>
						<a href="#" data-toggle="modal" data-target="#emailModal" data-emailAddress="${personInstance.email1}" class="sendEmail" style="text-decoration: none;"><i class="fa fa-paper-plane-o fa-fw"></i> Send Email</a>
				</li>
				</g:if>
				<li><g:link action="#" id="${personInstance.id }" style="text-decoration: none;">
						<i class="fa fa-envelope-o fa-fw"></i> Send Letter</g:link>
				</li>
				
			</ul>

		</div>
						</td>
						<td>${fieldValue(bean: personInstance, field: "salutation")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "initial")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "lastName")}</td>
						
						<td>${fieldValue(bean: personInstance, field: "address")}</td>
					
						<td>
							<g:if test="${personInstance.email1 }">
							<i class="fa fa-fw fa-at"></i> ${personInstance.email1 }
							</g:if>
							<g:if test="${personInstance.phone1 }">
								<g:if test="${personInstance.phone1Type == PhoneType.MOBILE }">
									<i class="fa fa-fw fa-mobile fa-lg"></i>
									${personInstance.phone1 }
								</g:if>
								<g:else>
									<i class="fa fa-fw fa-phone"></i>
									(${personInstance.phone1Type}) ${personInstance.phone1 }
								</g:else>
								 
							</g:if>
						</td>
						<td>
							<!-- //TODO move this to a domain function// -->
							<g:if test="${uk.org.pmms.Property.findAllByOwner(personInstance).size() > 0}">
								<span class="label label-success">Owner</span>
							</g:if>
							<!-- //TODO move this to a domain function// -->
							<g:if test="${uk.org.pmms.Supplier.createCriteria().list{employees{eq('id',personInstance.id)}}.size() > 0}">
								<span class="label label-danger">Supplier</span>
							</g:if>
							<!-- //TODO move this to a domain function// -->
							<g:if test="${uk.org.pmms.Client.createCriteria().list{directors{eq('id',personInstance.id)}}.size() > 0}">
								<span class="label label-info">Director</span>
							</g:if>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			</g:if>
			<g:else>
				<h4 class="text-muted">No Results Found!</h4>
			</g:else>