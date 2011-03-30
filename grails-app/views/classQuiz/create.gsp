

<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
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
            <g:hasErrors bean="${quizInstance}">
            <div class="errors">
                <g:renderErrors bean="${quizInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:hasErrors bean="${classQuizInstance}">
            <div class="errors">
                <g:renderErrors bean="${classQuizInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                                    <g:set var="timeAllotted" value="${(quizInstance?.timeAllotted)?new Date(quizInstance?.timeAllotted):null}" />
                                    Hours:<g:select name="timeAllottedHours" from="${0..10}" value="${timeAllotted?.getHours()}" /><br />
                                    Minutes:<g:select name="timeAllottedMins" from="${0..60}" value="${timeAllotted?.getMinutes()}" />
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
                	<g:hiddenField name="courseClassId" value="${courseClassId?:params.id}" />
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
            
            <g:form action="checkQuiz" >
            	<h1>Add quizzes from your other classes</h1>
            	<div class="dialog">
            		<table>
            			<tbody>
            				<tr class="prop">
            					<td valign="top" class="name">Quiz:</td>
            					<td valign="top"><g:select name="quizId" optionKey="id" from="${quizzes}" /></td>
            				</tr>
            			</tbody>
            		</table>
            	</div>
            	<g:hiddenField name="courseClassId" value="${courseClassId?:params.id}" />
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
