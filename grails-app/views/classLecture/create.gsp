

<%@ page import="eel.ClassLecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'classLecture.label', default: 'ClassLecture')}" />
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
            <g:hasErrors bean="${classLectureInstance}">
            <div class="errors">
                <g:renderErrors bean="${classLectureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
