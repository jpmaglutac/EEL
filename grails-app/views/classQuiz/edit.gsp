

<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${quizInstance}">
            <div class="errors">
                <g:renderErrors bean="${quizInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="update" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="quiz.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${quizInstance?.name}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="quiz.timeAllotted.label" default="Time Alloted" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: quizInstance, field: 'timeAllotted', 'errors')}">
                                	<g:set var="hours" value="${Math.floor(quizInstance.timeAllotted/1000/60/60).toInteger()}" />
                                    Hours:<g:select name="timeAllottedHours" from="${0..10}" value="${hours}" /><br />
                                    Minutes:<g:select name="timeAllottedMins" from="${0..60}" value="${(quizInstance.timeAllotted/1000/60)-(hours*60)}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="classQuiz.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classQuizInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" value="${classQuizInstance?.startDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="classQuiz.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classQuizInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" value="${classQuizInstance?.endDate}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                	<g:hiddenField name="classQuizId" value="${params.id}" />
                    <span class="button"><g:submitButton name="update" class="save" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
					<span class="back"><g:link class="list" action="listAllByUser">Back to Quiz List</g:link></span>					
                </div>
            </g:form>
            
        </div>
    </body>
</html>
