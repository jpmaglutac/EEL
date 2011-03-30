package eel

class QuizChoice {
	String choice
	def belongsTo = [quizItem: QuizItem]
	
	static constraints = {
	    choice(unique: "quizItem", blank: false)
	}
	
	String toString(){
		"${choice}"
	}
}
