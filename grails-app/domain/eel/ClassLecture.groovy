package eel

class ClassLecture {
	def belongsTo = [lecture:Lecture, courseClass: CourseClass]

    static constraints = {
    }
}
