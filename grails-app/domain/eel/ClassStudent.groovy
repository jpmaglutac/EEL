package eel

class ClassStudent {
	def belongsTo = [student: User, courseClass: CourseClass]

    static constraints = {
    	student(unique:'courseClass')
    }
    
    String toString(){
    	"${student.toString()}: ${courseClass.toString()}"
    }
}
