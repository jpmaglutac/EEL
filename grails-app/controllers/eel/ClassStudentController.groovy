package eel

class ClassStudentController{
    def listStudentsByClass = {
		if (!params.max) {
			params.max = 10
		}
		def students = ClassStudent.findAllByCourseClass(CourseClass.get(params.id), params).student
		[personList: students, personCount: ClassStudent.findAllByCourseClass(CourseClass.get(params.id), params).size()]
	}
}
