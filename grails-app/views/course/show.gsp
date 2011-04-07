
<%@ page import="eel.Course" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
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
                            <td valign="top" class="name"><g:message code="course.courseCode.label" default="Course Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseInstance, field: "courseCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.department.label" default="Department" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseInstance, field: "department")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseInstance, field: "description")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${courseInstance?.id}" />
					<g:ifAnyGranted role="ROLE_ADMIN">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					<span class="back"><g:link class="list" action="list">Back to Course List</g:link></span>
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_TEACHER">
					<span class="nav"><g:link class="create" controller="courseClass" action="create" id="${courseInstance.id}">Add Class<br /><br /></g:link></span>
					</g:ifAnyGranted>
                </g:form>
            </div>
        </div>
    </body>
</html>
