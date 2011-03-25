

<%@ page import="eel.ClassLecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classLecture.label', default: 'ClassLecture')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${classLectureInstance}">
            <div class="errors">
                <g:renderErrors bean="${classLectureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${classLectureInstance?.id}" />
                <g:hiddenField name="version" value="${classLectureInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="courseClass"><g:message code="classLecture.courseClass.label" default="Course Class" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classLectureInstance, field: 'courseClass', 'errors')}">
                                    <g:select name="courseClass.id" from="${eel.CourseClass.list()}" optionKey="id" value="${classLectureInstance?.courseClass?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lecture"><g:message code="classLecture.lecture.label" default="Lecture" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: classLectureInstance, field: 'lecture', 'errors')}">
                                    <g:select name="lecture.id" from="${eel.Lecture.list()}" optionKey="id" value="${classLectureInstance?.lecture?.id}"  />
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
