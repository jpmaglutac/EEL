
<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'courseClass.id.label', default: 'Id')}" />
                        
                            <th><g:message code="courseClass.course.label" default="Course" /></th>
                        
                            <g:sortableColumn property="enrollmentKey" title="${message(code: 'courseClass.enrollmentKey.label', default: 'Enrollment Key')}" />
                        
                            <g:sortableColumn property="section" title="${message(code: 'courseClass.section.label', default: 'Section')}" />
                        
                            <th><g:message code="courseClass.term.label" default="Term" /></th>
                            
                            <th><g:message code="courseClass.instructor.label" default="instructor" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courseClassInstanceList}" status="i" var="courseClassInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${courseClassInstance.id}">${fieldValue(bean: courseClassInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: courseClassInstance, field: "course")}</td>
                        
                            <td>${fieldValue(bean: courseClassInstance, field: "enrollmentKey")}</td>
                        
                            <td>${fieldValue(bean: courseClassInstance, field: "section")}</td>
                            
                            <td>${fieldValue(bean: courseClassInstance, field: "term")}</td>
                        
                            <td>${fieldValue(bean: courseClassInstance, field: "instructor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${courseClassInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
