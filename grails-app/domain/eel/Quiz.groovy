package eel

class Quiz {
    String name
	def belongsTo = [instructor: User]
    static hasMany = [quizItems: QuizItem]
	
    static constraints = {
    }
    
    String toString(){
    	"${name}"
    }
    
}
