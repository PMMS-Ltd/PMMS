
<%@ page import="uk.org.pmms.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		
		
			<h1 class="page-header">Clients
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
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
		<div class="col-lg-6">
			
			<form class="form-inline" id="clientSearchForm" method="post" action="${request.contextPath}/client/clientSearch">
				<div class="form-group">
					<input type="text" class="form-control" id="contactSearch"
						placeholder="Search..." size="85" name="search"/>
				</div>
				<div class="form-group">
					<button class="btn btn-default">
						<i class="fa fa-fw fa-search"></i> Search
					</button>
				</div>
				</form>
			
		</div>
	</div>
	<div class="row">
			<div class="col-lg-10" id="list-client">
			<g:render template="clientList" model="['clientInstanceList': clientInstanceList]"/>
		</div>
	</div>
	</body>
	<g:javascript>
			$("#clientSearchForm").submit(function(event){
				$.ajax({
					type: 'POST',
					url: '${request.contextPath}/client/clientSearch',
					data: $(this).serialize(),
					success: function(data){
						$("#list-client").html(data);
					}
				});
				event.preventDefault();
			});
	</g:javascript>
</html>
