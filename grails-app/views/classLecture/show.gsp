
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
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="classLecture.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: classLectureInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="classLecture.courseClass.label" default="Course Class" /></td>
                            
                            <td valign="top" class="value"><g:link controller="courseClass" action="show" id="${classLectureInstance?.courseClass?.id}">${classLectureInstance?.courseClass?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="classLecture.lecture.label" default="Lecture Name" /></td>
                            
                            <td valign="top" class="value"><g:link controller="lecture" action="show" id="${classLectureInstance?.lecture?.id}">${classLectureInstance?.lecture?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
				<g:ifAnyGranted role="ROLE_ADMIN,ROLE_TEACHER">
                    <g:hiddenField name="id" value="${classLectureInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="editLecture" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					<span class="download"><g:link controller="download" id="${classLectureInstance?.lecture?.file?.id}">Download</g:link></span>
				</g:ifAnyGranted>
				<g:ifAnyGranted role="ROLE_STUDENT">
				</br>
					<span class="download"><g:link controller="download" id="${classLectureInstance?.lecture?.file?.id}">Download</g:link></span>
				</br>&nbsp;
				</g:ifAnyGranted>
				</g:form>
            </div>
        </div>
    </body>
</html>
