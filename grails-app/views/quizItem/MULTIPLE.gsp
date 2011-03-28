

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
            <g:form action="saveMULTIPLE" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="question"><g:message code="quizItem.question.label" default="Question" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'question', 'errors')}">
                                    <g:textArea name="question" value="${quizItemInstance?.question}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                	<g:hiddenField name="quizId" value="${params.id}" />
                	<g:hiddenField name="classQuizId" value="${params.classQuizId}" />
                    <span class="button"><g:submitButton name="create" class="save" value="Add Choices" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
