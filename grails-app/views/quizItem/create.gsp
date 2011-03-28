

<%@ page import="eel.QuizItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quizItem.label', default: 'QuizItem')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        --><div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${quizItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${quizItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="correctAns"><g:message code="quizItem.correctAns.label" default="Correct Ans" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'correctAns', 'errors')}">
                                    <g:textField name="correctAns" value="${quizItemInstance?.correctAns}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="question"><g:message code="quizItem.question.label" default="Question" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'question', 'errors')}">
                                    <g:textField name="question" value="${quizItemInstance?.question}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quiz"><g:message code="quizItem.quiz.label" default="Quiz" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'quiz', 'errors')}">
                                    <g:select name="quiz.id" from="${eel.Quiz.list()}" optionKey="id" value="${quizItemInstance?.quiz?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quizType"><g:message code="quizItem.quizType.label" default="Quiz Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'quizType', 'errors')}">
                                    <g:select name="quizType" from="${eel.QuizType?.values()}" keys="${eel.QuizType?.values()*.name()}" value="${quizItemInstance?.quizType?.name()}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
