
<%@ page import="eel.Course" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'course.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="courseCode" title="${message(code: 'course.courseCode.label', default: 'Course Code')}" />
                        
                            <g:sortableColumn property="department" title="${message(code: 'course.department.label', default: 'Department')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courseInstanceList}" status="i" var="courseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: courseInstance, field: "courseCode")}</td>
                        
                            <td>${fieldValue(bean: courseInstance, field: "department")}</td>
                        
                            <td>${fieldValue(bean: courseInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${courseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
