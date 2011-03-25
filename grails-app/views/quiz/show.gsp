
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
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="quiz.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "id")}</td>
                            
                        </tr>
                    
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
                            			<th>Correct Answer</th>
                            		</tr>
                            		<g:each in="${quizInstance.quizItems}" var="quizItem">
                            			<tr>
                            				<td>${quizItem.question}</td>
                            				<td>${(quizItem.quizType==eel.QuizType.MULTIPLE)?eel.QuizChoice.get(quizItem.correctAns).choice:quizItem.correctAns}</td>
                            				<td><g:link controller="quizItem" action="edit" id="${quizItem.id}" params="${[classQuizId: params.classQuizId]}">Edit</g:link></td>
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
                    <span class="menuButton"><g:link controller="quizItem" action="chooseType" id="${quizInstance.id}" params="${[classQuizId: params.classQuizId]}" class="create">Add Question</g:link>
                    <span class="menuButton"><g:link controller="quizItem" action="chooseGeneratedType" params="${[classQuizId: params.classQuizId]}" id="${quizInstance.id}" class="create">Generate Question</g:link>
                    <span class="button"><g:link class="edit" controller="classQuiz" id="${params.classQuizId}" action="edit" >Edit Details</g:link></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="button"><g:link controller="courseClass" action="show" id="${eel.ClassQuiz.get(params.classQuizId)?.courseClass?.id}">Back to Class Page</g:link></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
