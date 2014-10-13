<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.denied.title" /></title>
</head>

<body>
<div class='body'>
	<div class='errors'><g:message code="springSecurity.denied.message" /></div>
	 <sec:ifLoggedIn>
	 	<sec:loggedInUserInfo field="username"/>
	 	<sec:ifAnyGranted roles="ROLE_USER">User Role</sec:ifAnyGranted>
	 	<sec:ifAnyGranted roles="ROLE_ADMIN">Admin Role</sec:ifAnyGranted>
	 </sec:ifLoggedIn>
</div>
</body>
