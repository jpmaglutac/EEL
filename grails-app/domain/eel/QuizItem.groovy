package eel

class QuizItem {

    QuizType quizType
    static hasMany = [quizChoices: QuizChoice]
    String correctAns
    String question
    def belongsTo = [quiz: Quiz]

    static constraints = {
        correctAns(nullable: true)
        question(nullable: true)
    }
    
    String toString(){
    	"${question}"
    }
}
