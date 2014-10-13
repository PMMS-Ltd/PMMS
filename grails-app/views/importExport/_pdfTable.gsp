<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<r:require modules="jquery, application" />
<r:layoutResources />
</head>
<body>

<rendering:inlinePng bytes="${logo}" style="width:100%;"/>

<h3 class="page-header">${sheetName }</h3>

<table class="table table-striped">
	<thead>
		<tr>
			<g:each in="${headers }">
				<th>${it}</th>
			</g:each>
		</tr>
	</thead>
	<tbody>
		<g:each in="${data}" var="row">
			<tr>
				<g:each in="${row }" var="cell">
					<g:if test="${cell.contains('£') }">
						<td><g:formatNumber number="${cell.substring(1).toDouble() }" type="currency" currencyCode="GBP" currencySymbol="£"/></td>
					</g:if>
					<g:else>
						<td>${cell}</td>
					</g:else>
				</g:each>
			</tr>
		</g:each>
	</tbody>
</table>
<r:layoutResources />
</body>
</html>



