package eel

class CourseClass {
	def belongsTo = [instructor:User, course:Course, term: Term]
	def hasMany = [classQuizzes: ClassQuiz, classLectures: ClassLecture, classStudents: ClassStudent]

	String section
	String enrollmentKey
	boolean canViewResults

    static constraints = {
        section(blank: false, unique: ["course", "term"])
        enrollmentKey(blank: false)
    }
    
    String toString(){
    	"${course.courseCode} - ${section}"
    }
}
