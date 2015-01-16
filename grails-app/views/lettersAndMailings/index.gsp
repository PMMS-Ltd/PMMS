<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">

<title>Letters and Mailings</title>
</head>
<body>
<h1 class="page-header">Mail Merge Templates</h1>
	<div class="row">
		<div class="col-lg-4">
			<div class="list-group">
				<g:each in="${templates}" var="template">
					<div class="list-group-item">
						<div class="row">
							<div class="col-xs-8">
								<h4 class="list-group-item-header">
									${template.name}
								</h4>
								<p class="list-group-item-text">
									${template.description}
								</p>
							</div>
							<div class="col-xs-4">
								<button class="btn btn-sm btn-info merge"  data-templateId="${template.id }">
									<i class="fa fa-fw fa-lg fa-pencil"></i> Merge Document
								</button>
							</div>
						</div>
					</div>
				</g:each>
			</div>
		</div>
		<div class="col-lg-4">
			<g:form class="form-horizontal" action="mergeDoc" name="mergeForm">
				
			</g:form>
		</div>
	</div>
	<g:javascript>
		$(".merge").click(function(){
			var templateId = $(this).attr("data-templateId");
			$.ajax({
			    url: "${request.contextPath}/lettersAndMailings/renderForm" ,
			    type: "GET",
			    dataType: "text",
			    data: {templateId: templateId},
			    success: function(data){
			        $("#mergeForm").html(data);
			   }
			})
		})
	</g:javascript>
</body>
</html>
