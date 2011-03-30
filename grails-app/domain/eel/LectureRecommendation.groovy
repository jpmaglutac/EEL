package eel

class LectureRecommendation {
	
	def belongsTo = [lecture:Lecture, result: Result]

    static constraints = {
        lecture(unique: "result")
    }
}
