
<%@ page import="eel.Lecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'lecture.id.label', default: 'Id')}" />
                        
                            <th><g:message code="lecture.instructor.label" default="Instructor" /></th>
                        
                            <g:sortableColumn property="title" title="${message(code: 'lecture.title.label', default: 'Title')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lectureInstanceList}" status="i" var="lectureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${lectureInstance.id}">${fieldValue(bean: lectureInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: lectureInstance, field: "instructor")}</td>
                        
                            <td>${fieldValue(bean: lectureInstance, field: "title")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${lectureInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
