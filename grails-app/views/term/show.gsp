<%@ page import="eel.Term" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'term.label', default: 'Term')}" />
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
                            <td valign="top" class="name"><g:message code="term.term.label" default="Term" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: termInstance, field: "term")}</td>
                            
                        </tr>
                                       
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="term.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MMM dd, yyyy" date="${termInstance?.startDate}" /></td>
                            
                        </tr>
				
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="term.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MMM dd, yyyy" date="${termInstance?.endDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="term.schoolYear.label" default="School Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: termInstance, field: "schoolYear")}</td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${termInstance?.id}" />
				<g:ifAnyGranted role="ROLE_ADMIN">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					<span class="back"><g:link class="list" action="list">Back to Term List</g:link></span>				
				</g:ifAnyGranted>
			</g:form>
            </div>
        </div>
    </body>
</html>
4