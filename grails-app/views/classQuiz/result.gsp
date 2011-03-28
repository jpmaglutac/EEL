<head>
	<meta name="layout" content="main" />
	<title>Quiz Results</title>
</head>

<body>

	<div class="body">
		<h1>Quiz Results</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<thead>
				<th>Student</th>
				<th>Score</th>
			</thead>
			<tbody>
				<g:each in="${resultInstanceList}" status="i" var="resultInstance">
				<tr class="prop">
					<td valign="top" class="student">${resultInstance.student}</td>
					<td valign="top" class="score">${resultInstance.score}</td>
				</tr>
				</g:each>
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
		</div>
	</div>
</body>
