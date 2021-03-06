
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
       <!--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        --><div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>         
                            <th><g:message code="quiz.instructor.label" default="Instructor" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'quiz.name.label', default: 'Name')}" />
                        
							<th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${quizInstanceList}" status="i" var="quizInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                               
                            <td>${fieldValue(bean: quizInstance, field: "instructor")}</td>
                        
                            <td>${fieldValue(bean: quizInstance, field: "name")}</td>
                           
						   <td><span class="btn-link"><g:link action="show" id="${quizInstance.id}">View</g:link></span></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${quizInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
