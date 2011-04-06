
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		<div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                                
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="quiz.instructor.label" default="Instructor" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${quizInstance?.instructor?.id}">${quizInstance?.instructor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="quiz.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "name")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Quiz Items</td>
                            
                            <td valign="top" class="value">
                            	<table>
                            		<tr>
                            			<th>Question</th>
                            			<th style="width:140px;">Correct Answer</th>
                            			<th>Action</th>
                            		</tr>
                            		<g:each in="${quizInstance.quizItems}" var="quizItem" status="i">
                            			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            				<td>${quizItem.question}</td>
                            				<td>${(quizItem.quizType==eel.QuizType.MULTIPLE)?eel.QuizChoice.get(quizItem.correctAns).choice:quizItem.correctAns}</td>
                            				<td><span class="btn-link"><g:link controller="quizItem" action="edit" id="${quizItem.id}" params="${[classQuizId: params.classQuizId]}">Edit</g:link></span></td>
                            			</tr>
                            		</g:each>
                            	</table>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${quizInstance?.id}" />
                    <g:hiddenField name="classQuizId" value="${params.classQuizId}" />
                    <span class="btn-link1" style="border:0px;"><g:link controller="quizItem" action="chooseType" id="${quizInstance.id}" params="${[classQuizId: params.classQuizId]}" class="create">Add Question</g:link>
                    <span class="menuButton"><g:link controller="quizItem" action="chooseGeneratedType" params="${[classQuizId: params.classQuizId]}" id="${quizInstance.id}" class="create">Generate Question</g:link>
                    <span class="menuButton"><g:link class="edit" controller="classQuiz" id="${params.classQuizId}" action="edit" >Edit Details</g:link></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="back" style="border:0px;"><g:link controller="classQuiz" action="listAllByUser" id="${eel.ClassQuiz.get(params.classQuizId)?.courseClass?.id}">Back to Quiz Page</g:link></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
