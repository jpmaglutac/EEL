
<%@ page import="eel.ClassLecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classLecture.label', default: 'ClassLecture')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>View Lecture</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="classLecture.courseClass.label" default="Course Class" /></td>
                            
                            <td valign="top" class="value">${classLectureInstance?.courseClass?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="classLecture.lecture.label" default="Lecture Name" /></td>
                            
                            <td valign="top" class="value">${classLectureInstance?.lecture?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
			<g:ifAnyGranted role="ROLE_TEACHER">
            <div class="buttons">
			</g:ifAnyGranted>
			<g:ifAnyGranted role="ROLE_STUDENT">
            <div class="buttons" style="height:15px;padding-top:5px;">
			</g:ifAnyGranted>
                <g:form>
				<g:ifAnyGranted role="ROLE_TEACHER">
					<g:hiddenField name="id" value="${classLectureInstance?.id}" />
					<span class="button"><g:actionSubmit class="edit" action="editLecture" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
					<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					<span class="download"><g:link controller="download" id="${classLectureInstance?.lecture?.file?.id}">Download</g:link></span>
					<span class="back"><g:link controller="courseClass" action="show" id="${classLectureInstance?.courseClass?.id}">Back to Class Page</g:link></span>
				</g:ifAnyGranted>
				<g:ifAnyGranted role="ROLE_STUDENT">	
					<span class="download"><g:link controller="download" id="${classLectureInstance?.lecture?.file?.id}">Download</g:link></span>
					<span class="back"><g:link controller="courseClass" action="show" id="${classLectureInstance?.courseClass?.id}">Back to Class Page</g:link></span>
				</g:ifAnyGranted>
				</g:form>
            </div>
        </div>
    </body>
</html>
