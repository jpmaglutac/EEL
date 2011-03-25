package eel

class Quiz {
    String name
	def belongsTo = [instructor: User, course: Course]
    static hasMany = [quizItems: QuizItem]
    
    long timeAllotted
	
    static constraints = {
    }
    
    String toString(){
    	"${name}"
    }
    
}
