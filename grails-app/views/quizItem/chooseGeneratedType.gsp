

<%@ page import="eel.QuizItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quizItem.label', default: 'QuizItem')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Choose Quiz Type</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${quizItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${quizItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="generateType" >
                <div class="dialog">
                    <table>
                        <tbody>
                                                                           
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quizType"><g:message code="quizItem.quizType.label" default="Quiz Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'quizType', 'errors')}">
                                    <g:radioGroup name="quizType" values="${eel.QuizType.values()}" labels="${eel.QuizType.values()*.name}" value="${eel.QuizType.values()[0]}">
                                    	${it.radio} ${it.label}<br />
                                    </g:radioGroup>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quizType">Lecture</label>
                                </td>
                                <td valign="top">
                                	<g:select name="lectureId" optionKey="id" from="${lectures}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                	<g:hiddenField name="id" value="${params.id}" />
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
