
<%@ page import="eel.Lecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
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
                            <td valign="top" class="name"><g:message code="lecture.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lectureInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lecture.instructor.label" default="Instructor" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${lectureInstance?.instructor?.id}">${lectureInstance?.instructor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="lecture.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: lectureInstance, field: "title")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
				<g:ifAnyGranted role="ROLE_TEACHER">
                    <g:hiddenField name="id" value="${lectureInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					<span class="backbtn"><g:link controller="courseClass" action="show" id="${classLectureInstance?.courseClass?.id}"><< Back to Class Page</g:link></span>
                </g:ifAnyGranted>
				</g:form>
            </div>
        </div>
    </body>
</html>
