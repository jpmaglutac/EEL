
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
							<g:sortableColumn property="courseClass" title="${message(code: 'classLecture.courseClass.label', default: 'Course Class')}" />
							
							<g:sortableColumn property="lecture" title="${message(code: 'classLecture.lecture.label', default: 'Lecture')}" />
							
							<g:ifAnyGranted role="ROLE_ADMIN,ROLE_TEACHER">
							<th class="tableTitle" colspan="4">Action</th>
							</g:ifAnyGranted>			
							
							<g:ifAnyGranted role="ROLE_STUDENT">
							<th class="tableTitle" colspan="2">Action</th>
							</g:ifAnyGranted>
							
							
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classLectureInstanceList}" status="i" var="classLectureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: classLectureInstance, field: "courseClass")}</td>
                        
                            <td>${fieldValue(bean: classLectureInstance, field: "lecture")}</td>
							
					<td class="view">
						<g:link controller="download" id="${classLectureInstance?.lecture?.file?.id}">Download</g:link>			
						<g:ifAnyGranted role="ROLE_ADMIN,ROLE_TEACHER">
								<g:hiddenField name="id" value="${classLectureInstance?.id}" />
								<g:link action="editLecture" id="${classLectureInstance.id}">Edit</g:link>
								<g:link action="delete" id="${classLectureInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</g:link>
							</td>
						</g:ifAnyGranted>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${classLectureInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
