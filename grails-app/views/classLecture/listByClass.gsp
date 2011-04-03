
<%@ page import="eel.ClassLecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classLecture.label', default: 'ClassLecture')}" />
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
                        
                            <!--<g:sortableColumn property="id" title="${message(code: 'classLecture.id.label', default: 'Id')}" />-->
                        
                            <th class="tableTitle"><g:message code="classLecture.courseClass.label" default="Course Class" /></th>
                        
                            <th class="tableTitle"><g:message code="classLecture.lecture.label" default="Lecture" /></th>
							<th class="tableTitle">Details</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classLectureInstanceList}" status="i" var="classLectureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: classLectureInstance, field: "courseClass")}</td>
                        
                            <td>${fieldValue(bean: classLectureInstance, field: "lecture")}</td>
                        
							<td><g:link action="show" id="${classLectureInstance.id}">View Details</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
