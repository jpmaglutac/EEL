
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        	<g:if test="${showClass}"><th>Course Class</th></g:if>
                            <th>Name</th>
                            <th>Options</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${quizInstanceList}" status="i" var="quizInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<g:if test="${showClass}"><td>${quizInstance.courseClass}</td></g:if>
                            <td>${quizInstance.quiz.name}</td>
                            <td class="view"><g:link controller="classQuiz" action="startQuiz" id="${quizInstance.id}">Take Quiz</g:link>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
