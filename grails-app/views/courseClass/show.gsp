
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
	 	<g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
		<!-- ***********************CourseClass Details*************************8-->
		<center>
		<div class="classBox">
            <h1>Class Information</h1>
			<div class="classBoxInner">
			<table class="classInfo">
				<tr>
					<td class="classInfo-left"><g:message code="courseClass.course.label" default="Course" />:</td>
					<td class="classInfo-right">${courseClassInstance?.course?.encodeAsHTML()}</td>
				</tr>
				
				<tr>
					<td class="classInfo-left"><g:message code="courseClass.term.label" default="Term" />:</td>
					<td class="classInfo-right">${courseClassInstance?.term?.encodeAsHTML()}</td>
				</tr>
				
				<tr>
					<td class="classInfo-left"><g:message code="courseClass.enrollmentKey.label" default="Enrollment Key" />:</td>
					<td class="classInfo-right">${fieldValue(bean: courseClassInstance, field: "enrollmentKey")}</td>             
				</tr>
				
				<tr>
					<td class="classInfo-left"><g:message code="courseClass.section.label" default="Section" />:</td>
					<td class="classInfo-right">${fieldValue(bean: courseClassInstance, field: "section")}</td>
				</tr>
				
				<tr>				
					<td class="classInfo-left"><g:message code="courseClass.instructor.label" default="Instructor" />:</td>
					<td class="classInfo-right"><g:link controller="profile" action="view" id="${courseClassInstance.instructor.id}">${courseClassInstance?.instructor?.encodeAsHTML()}</g:link></td>
				</tr>
				<g:ifAllGranted role="ROLE_TEACHER">
				    <tr>
				        <td class="classInfo-left">Students Can View Answers on Results:</td>
				        <td class="classInfo-right">${(courseClassInstance.canViewResults)?'Yes':'No'}</td>
				    </tr>
				</g:ifAllGranted>
			 </tbody>
			</table>
		</div>
					<g:form>
							<g:hiddenField name="id" value="${courseClassInstance?.id}" />
							<g:ifAnyGranted role="ROLE_TEACHER">
						<div class="menu-grid">
								<span class="btn-edit"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
								<span class="btn-delete"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
								<span class="btn-link1"><g:link class="view" controller="classStudent" action="listStudentsByClass" id="${courseClassInstance.id}">View Students</g:link></span>
						</div>	
							</g:ifAnyGranted>
					
							<g:ifAnyGranted role="ROLE_STUDENT">
						<div class="menu-grid">
								<span class="btn-link1"><g:link class="view" controller="classStudent" action="listStudentsByClass" id="${courseClassInstance.id}">View Students</g:link></span>
						</div>
							</g:ifAnyGranted>
						</g:form>
		</div>
		<!-- ****************CourseClass List Lectures***************************8-->
		<div class="classBox">
            <h1>Lecture List</h1>
			<div class="classBoxInner">
                <table class="classInfo">
                    <thead>
                        <tr>
						   <g:sortableColumn property="lecture" title="${message(code: 'classLecture.lecture.label', default: 'Lecture')}" />

							
							<g:ifAnyGranted role="ROLE_ADMIN,ROLE_TEACHER">
							<th class="tableTitle" colspan="4">Action</th>
							</g:ifAnyGranted>			
							
							<g:ifAnyGranted role="ROLE_STUDENT">
							<th class="tableTitle" colspan="2">Action</th>
							</g:ifAnyGranted>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classLectureInstanceList}" status="i" var="classLectureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean: classLectureInstance, field: "lecture")}</td>
							
					<td class="view">
						<g:link controller="download" id="${classLectureInstance?.lecture?.file?.id}">Download</g:link>			
						<g:ifAnyGranted role="ROLE_ADMIN,ROLE_TEACHER">
								<g:hiddenField name="id" value="${classLectureInstance?.id}" />
								<g:link controller="classLecture" action="editLecture" id="${courseClassInstance.id}">Edit Lecture</g:link>
								<g:link controller="classLecture" action="delete" id="${classLectureInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</g:link>
					</td>
						</g:ifAnyGranted>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
			</div>
			
			<g:ifAnyGranted role="ROLE_TEACHER">
			<div class="menu-grid">
                <g:form>
                    <g:hiddenField name="id" value="${courseClassInstance?.id}" />
					<span class="btn-link1"><g:link class="create" controller="classLecture" action="create" id="${courseClassInstance.id}">Add Lecture</g:link></span>
                </g:form>
			</div>
			</g:ifAnyGranted>
		</div>
		
		<!-- *****************CourseClass List Quiz********************-->
		
		<div class="classBox">
            <h1>Quiz List</h1>
			<div class="classBoxInner">
               <table class="classInfo">
                    <thead>
                        <tr>
                        
                            <th>Name</th>
                            <th colspan="2">Options</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classQuizInstanceList}" status="i" var="classQuizInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${classQuizInstance.quiz.name}</td>
                            <g:ifAllGranted role="ROLE_TEACHER">
                            	<td><span class="btn-link"><g:link controller="quiz" action="show" id="${classQuizInstance.quiz.id}" params="${[classQuizId: classQuizInstance.id]}">Edit Quiz</g:link></span></td>
                            	<td><span class="btn-link"><g:link controller="classQuiz" action="result" id="${classQuizInstance.id}">View Results</g:link></span></td>    
                        	</g:ifAllGranted><g:ifAllGranted role="ROLE_STUDENT">
                        		<td><span class="btn-link"><g:link controller="classQuiz" action="startQuiz" id="${classQuizInstance.id}">Take Quiz</g:link></span></td>
                        	</g:ifAllGranted>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
			</div>
			<div class="menu-grid">
                <g:form>
                    <g:hiddenField name="id" value="${courseClassInstance?.id}" />
					<g:ifAnyGranted role="ROLE_TEACHER">
                	<span class="btn-link1"><g:link class="create" controller="classQuiz" action="create" id="${courseClassInstance.id}">Add Quiz</g:link></span>
                	<span class="btn-link1"><g:link class="view" controller="result" action="courseClass" id="${courseClassInstance.id}">View Gradebook</g:link></span>
					
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_STUDENT,ROLE_ADMIN">
					<span class="btn-link1"><g:link class="view" controller="classQuiz" action="listActiveByClass" id="${courseClassInstance.id}">View Active Quizzes</g:link></span>
                	<span class="btn-link1"><g:link class="view" controller="result" action="gradebook" id="${courseClassInstance.id}">View Gradebook</g:link></span>
					</g:ifAnyGranted>
                </g:form>
			</div>
		</div>
	</center>
	</div>
    </body>
</html>
