
<%@ page import="eel.Course" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery', file:'jquery.js')}"></script>
    </head>
    <body>
	
        <div class="body">
            <h1>Courses</h1>
			<g:ifAllGranted role="ROLE_ADMIN">
			<div class="nav" style="margin-bottom:5px;">
				<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</div>
			</g:ifAllGranted>			
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
						
                            <g:sortableColumn property="courseCode" title="${message(code: 'course.courseCode.label', default: 'Course Code')}" />
                        
                            <g:sortableColumn property="department" title="${message(code: 'course.department.label', default: 'Department')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />

							<td class="tableTitle">Action</td>
	
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courseInstanceList}" status="i" var="courseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: courseInstance, field: "courseCode")}</td>
                        
                            <td>${fieldValue(bean: courseInstance, field: "department")}</td>
                        
                            <td>${fieldValue(bean: courseInstance, field: "description")}</td>
                            <td class="view">
					<g:ifAnyGranted role="ROLE_STUDENT">
						<g:link controller="courseClass" class="btn-link" action="listByCourse" id="${courseInstance.id}">
							View Sections
						</g:link>
					</g:ifAnyGranted>
								
                    <g:ifAnyGranted role="ROLE_TEACHER">
                         <g:link class="btn-link" controller="courseClass" action="create" id="${courseInstance.id}">
							Add Class
						</g:link>
                    </g:ifAnyGranted>		
					  
                    <g:ifAnyGranted role="ROLE_ADMIN">
						<span class="button">
							<g:link class="btn-link" controller="course" action="edit" id="${courseInstance.id}">
								Edit
							</g:link>						  
						</span>
                    </g:ifAnyGranted>			
                    </td>
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
