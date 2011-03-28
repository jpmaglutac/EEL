
<%@ page import="eel.Result" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Quiz Summary</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="result.classQuiz.label" default="Quiz" /></td>
                            
                            <td valign="top" class="value">${resultInstance?.classQuiz?.encodeAsHTML()}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="result.score.label" default="No. of Items" /></td>
                            
                            <td valign="top" class="value">${eel.QuizItem.countByQuiz(resultInstance.classQuiz.quiz)}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="result.score.label" default="Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: resultInstance, field: "score")}</td>
                            
                        </tr>
                    </tbody>
                </table>
                <br />
                <h1>Quiz Details</h1>
                <table>
                    <tbody>
                        <tr>
                        <th>Item No.</th>
                        <th>Quiz Type</th>
                        <th>Score</th>
                        <th>Details</th>
                        </tr>
                        
                        <g:each in="${answerInstances}" var="answer" status="i">
                        <tr class="prop">
                            <td>${i+1}</td>
                            <td>
                                ${answer.quizItem.quizType.name}
                            </td>
                            <td>
                                <g:if test="${answer.answerGiven ==  answer.quizItem.correctAns}">
                                    1
                                </g:if>
                                <g:else>
                                    0                                    
                                </g:else>

                                <%--
                                <g:if test="${answer.quizItem.quizType == eel.QuizType.MULTIPLE}">
                                    ${eel.QuizChoice.get(answer.answerGiven)}
                                </g:if>
                                <g:else>
                                    ${answer.answerGiven}
                                </g:else>
                                --%>
                            </td>
                            <td>
                                View Details
                            </td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
                <g:if test="${resultInstance.lectureRecommendations.size() > 0}">
                    <h1>Lecture Recommendations</h1>
                    <table>
                        <tbody>
                            <tr>
                                <th>Lecture</th>
                                <th>View Lecture</th>
                            </tr>
                            
                            <g:each in="${resultInstance.lectureRecommendations}" var="recommendation">
                            <g:set value="${eel.ClassLecture.findByLectureAndCourseClass(recommendation.lecture, resultInstance.classQuiz.courseClass)}" var="classLecture" />
                            <tr class="prop">
                                <td>${recommendation.lecture}</td>
                                <td><g:link controller="classLecture" action="show" id="${classLecture.id}">View Lecture</g:link></td>
                            </tr>
                            </g:each>
                        </tbody>
                    </table>
                </g:if>
            </div>
        </div>
    </body>
</html>
