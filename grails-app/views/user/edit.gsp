<head>
	<meta name="layout" content="main" />
	<title>Edit User</title>
</head>

<body>
	<div class="body">
		<h1>Edit User</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>

		<div class="prop">
			<span class="name">ID:</span>
			<span class="value">${person.id}</span>
		</div>

		<g:form>
			<input type="hidden" name="id" value="${person.id}" />
			<input type="hidden" name="version" value="${person.version}" />
			<div class="dialog">
				<table>
				<tbody>

					<tr class="prop">
						<td valign="top" class="name"><label for="username">Login Name:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'username','errors')}">
							<input type="text" id="username" name="username" value="${person.username?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="userFirstName">First Name:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'userFirstName','errors')}">
							<input type="text" id="userFirstName" name="userFirstName" value="${person.userFirstName?.encodeAsHTML()}"/>
						</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><label for="userLastName">Last Name:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'userLastName','errors')}">
							<input type="text" id="userLastName" name="userLastName" value="${person.userLastName?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="passwd">Password:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'passwd','errors')}">
							<input type="password" id="passwd" name="passwd" value="${person.passwd?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="enabled">Enabled:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'enabled','errors')}">
							<g:checkBox name="enabled" value="${person.enabled}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="description">Description:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'description','errors')}">
							<input type="text" id="description" name="description" value="${person.description?.encodeAsHTML()}"/>
						</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><label for="courseOrDepartment">Course/Department:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'courseOrDepartment','errors')}">
							<input type="text" id="courseOrDepartment" name="courseOrDepartment" value="${person.courseOrDepartment?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="email">Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
							<input type="text" id="email" name="email" value="${person?.email?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="emailShow">Show Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'emailShow','errors')}">
							<g:checkBox name="emailShow" value="${person.emailShow}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="authorities">Roles:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'authorities','errors')}">
							<ul>
							<g:radioGroup name="selectedAuthority" values="${roleMap}">
								<li>${it.key.authority.encodeAsHTML()} ${it.radio}</li>
							</g:radioGroup>
							</ul>
						</td>
					</tr>

				</tbody>
				</table>
			</div>
			<g:ifAllGranted role="ROLE_ADMIN">
			<div class="buttons">
				<span class="button"><g:actionSubmit class="save" value="Update" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
				<span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
				<span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
			</div>
			</g:ifAllGranted>
		</g:form>
	</div>
</body>
