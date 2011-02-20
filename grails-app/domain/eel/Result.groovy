package eel

class Result {
	def belongsTo = [student:User, classQuiz:ClassQuiz]
	
	def score

    static constraints = {
    }
}
