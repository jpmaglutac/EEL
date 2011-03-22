

<%@ page import="eel.Lecture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lecture.label', default: 'Lecture')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
	<g:ifAllGranted role="ROLE_ADMIN">
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
	</g:ifAllGranted>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${lectureInstance}">
            <div class="errors">
                <g:renderErrors bean="${lectureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <%--<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="instructor"><g:message code="lecture.instructor.label" default="Instructor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lectureInstance, field: 'instructor', 'errors')}">
                                    <g:select name="instructor.id" from="${eel.User.list()}" optionKey="id" value="${lectureInstance?.instructor?.id}"  />
                                </td>
                            </tr>--%>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="lecture.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lectureInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${lectureInstance?.title}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">File </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lectureInstance, field: 'title', 'errors')}">
                                    <input type="file" name="file" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
