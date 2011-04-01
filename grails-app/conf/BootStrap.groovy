import eel.*

class BootStrap {

	def authenticateService

    def init = { servletContext ->
		if(Requestmap.count() == 0){
    	Role student = new Role(authority: "ROLE_STUDENT", description: "Student")
    	student.save(flush: true)
    	Role teacher = new Role(authority: "ROLE_TEACHER", description: "Teacher")
    	teacher.save(flush: true)
    	Role admin = new Role(authority: "ROLE_ADMIN", description: "Admin")
    	admin.save(flush: true)
   	
    	
    	User uTeacher = new User(username: "teacher", userFirstName: "Tea", userLastName: "Cher",
    		passwd: authenticateService.encodePassword("teacher"), email: "teacher@tea.cher", enabled: true,
    		courseOrDepartment: "ITE", description: "teacher")
    	uTeacher.addToAuthorities(teacher)
    	uTeacher.save(flush: true)
    	teacher.addToPeople(uTeacher)
    	teacher.save(flush: true)
    	
    	User uStudent = new User(username: "student", userFirstName: "Stu", userLastName: "Dent",
    		passwd: authenticateService.encodePassword("student"), email: "student@stu.dent", enabled: true,
    		courseOrDepartment: "ACT", description: "student")
    	uStudent.addToAuthorities(student)
    	uStudent.save(flush: true)
    	student.addToPeople(uStudent)
    	student.save(flush: true)
    	
    	User uAdmin = new User(username: "admin", userFirstName: "min", userLastName: "ad",
    		passwd: authenticateService.encodePassword("admin"), email: "admin@ad.min", enabled: true,
    		courseOrDepartment: "Admin", description: "admin")
    	uAdmin.addToAuthorities(admin)
    	uAdmin.save(flush: true)
    	admin.addToPeople(uAdmin)
    	admin.save(flush: true)
    	
    	Term term = new Term(schoolYear: "20102011", term: 3, startDate: new Date(), endDate: (new Date())+1)
    	term.save(flush: true)
    	Course softdev = new Course(courseCode: "SOFTDEV", description: "Software Development", department: "ITE")
    	softdev.save(flush: true)
    	CourseClass i41 = new CourseClass(canViewResults: true, course: softdev, enrollmentKey: "hey", instructor: uTeacher, term: term, section: "I41")
    	i41.save(flush: true)
		
		new Requestmap(url: '/admin/**', configAttribute: 'ROLE_ADMIN').save()
		new Requestmap(url: '/classLecture/create/**', configAttribute: 'ROLE_TEACHER').save()
		new Requestmap(url: '/classLecture/show/**', configAttribute: 'ROLE_TEACHER,ROLE_STUDENT').save()
		new Requestmap(url: '/classQuiz/**', configAttribute: 'ROLE_TEACHER, ROLE_STUDENT').save()
		new Requestmap(url: '/classQuiz/create/**', configAttribute: 'ROLE_TEACHER').save()
		new Requestmap(url: '/classStudent/**', configAttribute: 'ROLE_TEACHER,ROLE_STUDENT,ROLE_ADMIN').save()
		new Requestmap(url: '/courseClass/**', configAttribute: 'ROLE_TEACHER,ROLE_STUDENT').save()
		new Requestmap(url: '/course/**', configAttribute: 'ROLE_ADMIN,ROLE_TEACHER,ROLE_STUDENT').save()
		new Requestmap(url: '/course/create/**', configAttribute: 'ROLE_ADMIN').save()
		new Requestmap(url: '/download/**', configAttribute: 'ROLE_TEACHER,ROLE_STUDENT').save()
		new Requestmap(url: '/lecture/**', configAttribute: 'ROLE_TEACHER,ROLE_STUDENT').save()
		new Requestmap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
		new Requestmap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
		new Requestmap(url: '/profile/**', configAttribute: 'ROLE_TEACHER,ROLE_STUDENT,ROLE_ADMIN').save()
		new Requestmap(url: '/quizChoice/**', configAttribute: 'ROLE_TEACHER').save()
		new Requestmap(url: '/quiz/**', configAttribute: 'ROLE_TEACHER').save()
		new Requestmap(url: '/classQuiz/startQuiz/**', configAttribute: 'ROLE_STUDENT').save()
		new Requestmap(url: '/classQuiz/result/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
		new Requestmap(url: '/quizItem/**', configAttribute: 'ROLE_TEACHER').save()
		new Requestmap(url: '/requestmap/**', configAttribute: 'ROLE_ADMIN').save()
		new Requestmap(url: '/result/**', configAttribute: 'ROLE_TEACHER,ROLE_STUDENT').save()
		new Requestmap(url: '/role/**', configAttribute: 'ROLE_ADMIN').save()
		new Requestmap(url: '/term/**', configAttribute: 'ROLE_ADMIN').save()
		new Requestmap(url: '/user/**', configAttribute: 'ROLE_ADMIN').save()
		new Requestmap(url: '/course/create/**', configAttribute: 'ROLE_ADMIN').save()

		
		/*** default roles:
			IS_AUTHENTICATED_FULLY		IS_AUTHENTICATED_REMEMBERED		IS_AUTHENTICATED_ANONYMOUSLY
			ROLE_USER					ROLE_SUPERVISOR
			
		*** user roles:
			ROLE_STUDENT				ROLE_TEACHER					ROLE_ADMIN	
		***/
		}
    }
    def destroy = {
    }
}
