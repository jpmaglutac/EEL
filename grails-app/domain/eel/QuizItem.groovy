package eel

class QuizItem {

    QuizType quizType
    def hasMany = [quizChoices: QuizChoice]
    String correctAns
    def belongsTo = [quiz: Quiz]

    static constraints = {
    }
}
