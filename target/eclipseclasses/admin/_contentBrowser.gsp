			<h3>
				Files
				<button class="btn btn-info btn-xs" data-toggle="modal"
					data-target="#uploadFile">
					<span class="fa fa-upload"></span> Upload
				</button>
			</h3>
			<g:if test="${files.size() > 0}">
				<table class="table table-condensed table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th>Actions</th>
							<th>Size</th>
							<th>Type</th>
						</tr>
					</thead>
					<tbody>
						<g:each var="file" in="${files}" status="i">
							<div class="modal" id="confirmDelete${i}">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<!-- dialog contents -->
										<div class="modal-body">
											<i class="fa fa-question-circle fa-4x pull-left"
												style="color: #d2322d; border-color: #ac2925;"></i>Are you
											sure you want to delete this item?
										</div>
										<!-- dialog buttons -->
										<div class="modal-footer">
											<g:link action="deleteDocument"
												params="[Id: file.'cmis:objectId', folder: folder.'cmis:objectId']"
												class="btn btn-primary">OK</g:link>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Cancel</button>
										</div>
									</div>
								</div>
							</div>
							<tr>
								<td><a class="btn btn-xs btn-success"
									href="${grailsApplication.config.grails.opencmis.alfresco.atomurl}/content/?id=${file.'cmis:objectId' }">
										<i class="fa fa-download"></i>
								</a> ${file.'cmis:name' }</td>
								<td><a class="btn btn-xs btn-default" href="#"> <i
										class="fa fa-pencil fa-lg"></i>
								</a>
									<button class="btn btn-xs btn-danger" data-toggle="modal"
										data-target="#confirmDelete${i}">
										<i class="fa fa-trash-o fa-lg"></i>
									</button></td>
								<td>
									${file.'cmis:contentStreamLength' }
								</td>
								<td
									style="max-width: 150px; text-overflow: ellipsis; overflow: hidden;">
									${file.'cmis:contentStreamMimeType' }
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>
			<g:else>
				<h4>No Files to display</h4>
			</g:else>