
<%@ page import="uk.org.pmms.accounts.ServiceChargeType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'serviceChargeType.label', default: 'ServiceChargeType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-xs-6">
			<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" />
				<div class="btn-group">
  <a href="#" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </a>
  
  <ul class="dropdown-menu" role="menu">
  
    <sec:ifAnyGranted roles="ROLE_ADMIN">
    <li>
    <g:link action="create"><i class="fa fa-plus fa-fw text-success"></i> Add New</g:link>	
    </li>
    </sec:ifAnyGranted>
  </ul>

</div>
</h1>
			</div>
			
			<div class="col-xs-6" style="margin-top: 45px;">
				<form class="form-inline pull-right" id="clientSearchForm" method="post" action="/serviceChargeType/search">
				<div class="form-group">
					<div class="input-group">
					<input type="text" class="form-control" id="serviceChargeTypeSearch"
						placeholder="Search..." size="85" name="search"/>
						<span class="input-group-btn">
							<button class="btn btn-danger"><i class="fa fa-fw fa-search"></i></button>
						</span>
					</div>
				</div>
			</form>
			</div>
		</div>
		<hr />
			<table class="table table-bordered">
			<thead>
					<tr>
						<th></th>
					
						<g:sortableColumn property="annually" title="${message(code: 'serviceChargeType.annually.label', default: 'Annually')}" />
					
						<th><g:message code="serviceChargeType.client.label" default="Client" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'serviceChargeType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="halfYearly" title="${message(code: 'serviceChargeType.halfYearly.label', default: 'Half Yearly')}" />
					
						<g:sortableColumn property="monthly" title="${message(code: 'serviceChargeType.monthly.label', default: 'Monthly')}" />
					
						<g:sortableColumn property="quarterly" title="${message(code: 'serviceChargeType.quarterly.label', default: 'Quarterly')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceChargeTypeInstanceList}" status="i" var="serviceChargeTypeInstance">
					<tr>
						<td><g:link class="btn btn-primary btn-sm" action="show" id="${serviceChargeTypeInstance.id}"><i class="fa fa-fw fa-eye-o"></i> View</g:link></td>
					
						<td>${fieldValue(bean: serviceChargeTypeInstance, field: "annually")}</td>
					
						<td>${fieldValue(bean: serviceChargeTypeInstance, field: "client")}</td>
					
						<td>${fieldValue(bean: serviceChargeTypeInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${serviceChargeTypeInstance.halfYearly}" /></td>
					
						<td><g:formatBoolean boolean="${serviceChargeTypeInstance.monthly}" /></td>
					
						<td><g:formatBoolean boolean="${serviceChargeTypeInstance.quarterly}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceChargeTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
