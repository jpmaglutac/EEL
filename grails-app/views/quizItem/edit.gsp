

<%@ page import="eel.QuizItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quizItem.label', default: 'QuizItem')}" />
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
            <g:hasErrors bean="${quizItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${quizItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${quizItemInstance?.id}" />
                <g:hiddenField name="version" value="${quizItemInstance?.version}" />
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
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="question"><g:message code="quizItem.correctAns.label" default="Correct Answer" /></label>
                                </td>
                            	<g:if test="${quizItemInstance.quizType==eel.QuizType.IDENTIFICATION}">
		                        	<td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'correctAns', 'errors')}">
                                    	<g:textField name="correctAns" value="${quizItemInstance?.correctAns}" />
                                	</td>	
		                        </g:if><g:elseif test="${quizItemInstance.quizType==eel.QuizType.TRUEORFALSE}">
		                        	<td valign="top" class="value ${hasErrors(bean: quizItemInstance, field: 'correctAns', 'errors')}">
                                    	<g:radioGroup name="correctAns" values="['True', 'False']" labels="['True', 'False']" value="${(quizItemInstance?.correctAns)?:'True'}">
                                    		${it.radio} ${it.label}<br />
                                    	</g:radioGroup>
                                	</td>
		                        </g:elseif>                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <g:hiddenField name="classQuizId" value="${classQuizId?:params.classQuizId}" />
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="back"><g:link controller="quiz" action="show" id="${eel.Quiz.get(params.quizId)?.courseClass?.id}">Back to Quiz Page</g:link></span>
                    <span class="back"><g:link controller="classQuiz" action="listAllByUser" id="${eel.ClassQuiz.get(params.classQuizId)?.courseClass?.id}">Back to Quiz Page</g:link></span>
					
					
                </div>
            </g:form>
        </div>
    </body>
</html>
