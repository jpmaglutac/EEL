
<%@ page import="eel.Term" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'term.label', default: 'Term')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	<g:ifAllGranted role="ROLE_ADMIN">
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
	</g:ifAllGranted>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'term.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="endDate" title="${message(code: 'term.endDate.label', default: 'End Date')}" />
                        
                            <g:sortableColumn property="schoolYear" title="${message(code: 'term.schoolYear.label', default: 'School Year')}" />
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'term.startDate.label', default: 'Start Date')}" />
                        
                            <g:sortableColumn property="term" title="${message(code: 'term.term.label', default: 'Term')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${termInstanceList}" status="i" var="termInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${termInstance.id}">${fieldValue(bean: termInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${termInstance.endDate}" /></td>
                        
                            <td>${fieldValue(bean: termInstance, field: "schoolYear")}</td>
                        
                            <td><g:formatDate date="${termInstance.startDate}" /></td>
                        
                            <td>${fieldValue(bean: termInstance, field: "term")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${termInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
