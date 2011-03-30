package eel

class QuizItem {

    QuizType quizType
    static hasMany = [quizChoices: QuizChoice]
    String correctAns
    String question
    def belongsTo = [quiz: Quiz]
    Lecture relatedLecture

    static constraints = {
        correctAns(nullable: true, blank: false)
        question(nullable: true, blank: false)
        relatedLecture(nullable: true)
    }
    
    String toString(){
    	"${question}"
    }
}
