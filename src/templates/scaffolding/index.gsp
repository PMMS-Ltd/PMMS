<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-xs-2">
			<h1 class="page-header"><g:message code="default.list.label" args="[entityName]" />
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
				<form class="form-inline pull-right" id="clientSearchForm" method="post" action="/${domainClass.propertyName }/search">
				<div class="form-group">
					<div class="input-group">
					<input type="text" class="form-control" id="${domainClass.propertyName }Search"
						placeholder="Search..." size="85" name="search"/>
						<span class="input-group-btn">
							<button class="btn btn-danger"><i class="fa fa-fw fa-search"></i></button>
						</span>
					</div>
				</div>
			</form>
			</div>
		</div>
		<hr />
		<!-- <a href="#list-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-${domainClass.propertyName}" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="\${flash.message}">
				<div class="message" role="status">\${flash.message}</div>
			</g:if>-->
			<table class="table table-bordered">
			<thead>
					<tr>
						<th></th>
					<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
					<%  }   }   } %>
					</tr>
				</thead>
				<tbody>
				<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
					<tr>
						<td><g:link class="btn btn-primary btn-sm" action="show" id="\${${propertyName}.id}"><i class="fa fa-fw fa-eye-o"></i> View</g:link></td>
					<%  props.eachWithIndex { p, i ->
							if (i == 0) { %>
						<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
					<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
						<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
					<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
					<%          } else { %>
						<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
					<%  }   }   } %>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="\${${propertyName}Count ?: 0}" />
			</div>
		</div>
	</body>
</html>
