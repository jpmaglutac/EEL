package eel

class StudentAnswer {
	
	def belongsTo = [student: User, quizItem: QuizItem]
	
	String answerGiven

    static constraints = {
    	answerGiven(nullable: true)
    }
}
