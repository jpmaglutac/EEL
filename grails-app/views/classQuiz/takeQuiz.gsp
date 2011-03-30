
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body onLoad="setTimeout('document.forms[\'quiz\'].submit()', ${timeRemaining});">
        <div class="body">
            ${timeRemaining}
            <h1>${classQuiz.toString()}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form id="quiz" onSubmit="return confirm('Are you sure you want to finish this quiz?');">
            	<div class="dialog">
                	<g:each in="${items}" var="${item}" status="i">
                		<b>${i+1}. ${item.quizItem}</b><br />
                		<g:if test="${item.quizItem.quizType == eel.QuizType.IDENTIFICATION}">
                		 	<g:textField name="${item.id}_answerGiven" value="${item.answerGiven}" />
                		</g:if><g:elseif test="${item.quizItem.quizType == eel.QuizType.TRUEORFALSE}">
                			<g:radioGroup name="${item.id}_answerGiven" values="['True', 'False']" labels="['True', 'False']" value="${item.answerGiven}">
                        		${it.radio} ${it.label}<br />
                        	</g:radioGroup>
                		</g:elseif><g:elseif test="${item.quizItem.quizType == eel.QuizType.MULTIPLE}">
                			<g:radioGroup name="${item.id}_answerGiven" values="${item.quizItem.quizChoices?.id}" labels="${item.quizItem.quizChoices?.choice}" value="${item.answerGiven}">
                        		${it.radio} ${it.label}<br />
                        	</g:radioGroup>
                		</g:elseif>
                		<br /><br />
                	</g:each>
            	</div>
            	<div class="buttons">
            		<g:hiddenField name="classQuizId" value="${classQuiz.id}" />
                    <span class="button"><g:actionSubmit action="submitQuiz" value="Submit Quiz" /></span>
            	</div>
            </g:form>
        </div>
    </body>
</html>
