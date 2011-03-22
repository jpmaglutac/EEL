package eel

class Result {
	def belongsTo = [student:User, classQuiz:ClassQuiz]
	
	static hasMany = [studentAnswers: StudentAnswer]
	
	int score
	
	Date dateCreated
	
	def beforeInsert = {
    	dateCreated = new Date()
	}

    static constraints = {
    }
}
