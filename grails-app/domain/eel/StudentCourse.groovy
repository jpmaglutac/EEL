package eel

class StudentCourse {
	def belongsTo = [student: Student, course: Course]

    static constraints = {
    }
}
