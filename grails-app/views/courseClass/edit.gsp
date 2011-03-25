

<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${courseClassInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseClassInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${courseClassInstance?.id}" />
                <g:hiddenField name="version" value="${courseClassInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <%--<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="course"><g:message code="courseClass.course.label" default="Course" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'course', 'errors')}">
                                    <g:select name="course.id" from="${eel.Course.list()}" optionKey="id" value="${courseClassInstance?.course?.id}"  />
                                </td>
                            </tr>--%>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enrollmentKey"><g:message code="courseClass.enrollmentKey.label" default="Enrollment Key" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'enrollmentKey', 'errors')}">
                                    <g:textField name="enrollmentKey" value="${courseClassInstance?.enrollmentKey}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="section"><g:message code="courseClass.section.label" default="Section" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'section', 'errors')}">
                                    <g:textField name="section" value="${courseClassInstance?.section}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="instructor"><g:message code="courseClass.term.label" default="term" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'term', 'errors')}">
                                    <g:select name="term.id" from="${eel.Term.list()}" optionKey="id" value="${courseClassInstance?.term?.id}"  />
                                </td>
                            </tr>
                        
                            <%--<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="instructor"><g:message code="courseClass.instructor.label" default="instructor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'instructor', 'errors')}">
                                    <g:select name="instructor.id" from="${eel.User.list()}" optionKey="id" value="${courseClassInstance?.instructor?.id}"  />
                                </td>
                            </tr>--%>
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
