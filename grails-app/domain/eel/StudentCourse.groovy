package eel

class StudentCourse {
	def belongsTo = [student: User, course: Course]

    static constraints = {
    }
}
