
<%@ page import="eel.Result" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>
            <%--<g:message code="default.show.label" args="[entityName]" />--%>
            Quiz Summary
            </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="result.classQuiz.label" default="Quiz" /></td>
                            
                            <td valign="top" class="value">${resultInstance?.classQuiz?.encodeAsHTML()}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="result.score.label" default="No. of Items" /></td>
                            
                            <td valign="top" class="value">${eel.QuizItem.countByQuiz(resultInstance.classQuiz.quiz)}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="result.score.label" default="Score" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: resultInstance, field: "score")}</td>
                            
                        </tr>
                    </tbody>
                </table>
                <br />
                <h1>Quiz Details</h1>
                <table>
                    <tbody>
                        <tr>
                        <th>Item No.</th>
                        <th>Quiz Type</th>
                        <th>Score</th>
                        <th>Details</th>
                        </tr>
                        
                        <g:each in="${answerInstances}" var="answer" status="i">
                        <tr class="prop">
                            <td>${i+1}</td>
                            <td>
                                ${answer.quizItem.quizType.name}
                            </td>
                            <td>
                                <g:if test="${answer.answerGiven ==  answer.quizItem.correctAns}">
                                    1
                                </g:if>
                                <g:else>
                                    0                                    
                                </g:else>

                                <%--
                                <g:if test="${answer.quizItem.quizType == eel.QuizType.MULTIPLE}">
                                    ${eel.QuizChoice.get(answer.answerGiven)}
                                </g:if>
                                <g:else>
                                    ${answer.answerGiven}
                                </g:else>
                                --%>
                            </td>
                            <td>
                                View Details
                            </td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${resultInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
