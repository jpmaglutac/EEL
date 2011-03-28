package eel

class CourseClass {
	def belongsTo = [instructor:User, course:Course, term: Term]
	def hasMany = [classQuizzes: ClassQuiz, classLectures: ClassLecture, classStudents: ClassStudent]

	String section
	String enrollmentKey

    static constraints = {
    }
    
    String toString(){
    	"${course.courseCode} - ${section}"
    }
}
