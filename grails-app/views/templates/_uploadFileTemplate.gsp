<div class="modal fade" id="uploadFile" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Upload File</h4>
			</div>
			<g:uploadForm controller="utils" action="uploadDocument" class="form form-horizontal">
				<div class="modal-body">
					<input type="hidden" name="repoFolderId" value="${folder}" />
					<input type="hidden" name="objectId" value="${objectId}" />
					<input type="hidden" name="objectType" value="${objectType }" />
					<div class="form-group required">
						<label class="control-label col-sm-3" for="myFile">Choose a file</label>
						<div class="col-sm-9">
							<input type="file" name="myFile" class="form-control" required/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="description">Description</label>
						<div class="col-sm-9">
							<input type="text" name="description" class="form-control" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="form-group">
						<button type="submit" name="upload" id="upload"
							class="btn btn-sm btn-info">
							<i class="fa fa-upload"></i> Upload
						</button>
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</g:uploadForm>
		</div>
	</div>
</div>