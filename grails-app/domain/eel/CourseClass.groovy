package eel

class CourseClass {
	def belongsTo = [teacher:User, course:Course]

	String section
	int term
	String schoolYear
	String enrollmentKey

    static constraints = {
    }
}
