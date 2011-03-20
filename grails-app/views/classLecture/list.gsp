
<%@ page import="eel.ClassLecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classLecture.label', default: 'ClassLecture')}" />
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
                        
                            <!-- <g:sortableColumn property="id" title="${message(code: 'classLecture.id.label', default: 'Id')}" />-->
                        
                            <th><g:message code="classLecture.courseClass.label" default="Course Class" /></th>
                        
                            <th><g:message code="classLecture.lecture.label" default="Lecture" /></th>
							
							<th class="tableTitle">Details</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classLectureInstanceList}" status="i" var="classLectureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: classLectureInstance, field: "courseClass")}</td>
                        
                            <td>${fieldValue(bean: classLectureInstance, field: "lecture")}</td>
							
							<td class="view"><g:link action="show" id="${classLectureInstance.id}">View Details</g:link></td>
                        
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
