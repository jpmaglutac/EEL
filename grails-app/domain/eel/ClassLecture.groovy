package eel

class ClassLecture {
	def belongsTo = [lecture:Lecture, classCourse: ClassCourse]

    static constraints = {
    }
}
