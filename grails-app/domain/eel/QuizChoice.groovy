package eel

class QuizChoice {
	String choice
	def belongsTo = [quizItem: QuizItem]
	
	String toString(){
		"${choice}"
	}
}
