
<%@ page import="eel.QuizChoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quizChoice.label', default: 'QuizChoice')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        --><div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'quizChoice.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="choice" title="${message(code: 'quizChoice.choice.label', default: 'Choice')}" />
                        
                            <th><g:message code="quizChoice.quizItem.label" default="Quiz Item" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${quizChoiceInstanceList}" status="i" var="quizChoiceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${quizChoiceInstance.id}">${fieldValue(bean: quizChoiceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: quizChoiceInstance, field: "choice")}</td>
                        
                            <td>${fieldValue(bean: quizChoiceInstance, field: "quizItem")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${quizChoiceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
