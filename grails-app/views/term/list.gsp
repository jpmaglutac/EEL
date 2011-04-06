
<%@ page import="eel.Term" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'term.label', default: 'Term')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Terms</h1>
			<g:ifAllGranted role="ROLE_ADMIN">
			<div class="nav" style="margin:0px 0px 5px 0px;">
				<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</div>
			</g:ifAllGranted>		
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="startDate" title="${message(code: 'term.startDate.label', default: 'Start Date')}" />
                                                
                            <g:sortableColumn property="endDate" title="${message(code: 'term.endDate.label', default: 'End Date')}" />
                        
                            <g:sortableColumn property="schoolYear" title="${message(code: 'term.schoolYear.label', default: 'School Year')}" />
                                              
                            <g:sortableColumn property="term" title="${message(code: 'term.term.label', default: 'Term')}" />
				    
                            <th>
					Action
				    </th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${termInstanceList}" status="i" var="termInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				
                            <td><g:formatDate format="MMM dd, yyyy" date="${termInstance.startDate}" /></td>
                                                
                            <td><g:formatDate format="MMM dd, yyyy" date="${termInstance.endDate}" /></td>
                        
                            <td>${fieldValue(bean: termInstance, field: "schoolYear")}</td>
                        
                            <td>${fieldValue(bean: termInstance, field: "term")}</td>
				    
							<td class="view"><g:link action="show" id="${termInstance.id}" class="btn-link">Show</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
				<g:paginate total="${termInstanceTotal}" />				
            </div>	
        </div>
    </body>
</html>
