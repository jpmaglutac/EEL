package eel

class Quiz {
    String name
	def belongsTo = [instructor: User, course: Course]
    static hasMany = [quizItems: QuizItem]
	
    static constraints = {
    }
    
    String toString(){
    	"${name}"
    }
    
}
