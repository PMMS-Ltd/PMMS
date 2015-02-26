
<%@ page import="uk.org.pmms.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-xs-2">
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
			</div>
			
			<div class="col-xs-10" style="margin-top: 45px;">
				<form class="form-inline pull-right" id="clientSearchForm" method="post" action="${request.contextPath}/client/clientSearch">
				<div class="form-group">
					<div class="input-group">
					<input type="text" class="form-control" id="contactSearch"
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
		
		
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			
			
		
	<div class="row">
		<div class="col-lg-12" id="list-client">
			<g:render template="clientList" model="['clientInstanceList': clientInstanceList]"/>
		</div>
	</div>
	<filterpane:filterPane domain="uk.org.pmms.Client" />
	<filterpane:filterButton text="Whatever You Wish" />
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
