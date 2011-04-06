<head>
	<meta name="layout" content="main" />
	<title>Show User</title>
</head>

<body>

	<div class="body">
		<g:if test="${isUser}">
		<h1>My Profile</h1>
		</g:if>
		<g:else>
		<h1>View Profile</h1>
		</g:else>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<tbody>

				<tr class="prop">
					<td valign="top" class="name">Login Name:</td>
					<td valign="top" class="value">${person.username?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">First Name:</td>
					<td valign="top" class="value">${person.userFirstName?.encodeAsHTML()}</td>
				</tr>
				
				<tr class="prop">
					<td valign="top" class="name">Last Name:</td>
					<td valign="top" class="value">${person.userLastName?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name">Description:</td>
					<td valign="top" class="value">${person.description?.encodeAsHTML()}</td>
				</tr>
				
				<tr class="prop">
					<td valign="top" class="name">Course/Department:</td>
					<td valign="top" class="value">${person.courseOrDepartment?.encodeAsHTML()}</td>
				</tr>
				
				<g:if test="${person.emailShow||isUser}">
				    <tr class="prop">
					    <td valign="top" class="name">Email:</td>
					    <td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
				    </tr>
				</g:if>

			</tbody>
			</table>
		</div>
		<div class="buttons">
		    <g:if test="${isUser}">
			    <g:form>
				    <input type="hidden" name="id" value="${person.id}" />
				    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
				</g:form>
			</g:if>
			<span class="back"> <a href="javascript:history.back()">Back</a></span>
		</div>
	</div>
</body>
