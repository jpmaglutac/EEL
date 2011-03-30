
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <!--<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        --><div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:hasErrors bean="${classQuizInstance}">
            <div class="errors">
                <g:renderErrors bean="${classQuizInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="addQuiz">
            	<div class="dialog">
                	<table>
                	    <tbody>
                	    
                	        <tr class="prop">
                	            <td valign="top" class="name"><g:message code="quiz.id.label" default="Id" /></td>
                	            
                	            <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "id")}</td>
                	            
                	        </tr>
                	    
                	        <tr class="prop">
                	            <td valign="top" class="name"><g:message code="quiz.instructor.label" default="Instructor" /></td>
                	            
                	            <td valign="top" class="value"><g:link controller="user" action="show" id="${quizInstance?.instructor?.id}">${quizInstance?.instructor?.encodeAsHTML()}</g:link></td>
                	            
                	        </tr>
                	    
                	        <tr class="prop">
                	            <td valign="top" class="name"><g:message code="quiz.name.label" default="Name" /></td>
                	            
                	            <td valign="top" class="value">${fieldValue(bean: quizInstance, field: "name")}</td>
                		            
                	        </tr>
                	        
                	        <tr class="prop">
                	            <td valign="top" class="name">Quiz Items</td>
                	            
                	            <td valign="top" class="value">
                	            	<table>
                	            		<tr>
                	            			<th>Question</th>
                	            			<th>Correct Answer</th>
                	            		</tr>
                	            		<g:each in="${quizInstance.quizItems}" var="quizItem">
                	            			<tr>
                	            				<td>${quizItem.question}</td>
                	            				<td>${(quizItem.quizType==eel.QuizType.MULTIPLE)?eel.QuizChoice.get(quizItem.correctAns).choice:quizItem.correctAns}</td>
                	            			</tr>
                	            		</g:each>
                	            	</table>
                	            </td>
                	            
                	        </tr>
                	        
                	        <tr class="prop">
                	            <td valign="top" class="name">
                	                <label for="startDate"><g:message code="classQuiz.startDate.label" default="Start Date" /></label>
                	            </td>
               		            <td valign="top" class="value ${hasErrors(bean: classQuizInstance, field: 'startDate', 'errors')}">
               		                <g:datePicker name="startDate" value="${classQuizInstance?.startDate}"  />
                	            </td>
                    	    </tr>
                        
                    	    <tr class="prop">
                    	        <td valign="top" class="name">
                    	            <label for="endDate"><g:message code="classQuiz.endDate.label" default="End Date" /></label>
                    	        </td>
                    	        <td valign="top" class="value ${hasErrors(bean: classQuizInstance, field: 'endDate', 'errors')}">
                    	            <g:datePicker name="endDate" value="${classQuizInstance?.endDate}"  />
                    	        </td>
                    	    </tr>
                    	
                    	</tbody>
                	</table>
            	</div>
            	<div class="buttons">
                    <g:hiddenField name="quizId" value="${quizInstance?.id}" />
                    <g:hiddenField name="courseClassId" value="${courseClassId?:params.courseClassId}" />
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
	            </div>
            </g:form>
        </div>
    </body>
</html>
