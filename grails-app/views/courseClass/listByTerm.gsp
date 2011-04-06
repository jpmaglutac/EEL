
<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
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
            <h1>Historical Class List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="listByTerm">
                <g:select name="term" from="${eel.Term.list()}" optionKey="id" value="${term}" />
                <g:submitButton name="select" value="Select" />
            </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        <!-- No sorting -->
                            <th class="tableTitle"><g:message code="courseClass.course.label" default="Course" /></th>
						<g:ifAnyGranted role="ROLE_TEACHER">
							<th class="tableTitle"><g:message code="courseClass.enrollmentKey.label" default="Enrollment Key" /></th>
						</g:ifAnyGranted>
							<th class="tableTitle"><g:message code="courseClass.section.label" default="Section" /></th>
                        <!--<g:ifAnyGranted role="ROLE_TEACHER">
                            <g:sortableColumn property="enrollmentKey" title="${message(code: 'courseClass.enrollmentKey.label', default: 'Enrollment Key')}" />
                        </g:ifAnyGranted>
                            <g:sortableColumn property="section" title="${message(code: 'courseClass.section.label', default: 'Section')}" />-->
                        
                            <th class="tableTitle"><g:message code="courseClass.term.label" default="Term" /></th>
                            
                            <th class="tableTitle"><g:message code="courseClass.instructor.label" default="instructor" /></th>
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
							
							<td class="view"><g:link action="show" id="${courseClassInstance.id}"><span class="viewButton">View Details</span></g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
