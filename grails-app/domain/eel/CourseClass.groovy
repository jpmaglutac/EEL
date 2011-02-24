package eel

class CourseClass {
	def belongsTo = [instructor:User, course:Course]
	def hasMany = [classQuizzes: ClassQuiz, classLectures: ClassLecture, classStudents: ClassStudent]

	String section
	int term
	String schoolYear
	String enrollmentKey

    static constraints = {
    }
}
