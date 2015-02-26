
<%@ page import="uk.org.pmms.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="PMMS">
<g:set var="entityName"
	value="${message(code: 'person.label', default: 'Person')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<r:require modules="wysiwyg" />
</head>
<body>
	<div class="row">
			<div class="col-xs-2">
			<h1 class="page-header">Contacts
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
				<form class="form-inline pull-right" id="personSearchForm" method="post">
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
		<hr/>
	<g:if test="${flash.message}">
		<div class="alert ${flash.status } alert-dismissible col-xs-4 pull-right" role="status">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span>
				<span class="sr-only">Close</span>
			</button>
			${flash.message}
		</div>
	</g:if>
	<div class="row">
		<div class="col-xs-12" id="list-person">
			<g:render template="personList"
				model="personInstanceList: personInstanceList" />
		</div>
	</div>
	<div class="modal fade" id="emailModal" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Send Email</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="${request.contextPath}/person/sendEmail" id="emailForm">
						<div class="form-group">
							<label class="control-label col-xs-2">To:</label>
							<div class="col-xs-10">
								<p class="form-control-static" id="email"></p>
								<input type="hidden" value="" id="emailInput" name="email"/>
							</div>
						</div>
						<div class="form-group required">
							<label class="control-label col-xs-2"><span class="fa fa-asterisk fa-fw text-danger"></span> Subject:</label>
							<div class="col-xs-10">
								<input class="form-control input-sm" id="subject" type="text" required="" name="subject"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-2">Message:</label>
							<div class="col-xs-10">

								<div class="btn-toolbar" data-role="editor-toolbar"
									data-target="#editor">
									<div class="btn-group">
										<a class="btn btn-default btn-sm dropdown-toggle"
											data-toggle="dropdown" title="Font Size"><i
											class="fa fa-fw fa-text-height"></i>&nbsp;<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a data-edit="fontSize 5"><font size="5">Large</font></a></li>
											<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
											<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
										</ul>
									</div>
									<div class="btn-group">
										<a class="btn btn-default btn-sm" data-edit="bold"
											title="Bold (Ctrl/Cmd+B)"><i class="fa fa-fw fa-bold"></i></a>
										<a class="btn btn-default btn-sm" data-edit="italic"
											title="Italic (Ctrl/Cmd+I)"><i class="fa fa-fw fa-italic"></i></a>
										<a class="btn btn-default btn-sm" data-edit="strikethrough"
											title="Strikethrough"><i
											class="fa fa-fw fa-strikethrough"></i></a> <a
											class="btn btn-default btn-sm" data-edit="underline"
											title="Underline (Ctrl/Cmd+U)"><i
											class="fa fa-fw fa-underline"></i></a>
									</div>
									<div class="btn-group">
										<a class="btn btn-default btn-sm"
											data-edit="insertunorderedlist" title="Bullet list"><i
											class="fa fa-fw fa-list-ul"></i></a> <a
											class="btn btn-default btn-sm" data-edit="insertorderedlist"
											title="Number list"><i class="fa fa-fw fa-list-ol"></i></a> <a
											class="btn btn-default btn-sm" data-edit="outdent"
											title="Reduce indent (Shift+Tab)"><i
											class="fa fa-fw fa-dedent"></i></a> <a
											class="btn btn-default btn-sm" data-edit="indent"
											title="Indent (Tab)"><i class="fa fa-fw fa-indent"></i></a>
									</div>
									<div class="btn-group">
										<a class="btn btn-default btn-sm" data-edit="justifyleft"
											title="Align Left (Ctrl/Cmd+L)"><i
											class="fa fa-fw fa-align-left"></i></a> <a
											class="btn btn-default btn-sm" data-edit="justifycenter"
											title="Center (Ctrl/Cmd+E)"><i
											class="fa fa-fw fa-align-center"></i></a> <a
											class="btn btn-default btn-sm" data-edit="justifyright"
											title="Align Right (Ctrl/Cmd+R)"><i
											class="fa fa-fw fa-align-right"></i></a> <a
											class="btn btn-default btn-sm" data-edit="justifyfull"
											title="Justify (Ctrl/Cmd+J)"><i
											class="fa fa-fw fa-align-justify"></i></a>
									</div>
								</div>

								<div id="editor" class="form-control"></div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="submitEmailForm" class="btn btn-primary btn-sm">
						<i class="fa fa-fw fa-paper-plane"></i> Send
					</button>
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal"><i class="fa fa-fw fa-times"></i> Cancel</button>
				</div>
			</div>
		</div>
	</div>
</body>
<g:javascript>
			$("#personSearchForm").submit(function(event){
				$.ajax({
					type: 'POST',
					url: '${request.contextPath}/person/personSearch',
					data: $(this).serialize(),
					success: function(data){
						$("#list-person").html(data);
					}
				});
				event.preventDefault();
			});
			
			$(".sendEmail").on('click',function(){
				$("#emailModal .modal-body #email").html($(this).data('emailaddress'));
				$("#emailModal .modal-body #emailInput").val($(this).data('emailaddress'));
				$('#editor').wysiwyg();
			});
			
			$("#submitEmailForm").on('click',function(){
				$("#emailForm").append("<input type='hidden' name='message' value='"+$('#editor').cleanHtml()+"'/>");
				$("#emailForm").submit();
				//alert('hello');
			});
			
			
	</g:javascript>
</html>
