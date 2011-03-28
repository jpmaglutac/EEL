

<%@ page import="eel.Lecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${lectureInstance}">
            <div class="errors">
                <g:renderErrors bean="${lectureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${lectureInstance?.id}" />
                <g:hiddenField name="version" value="${lectureInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="instructor"><g:message code="lecture.instructor.label" default="Instructor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lectureInstance, field: 'instructor', 'errors')}">
                                    <g:select name="instructor.id" from="${eel.User.list()}" optionKey="id" value="${lectureInstance?.instructor?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="lecture.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lectureInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${lectureInstance?.title}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
