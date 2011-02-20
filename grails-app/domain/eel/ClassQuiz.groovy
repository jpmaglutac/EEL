package eel

class ClassQuiz {
	def belongsTo = [quiz: Quiz, classCourse:ClassCourse]
	
	Date start
	Date end

    static constraints = {
    }
}
