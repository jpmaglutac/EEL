

<%@ page import="eel.Result" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
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
            <g:hasErrors bean="${resultInstance}">
            <div class="errors">
                <g:renderErrors bean="${resultInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="classQuiz"><g:message code="result.classQuiz.label" default="Class Quiz" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: resultInstance, field: 'classQuiz', 'errors')}">
                                    <g:select name="classQuiz.id" from="${eel.ClassQuiz.list()}" optionKey="id" value="${resultInstance?.classQuiz?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="score"><g:message code="result.score.label" default="Score" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: resultInstance, field: 'score', 'errors')}">
                                    <g:textField name="score" value="${fieldValue(bean: resultInstance, field: 'score')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="student"><g:message code="result.student.label" default="Student" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: resultInstance, field: 'student', 'errors')}">
                                    <g:select name="student.id" from="${eel.User.list()}" optionKey="id" value="${resultInstance?.student?.id}"  />
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
