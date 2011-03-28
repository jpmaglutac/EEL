package eel

class LectureRecommendation {
	
	def belongsTo = [lecture:Lecture, recommendation:Recommendation]

    static constraints = {
    }
}
