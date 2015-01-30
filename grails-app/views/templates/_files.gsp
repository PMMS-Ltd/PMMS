<g:if test="${files.size() > 0}">
	<table class="table table-bordered table-striped" style="margin-top: 15px;">
		<thead>
			<tr>
				<th>Name</th>
				<th>Description</th>
				<th>Size</th>
				<th>Type</th>
				<th class="text-center">Actions</th>
			</tr>
		</thead>
		<tbody>
			<g:each var="file" in="${files}" status="i">
				<div class="modal" id="confirmDelete${i}">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<!-- dialog contents -->
							<div class="modal-body">
								<i class="fa fa-exclamation-triangle fa-4x pull-left text-warning"
									></i>Are you sure
								you want to delete this item?
							</div>
							<!-- dialog buttons -->
							<div class="modal-footer">
								<g:link controller="utils" action="deleteDocument" class="btn btn-danger btn-sm" params="[Id: file.objectId, objectType: objectType, objectId: objectId]"><i class="fa fa-fw fa-trash-o"></i> Delete</g:link>
								<button type="button" class="btn btn-default btn-sm"
									data-dismiss="modal"><i class="fa fa-fw fa-times"></i> Cancel</button>
							</div>
						</div>
					</div>
				</div>
				<tr>
					<td> ${file.name}</td>
					<td> ${file.description}</td>
					<td class="col-xs-1">
						<g:formatNumber number="${file.contentStreamLength/1000}" format="###,### Kb"/>
					</td>
					<td
						style="text-overflow: ellipsis; overflow: hidden;" class="col-xs-2">
						${file.contentStreamMimeType}
					</td>
					<td class="col-xs-2 text-center">
					<g:link controller="utils" action="downloadDocument"
							params="[documentId : file.objectId]"
							class="btn btn-xs btn-success">
							<i class="fa fa-fw fa-download"></i>
						</g:link>
					<!-- <a class="btn btn-xs btn-default" href="#"> <i
							class="fa fa-pencil fa-lg"></i>
					</a>-->
						<button class="btn btn-xs btn-danger" data-toggle="modal"
							data-target="#confirmDelete${i}">
							<i class="fa fa-trash-o fa-lg"></i>
						</button></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<g:else>
	<h4>No Files to display</h4>
</g:else>
<button class="btn btn-info btn-xs" data-toggle="modal"
		data-target="#uploadFile">
		<span class="fa fa-upload"></span> Upload
	</button>