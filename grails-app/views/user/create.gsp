<head>
	<meta name="layout" content="main" />
	<title>Create User</title>
</head>

<body>
	<div class="body">
		<h1>Create User</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>
		<g:form action="save">
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
							<g:checkBox name="enabled" value="${person.enabled}" ></g:checkBox>
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
							<input type="text" id="email" name="email" value="${person.email?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="emailShow">Show Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'emailShow','errors')}">
							<g:checkBox name="emailShow" value="${person.emailShow}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name" align="left">Assign Roles:</td>
					<td>
					<ul>
					<g:radioGroup name="selectedAuthority" values="${authorityList.authority}" labels="${authorityList.description}" value="${authority}">
					<li>${it.radio} ${it.label}</li>
					
					</g:radioGroup>
					</ul>
					</td>
					</tr>
				</tbody>
				</table>
			</div>
		<g:ifAllGranted role="ROLE_ADMIN">
			<div class="buttons">
				<span class="button"><input class="save" type="submit" value="Create" /></span>
				<span class="back"><g:link class="list" action="list">Back to User List</g:link></span>
			</div>
		</g:ifAllGranted>

		</g:form>

	</div>

</body>
