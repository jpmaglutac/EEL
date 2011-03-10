package eel

class QuizItem {

    QuizType quizType
    def hasMany = [quizChoices: QuizChoice]
    String correctAns
    String question
    def belongsTo = [quiz: Quiz]

    static constraints = {
        correctAns(nullable: true)
        question(nullable: true)
    }
}
