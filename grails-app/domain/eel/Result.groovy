package eel

class Result {
	def belongsTo = [student:Student, classQuiz:ClassQuiz]
	
	def score

    static constraints = {
    }
}
