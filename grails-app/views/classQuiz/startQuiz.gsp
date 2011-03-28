
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        --><div class="body">
            <h1>Start Quiz</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                Click the button to start the quiz.
                
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
