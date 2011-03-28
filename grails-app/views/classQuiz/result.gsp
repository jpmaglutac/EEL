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
					<td valign="top" class="score">${(resultInstance.score/resultInstance.classQuiz.quiz.quizItems.size())*100}%</td>
				</tr>
				</g:each>
			</tbody>
			</table>
		</div>
		<div class="buttons">
			<span class="button"><g:link controller="courseClass" action="show" id="${classQuiz?.courseClass?.id}">Back to Class Page</g:link></span>
		</div>
	</div>
</body>
