
<%@ page import="eel.Result" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'result.id.label', default: 'Id')}" />
                        
                            <th><g:message code="result.classQuiz.label" default="Class Quiz" /></th>
                        
                            <g:sortableColumn property="score" title="${message(code: 'result.score.label', default: 'Score')}" />
                        
                            <th><g:message code="result.student.label" default="Student" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${resultInstanceList}" status="i" var="resultInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${resultInstance.id}">${fieldValue(bean: resultInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: resultInstance, field: "classQuiz")}</td>
                        
                            <td>${fieldValue(bean: resultInstance, field: "score")}</td>
                        
                            <td>${fieldValue(bean: resultInstance, field: "student")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${resultInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
