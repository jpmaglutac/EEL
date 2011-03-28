

<%@ page import="eel.Term" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'term.label', default: 'Term')}" />
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
            <g:hasErrors bean="${termInstance}">
            <div class="errors">
                <g:renderErrors bean="${termInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="term.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: termInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${termInstance?.startDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="term.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: termInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${termInstance?.endDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="schoolYear"><g:message code="term.schoolYear.label" default="School Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: termInstance, field: 'schoolYear', 'errors')}">
                                    <g:textField name="schoolYear" value="${termInstance?.schoolYear}" />
                                </td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="term"><g:message code="term.term.label" default="Term" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: termInstance, field: 'term', 'errors')}">
                                    <g:textField name="term" value="${fieldValue(bean: termInstance, field: 'term')}" />
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
