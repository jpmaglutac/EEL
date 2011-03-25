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

		<g:form>
			<input type="hidden" name="id" value="${person.id}" />
			<input type="hidden" name="version" value="${person.version}" />
			<div class="dialog">
				<table>
				<tbody>

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
						<td valign="top" class="name"><label for="passwd">Current Password:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'passwd','errors')}">
							<input type="password" id="oldpassword" name="oldpassword"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="passwd">Password:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'passwd','errors')}">
							<input type="password" id="password" name="password"/>
						</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><label for="passwd">Retype Password:</label></td>
						<td valign="top">
							<input type="password" id="repassword" name="repassword"/>
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

				</tbody>
				</table>
			</div>

			<div class="buttons">
				<span class="button"><g:actionSubmit class="save" value="Update" /></span>
			</div>

		</g:form>

	</div>
</body>
