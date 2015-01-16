<html>
<head>
	<r:require modules="application,jquery"/>
	<r:layoutResources/>
</head>
<body>
<div class="col-xs-6">
<table class="table">
<tr>
	<th>Process Name</th>
	<th>Category</th>
	<th></th>
</tr>
<g:each in="${processes}">
	<tr>
		<td>${it.name }</td>
		<td>${it.category }</td>
		<td><g:link class="btn btn-sm btn-danger" action="startProcess" id="${it.id }">Start Process</g:link> <g:link class="btn btn-sm btn-default" action="showProcessInstances" id="${it.id }">View Instances</g:link></td>
	</tr>
</g:each>
</table>
</div>
<r:layoutResources/>
</body>



</html>



