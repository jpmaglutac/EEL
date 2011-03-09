package eel

class Quiz {
        String name
	def belongsTo = [instructor: User]
        def hasMany = [quizItems: QuizItem]
	
    static constraints = {
    }
}
