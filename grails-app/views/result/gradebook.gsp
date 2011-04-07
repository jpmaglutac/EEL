
<%@ page import="eel.Result" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="result.classQuiz.label" default="Student Gradebook" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>                        
                            <th>Quiz</th>
                            <th>Grade</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<g:each in="${resultInstanceList}" status="i" var="resultInstance">
                    		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            	<td>${resultInstance.classQuiz.quiz}</td>
                            	<g:set var="size" value="${resultInstance.classQuiz.quiz.quizItems.size()}" />
                            	<td>${(size==0)?100:((resultInstance.score/size)*100)}%</td>
                            	<td><span class="btn-link"><g:link action="show" id="${resultInstance.id}">View Result</g:link></span></td>
                        	</tr>                        
                    	</g:each>
                    </tbody>
                </table>
            </div>
            <div class="buttons" style="height:15px;padding-top:5px;">
				<span class="back"><g:link controller="courseClass" action="show" id="${params.id}">Back to Class Page</g:link></span>
            </div>
        </div>
    </body>
</html>
