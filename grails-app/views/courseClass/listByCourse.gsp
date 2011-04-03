
<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
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
							
                            <th class="tableTitle"><g:message code="courseClass.course.label" default="Course" /></th>
							
							<g:ifAnyGranted role="ROLE_TEACHER">
							<g:sortableColumn property="enrollmentKey" title="${message(code: 'courseClass.enrollmentKey.label', default: 'Enrollment Key')}" />
                            </g:ifAnyGranted>
							
							<g:sortableColumn property="section" title="${message(code: 'courseClass.section.label', default: 'Section')}" />
							
                            <th class="tableTitle"><g:message code="courseClass.term.label" default="Term" /></th>
                            
                            <th class="tableTitle"><g:message code="courseClass.instructor.label" default="Instructor" /></th>
							
							<th class="tableTitle">Details</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courseClassInstanceList}" status="i" var="courseClassInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean: courseClassInstance, field: "course")}</td>
							<g:ifAnyGranted role="ROLE_TEACHER">
                            <td>${fieldValue(bean: courseClassInstance, field: "enrollmentKey")}</td>
							</g:ifAnyGranted>
                            <td>${fieldValue(bean: courseClassInstance, field: "section")}</td>
                            
                            <td>${fieldValue(bean: courseClassInstance, field: "term")}</td>
                        
                            <td>${fieldValue(bean: courseClassInstance, field: "instructor")}</td>
                        
							<td class="view"><g:link action="show" id="${courseClassInstance.id}"><span>View Details</span></g:link></td>
            
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
