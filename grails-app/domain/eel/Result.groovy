package eel

class Result {
	def belongsTo = [student:User, classQuiz:ClassQuiz]
	
	int score

    static constraints = {
    }
}
