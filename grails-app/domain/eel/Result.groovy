package eel

class Result {
	def belongsTo = [student:User, classQuiz:ClassQuiz]
	
	static hasMany = [studentAnswers: StudentAnswer, lectureRecommendations: LectureRecommendation]
	
	int score
	boolean submitted
	
	Date dateCreated
	
	def beforeInsert = {
    	dateCreated = new Date()
	}

    static constraints = {
        student(unique: "classQuiz")
    }
}
