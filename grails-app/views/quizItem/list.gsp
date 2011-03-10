
<%@ page import="eel.QuizItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quizItem.label', default: 'QuizItem')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'quizItem.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="correctAns" title="${message(code: 'quizItem.correctAns.label', default: 'Correct Ans')}" />
                        
                            <g:sortableColumn property="question" title="${message(code: 'quizItem.question.label', default: 'Question')}" />
                        
                            <th><g:message code="quizItem.quiz.label" default="Quiz" /></th>
                        
                            <g:sortableColumn property="quizType" title="${message(code: 'quizItem.quizType.label', default: 'Quiz Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${quizItemInstanceList}" status="i" var="quizItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${quizItemInstance.id}">${fieldValue(bean: quizItemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: quizItemInstance, field: "correctAns")}</td>
                        
                            <td>${fieldValue(bean: quizItemInstance, field: "question")}</td>
                        
                            <td>${fieldValue(bean: quizItemInstance, field: "quiz")}</td>
                        
                            <td>${fieldValue(bean: quizItemInstance, field: "quizType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${quizItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
