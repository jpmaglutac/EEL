
<%@ page import="eel.CourseClass" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'courseClass.label', default: 'CourseClass')}" />
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
				<tr>
					<td class="courseClassPage"><g:message code="courseClass.course.label" default="Course" />:</td>
					<td class="courseClassPage"><g:link controller="course" action="show" id="${courseClassInstance?.course?.id}">${courseClassInstance?.course?.encodeAsHTML()}</g:link></td>
					
					<td class="courseClassPage"><g:message code="courseClass.term.label" default="Term" />:</td>
					<td class="courseClassPage"><g:link controller="term" action="show" id="${courseClassInstance?.term?.id}">${courseClassInstance?.term?.encodeAsHTML()}</g:link></td>
				</tr>
				
				<tr>
					<td class="courseClassPage"><g:message code="courseClass.section.label" default="Section" />:</td>
					<td class="courseClassPage">${fieldValue(bean: courseClassInstance, field: "section")}</td>
					
					<td class="courseClassPage"><g:message code="courseClass.instructor.label" default="Instructor" />:</td>
					<td class="courseClassPage"><g:link controller="user" action="show" id="${courseClassInstance?.instructor?.id}">${courseClassInstance?.instructor?.encodeAsHTML()}</g:link></td>
				</tr>
				<g:ifAllGranted role="ROLE_TEACHER">
				    <tr>
				        <td class="courseClassPage">Students Can View<br /><br />Answers on Results:</td>
				        <td class="courseClassPage">${(courseClassInstance.canViewResults)?'Yes':'No'}</td>
				    </tr>
				</g:ifAllGranted>
			 </tbody>
			</table>
		</div>
        <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${courseClassInstance?.id}" />
					<g:ifAnyGranted role="ROLE_TEACHER">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                	<span class="menuButton"><g:link class="create" controller="classLecture" action="create" id="${courseClassInstance.id}">Add Lecture</g:link></span>
                	<span class="menuButton"><g:link class="create" controller="classQuiz" action="create" id="${courseClassInstance.id}">Add Quiz</g:link></span>
                	<span class="menuButton"><g:link class="list" controller="classLecture" action="listByClass" id="${courseClassInstance.id}">View Lectures</g:link></span>
                	<span class="menuButton"><g:link class="list" controller="classQuiz" action="listByClass" id="${courseClassInstance.id}">View Quizzes</g:link></span>
                	<span class="menuButton"><g:link class="list" controller="result" action="courseClass" id="${courseClassInstance.id}">View Gradebook</g:link></span>
                	<span class="menuButton"><g:link class="list" controller="classStudent" action="listStudentsByClass" id="${courseClassInstance.id}">View Students</br></br></g:link></span>
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_STUDENT,ROLE_ADMIN">
					</br>
					<span class="menuButton"><g:link class="list" controller="classLecture" action="listByClass" id="${courseClassInstance.id}">View Lectures</g:link></span>
					<span class="menuButton"><g:link class="list" controller="classQuiz" action="listActiveByClass" id="${courseClassInstance.id}">View Active Quizzes</g:link></span>
                	<span class="menuButton"><g:link class="list" controller="classStudent" action="listStudentsByClass" id="${courseClassInstance.id}">View Students</br></br></g:link></span>
                	<span class="menuButton"><g:link class="list" controller="result" action="gradebook" id="${courseClassInstance.id}">View Gradebook</br></br></g:link></span>
					</g:ifAnyGranted>
                </g:form>
            </div>
        </div>
    </body>
</html>
