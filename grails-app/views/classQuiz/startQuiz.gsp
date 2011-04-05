
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Start Quiz: ${quiz.quiz}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <g:set var="inputHours" value="${Math.floor(quiz.quiz.timeAllotted/1000/60/60).toInteger()}" />
        <g:set var="inputMinutes" value="${Math.floor((quiz.quiz.timeAllotted/1000/60)-(inputHours*60)).toInteger()}" />
                This quiz is open from ${quiz.startDate.getDateTimeString()} to ${quiz.endDate.getDateTimeString()}.
                <br /><br />
                You are allowed to take this quiz for a total of ${inputHours} hours and ${inputMinutes} minutes.
                <br /> <br />
                Click "Start Quiz" to start the quiz.
                
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${quiz?.id}" />
                    <span class="button"><g:actionSubmit action="initializeQuiz" value="Start Quiz" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
