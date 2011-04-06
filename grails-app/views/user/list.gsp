<head>
	<meta name="layout" content="main" />
	<title>User List</title>
</head>

<body>
	<div class="body">
		<h1>Users</h1>
		<g:ifAllGranted role="ROLE_ADMIN">
		<div class="nav" style="margin-bottom:5px;">
			<span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
		</div>	
		</g:ifAllGranted>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="Id" />
					<g:sortableColumn property="username" title="Login Name" />
					<g:sortableColumn property="userRealName" title="Full Name" />
					<g:sortableColumn property="enabled" title="Enabled" />
					<g:sortableColumn property="description" title="Description" />
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${personList}" status="i" var="person">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${person.id}</td>
					<td>${person.username?.encodeAsHTML()}</td>
					<td>${person.getUserRealName()}</td>
					<td>${person.enabled?.encodeAsHTML()}</td>
					<td>${person.description?.encodeAsHTML()}</td>
					<td>
						<span class="btn-link">
							<g:link action="show" id="${person.id}">Show</g:link>
						</span>
					</td>
				</tr>
			</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${eel.User.count()}" />
		</div>
	</div>
</body>
