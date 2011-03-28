package eel

class StudentAnswer {
	
	def belongsTo = [student: User, quizItem: QuizItem, result: Result]
	
	String answerGiven

    static constraints = {
    	answerGiven(nullable: true)
    	result(nullable: true)
    }
}
