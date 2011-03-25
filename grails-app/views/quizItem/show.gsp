
<%@ page import="eel.QuizItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quizItem.label', default: 'QuizItem')}" />
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
                            <td valign="top" class="name"><g:message code="quizItem.question.label" default="Question" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: quizItemInstance, field: "question")}</td>
                            
                        </tr>
                        <tr class="prop">
                        	<td valign="top" class="name"><g:message code="quizItem.correctAns.label" default="Correct Ans" /></td>
                        	<td valign="top" class="value">
                        		<g:if test="${quizItemInstance.quizType == eel.QuizType.MULTIPLE}">
                        			<g:each in="${quizItemInstance.quizChoices}" var="choice">
                        				<g:radio disabled="true" name="choices" checked="${(quizItemInstance.correctAns == choice.id.toString())?'checked':''}" />${choice.choice}<br />
                        			</g:each>
                        			
                        			<%--<g:radioGroup disabled="true" name="correctAns" values="${quizItemInstance.quizChoices?.id}" labels="${quizItemInstance.quizChoices?.choice}" value="${quizItemInstance?.correctAns}">
                             			${it.radio} ${it.label} <br />
                             		</g:radioGroup>--%>
                        		</g:if><g:else>${fieldValue(bean: quizItemInstance, field: "correctAns")}</g:else>
                        	</td>
                        </tr>
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="quizItem.quizType.label" default="Quiz Type" /></td>
                            
                            <td valign="top" class="value">${quizItemInstance?.quizType?.name}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            Would you like to use this generated question? If the generated information is incorrect/unusable, please press "Remove Definition"
            <div class="buttons">
            	
                <g:form>
                    <g:hiddenField name="id" value="${quizItemInstance?.id}" />
                    <g:hiddenField name="definitionId" value="${params.definitionId}" />
                    <g:hiddenField name="classQuizId" value="${params.classQuizId}" />
                    <span class="button"><g:actionSubmit action="useItem" value="Yes" /></span>
                    <span class="button"><g:actionSubmit action="delete" value="No" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="removeDefinition" value="Remove Definition" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
