<div class="small-box ${boxclass} text-center">
	<div class="small-box-inner">
		<h3>${value }</h3>
		<p>${name }</p>
	</div>
	<div class="icon">
		<i class="fa ${icon }"></i>
	</div>
	<g:if test="${link}">
		<a href="${request.contextPath }${link}${id}" class="small-box-footer">More info <i
		class="fa fa-arrow-circle-right fa-fw"></i></a>
	</g:if>
	<g:else>
		<g:link controller="${controller }" action="${action }" class="small-box-footer">More <i
		class="fa fa-arrow-circle-right fa-fw"></i></g:link>
	</g:else>
	
</div>