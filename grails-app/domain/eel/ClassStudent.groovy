package eel

class ClassStudent {
	def belongsTo = [student: User, courseClass: CourseClass]

    static constraints = {
    	"${student.toString()}: ${courseClass.toString()}"
    }
}
