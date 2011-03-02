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
    	
    	User uStudent = new User(username: "student", userFirstName: "dent", userLastName: "stu",
    		passwd: authenticateService.encodePassword("student"), email: "student@stu.dent", enabled: true,
    		courseOrDepartment: "ACT", description: "student")
    	uStudent.addToAuthorities(student)
    	uStudent.save(flush: true)
    	student.addToPeople(uStudent)
    	student.save(flush: true)
    	
    	Term term = new Term(schoolYear: "20102011", term: 3, startDate: new Date(), endDate: (new Date())+1)
    	term.save(flush: true)
    	Course softdev = new Course(courseCode: "SOFTDEV", description: "Software Development", department: "ITE")
    	softdev.save(flush: true)
    	CourseClass i41 = new CourseClass(course: softdev, enrollmentKey: "hey", instructor: uTeacher, term: term, section: "I41")
    	i41.save(flush: true)
    }
    def destroy = {
    }
}
