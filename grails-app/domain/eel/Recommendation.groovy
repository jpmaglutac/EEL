package eel

class Recommendation {
	def belongsTo = [result: Result, user: User]
	
	def hasMany = [lectureRecommendations: LectureRecommendation]

    static constraints = {
    }
}
