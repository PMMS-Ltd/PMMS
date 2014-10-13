
<%@ page import="uk.org.pmms.Supplier"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'supplier.label', default: 'supplier')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<h1 class="page-header">
		Suppliers
		<div class="btn-group">
			<a href="#" class="btn btn-xs btn-default dropdown-toggle"
				data-toggle="dropdown"> <span class="caret"></span> <span
				class="sr-only">Toggle Dropdown</span>
			</a>

			<ul class="dropdown-menu" role="menu">

				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link action="create">
							<i class="fa fa-plus fa-fw text-success"></i> Add New</g:link></li>
				</sec:ifAnyGranted>
			</ul>

		</div>
	</h1>
	<div class="row">
		<div class="col-lg-6">
			<form id="supplierSearchForm" class="form-inline" method="post">
				<div class="form-group">
					<input type="text" class="form-control" id="contactSearch"
						placeholder="Search..." size="85" name="search"/>
				</div>
				<div class="form-group">
					<button class="btn btn-default" update="list-supplier">
						<i class="fa fa-fw fa-search"></i> Search
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12" id="list-supplier">
			<g:render template="supplierList" model="supplierInstanceList: supplierInstanceList"/>
		</div>
	</div>

</body>
<g:javascript>
			$("#supplierSearchForm").submit(function(event){
				$.ajax({
					type: 'POST',
					url: '${request.contextPath}/supplier/supplierSearch',
					data: $(this).serialize(),
					success: function(data){
						$("#list-supplier").html(data);
					}
				});
				event.preventDefault();
			});
	</g:javascript>
</html>
