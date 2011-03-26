package eel

class QuizItem {

    QuizType quizType
    static hasMany = [quizChoices: QuizChoice]
    String correctAns
    String question
    def belongsTo = [quiz: Quiz]
    Lecture relatedLecture

    static constraints = {
        correctAns(nullable: true)
        question(nullable: true)
        relatedLecture(nullable: true)
    }
    
    String toString(){
    	"${question}"
    }
}
