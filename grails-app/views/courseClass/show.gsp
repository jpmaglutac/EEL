
<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseClass.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseClassInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseClass.course.label" default="Course" /></td>
                            
                            <td valign="top" class="value"><g:link controller="course" action="show" id="${courseClassInstance?.course?.id}">${courseClassInstance?.course?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseClass.enrollmentKey.label" default="Enrollment Key" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseClassInstance, field: "enrollmentKey")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseClass.section.label" default="Section" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseClassInstance, field: "section")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseClass.term.label" default="Term" /></td>
                            
                            <td valign="top" class="value"><g:link controller="term" action="show" id="${courseClassInstance?.term?.id}">${courseClassInstance?.term?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="courseClass.instructor.label" default="instructor" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${courseClassInstance?.instructor?.id}">${courseClassInstance?.instructor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${courseClassInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                	<span class="menuButton"><g:link class="create" controller="classLecture" action="create" id="${courseClassInstance.id}">Add Lecture</g:link></span>
                	<span class="menuButton"><g:link class="list" controller="classLecture" action="listByClass" id="${courseClassInstance.id}">View Lectures</g:link></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
