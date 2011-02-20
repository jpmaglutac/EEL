package eel

class CourseClass {
	def belongsTo = [teacher:Teacher, course:Course]

	String section
	int term
	String schoolYear
	String enrollmentKey

    static constraints = {
    }
}
