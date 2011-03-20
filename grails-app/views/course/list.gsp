
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
	<g:ifAllGranted role="ROLE_ADMIN">
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <g:ifAnyGranted role="ROLE_ADMIN">
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</g:ifAnyGranted>
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
						
                            <g:sortableColumn property="courseCode" title="${message(code: 'course.courseCode.label', default: 'Course Code')}" />
                        
                            <g:sortableColumn property="department" title="${message(code: 'course.department.label', default: 'Department')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />
							
							<!-- <g:sortableColumn property="id" title="${message(code: 'course.id.label', default: 'Id')}" /> -->
							<g:ifAnyGranted role="ROLE_STUDENT">
							<td class="tableTitle">Section</td>
							</g:ifAnyGranted>
							<g:ifAnyGranted role="ROLE_TEACHER,ROLE_ADMIN">
							<td class="tableTitle">Details</td>
							</g:ifAnyGranted>
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
									<g:link controller="courseClass" action="listByCourse" id="${courseInstance.id}">
										<span>View Sections</span>
									</g:link>
								</g:ifAnyGranted>
								
                                <g:ifAnyGranted role="ROLE_TEACHER,ROLE_ADMIN">
                                    <g:link action="show" id="${courseInstance.id}">
										<span>View Details</span>
									</g:link>
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
