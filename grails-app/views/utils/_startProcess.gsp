<html>
<head>
	<r:require modules="application,jquery"/>
	<r:layoutResources/>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-xs-6" id="startForm">

</div>
</div>
<g:if test="${startForm != null}">
	<div class="row">
		<button class="btn btn-success btn-sm" id="submitBtn"><i class="fa fa-fw fa-play"></i> Start</button>
	</div>
</g:if>
</div>
<g:javascript>
if (${startForm != null}){
	var request = new XMLHttpRequest();
request.open('GET', '${startForm}', false);
request.send(null);

$("#startForm").html(request.response);
}else{
	$("#startForm").html("<h2>No Form Found</h2>");
}

$("#submitBtn").on('click',function(){
	var formData = {};
	$("input").each(function(index){
		formData[$(this).attr('cam-variable-name')] = {"type": $(this).attr('cam-variable-type'), "value":$(this).val()};
	});
	var output = {};
	output["variables"] = formData;
	
$.ajax({
	type: 'POST',
	url: '${postUrl}',
	data: JSON.stringify(output),
	dataType: 'JSON',
	contentType: 'application/json',
	success: function(data){
		//$("#list-person").html(data);
		//window.location('${request.contextPath }/utils/processes');
		alert("Success! : " + data);
	}
});



/*var request = new XMLHttpRequest();
request.open('POST', '${postUrl}', false);
request.setRequestHeader('Content-Type', 'application/json');
request.send(JSON.stringify(output));


});*/
</g:javascript>
<r:layoutResources/>
</body>



</html>



