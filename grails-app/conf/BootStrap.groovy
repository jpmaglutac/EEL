import eel.*

class BootStrap {

	def authenticateService

    def init = { servletContext ->
    	Role student = new Role(authority: "ROLE_STUDENT", description: "Student")
    	student.save(flush: true)
    	Role teacher = new Role(authority: "ROLE_TEACHER", description: "Teacher")
    	teacher.save(flush: true)
    	
    	User uTeacher = new User(username: "teacher", userFirstName: "cher", userLastName: "tea",
    		passwd: authenticateService.encodePassword("teacher"), email: "teacher@tea.cher", enabled: true,
    		courseOrDepartment: "ITE", description: "teacher")
    	uTeacher.addToAuthorities(teacher)
    	uTeacher.save(flush: true)
    	teacher.addToPeople(uTeacher)
    	teacher.save(flush: true)
    	
    	Course softdev = new Course(courseCode: "SOFTDEV", description: "Software Development", department: "ITE")
    	softdev.save(flush: true)
    	CourseClass i41 = new CourseClass(course: softdev, enrollmentKey: "hey", instructor: uTeacher, term: 3, schoolYear: "20102011", section: "I41")
    	i41.save(flush: true)
    }
    def destroy = {
    }
}
