package eel

class ClassQuiz {
	def belongsTo = [quiz: Quiz, courseClass:CourseClass]
	
	Date startDate
	Date endDate
	
    static constraints = {
    	"${quiz.toString()}: ${courseClass.toString()}"
    }
}
