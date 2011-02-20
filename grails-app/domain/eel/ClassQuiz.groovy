package eel

class ClassQuiz {
	def belongsTo = [quiz: Quiz, courseClass:CourseClass]
	
	Date start
	Date end

    static constraints = {
    }
}
