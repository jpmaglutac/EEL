

<%@ page import="eel.PassingRates" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'passingRates.label', default: 'PassingRates')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${passingRatesInstance}">
            <div class="errors">
                <g:renderErrors bean="${passingRatesInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${passingRatesInstance?.id}" />
                <g:hiddenField name="version" value="${passingRatesInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quizPassing"><g:message code="passingRates.quizPassing.label" default="Quiz Passing" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: passingRatesInstance, field: 'quizPassing', 'errors')}">
                                    <g:textField name="quizPassing" value="${fieldValue(bean: passingRatesInstance, field: 'quizPassing')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="classPassing"><g:message code="passingRates.classPassing.label" default="Class Passing" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: passingRatesInstance, field: 'classPassing', 'errors')}">
                                    <g:textField name="classPassing" value="${fieldValue(bean: passingRatesInstance, field: 'classPassing')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
