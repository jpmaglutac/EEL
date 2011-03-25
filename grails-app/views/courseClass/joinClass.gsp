

<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        --><div class="body">
            <h1>Join Class</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${courseClassInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseClassInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="addStudent" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enrollmentKey"><g:message code="courseClass.enrollmentKey.label" default="Enrollment Key" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseClassInstance, field: 'enrollmentKey', 'errors')}">
                                    <g:textField name="enrollmentKey" value="${courseClassInstance?.enrollmentKey}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                	<g:hiddenField name="courseClassId" value="${courseClass.id}" />
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Join')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
