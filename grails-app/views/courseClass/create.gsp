

<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${courseClassInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseClassInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="course"><g:message code="courseClass.course.label" default="Course" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'course', 'errors')}">
                                    <g:select name="course.id" from="${eel.Course.list()}" optionKey="id" value="${courseClassInstance?.course?.id}"  />
                                </td>
                            </tr>
                        
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
                                    <label for="schoolYear"><g:message code="courseClass.schoolYear.label" default="School Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'schoolYear', 'errors')}">
                                    <g:textField name="schoolYear" value="${courseClassInstance?.schoolYear}" />
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
                                    <label for="teacher"><g:message code="courseClass.teacher.label" default="Teacher" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'teacher', 'errors')}">
                                    <g:select name="teacher.id" from="${eel.User.list()}" optionKey="id" value="${courseClassInstance?.teacher?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="term"><g:message code="courseClass.term.label" default="Term" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'term', 'errors')}">
                                    <g:textField name="term" value="${fieldValue(bean: courseClassInstance, field: 'term')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
