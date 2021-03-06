

<%@ page import="eel.Result" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        --><div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${resultInstance}">
            <div class="errors">
                <g:renderErrors bean="${resultInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${resultInstance?.id}" />
                <g:hiddenField name="version" value="${resultInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="studentAnswers"><g:message code="result.studentAnswers.label" default="Student Answers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: resultInstance, field: 'studentAnswers', 'errors')}">
                                    
<ul>
<g:each in="${resultInstance?.studentAnswers?}" var="s">
    <li><g:link controller="studentAnswer" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="studentAnswer" action="create" params="['result.id': resultInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
