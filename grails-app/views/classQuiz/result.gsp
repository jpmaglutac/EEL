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
					<g:set var="size" value="${resultInstance.classQuiz.quiz.quizItems.size()}" />
					<td valign="top" class="score"><g:link controller="result" action="show" id="${resultInstance.id}">${(size==0)?100:(resultInstance.score/size)*100}%</g:link></td>
				</tr>
				</g:each>
			</tbody>
			</table>
			<g:if test="${lectureRecommendations.size() > 0}">
                <h1>Lecture Recommendations</h1>
                <table>
                    <tbody>
                        <tr>
                            <th>Lecture</th>
                            <th>View Lecture</th>
                        </tr>
                        <g:each in="${lectureRecommendations}" var="recommendation">
                        <g:set value="${eel.ClassLecture.findByLectureAndCourseClass(recommendation, classQuiz.courseClass)}" var="classLecture" />
                        <tr class="prop">
                            <td>${recommendation}</td>
                            <td><g:link controller="classLecture" action="show" id="${classLecture.id}">View Lecture</g:link></td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
            </g:if>
		</div>
		<div class="buttons">
			<span class="button"><g:link controller="courseClass" action="show" id="${classQuiz?.courseClass?.id}">Back to Class Page</g:link></span>
		</div>
	</div>
</body>
