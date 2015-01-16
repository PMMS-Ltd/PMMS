<html>
<head>
	<r:require modules="application,jquery"/>
	<r:layoutResources/>
</head>
<body>
<div class="col-xs-6">
<h3 class="page-header">Process: ${instanceList[0].definitionId }</h3>
<table class="table">
<tr>
	<th>Instance ID</th>
	<th>Business Key</th>
	<th>Ended</th>
	<th>Suspended</th>
	<th></th>
</tr>
<g:each in="${instanceList}">
	<tr>
		<td>${it.id }</td>
		<td>${it.businessKey }</td>
		<td>${it.ended }</td>
		<td>${it.suspended }</td>
		<!-- <td><g:link class="btn btn-sm btn-danger" action="startProcess" id="${it.id }">Start Process</g:link> <g:link class="btn btn-sm btn-default" action="showProcessInstances" id="${it.id }">View Instances</g:link></td>-->
	</tr>
</g:each>
</table>
</div>
<r:layoutResources/>
</body>



</html>



