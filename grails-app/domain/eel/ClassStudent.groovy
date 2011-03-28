package eel

class ClassStudent {
	def belongsTo = [student: User, courseClass: CourseClass]

    static constraints = {
    	
    }
    
    String toString(){
    	"${student.toString()}: ${courseClass.toString()}"
    }
}
