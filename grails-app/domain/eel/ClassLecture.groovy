package eel

class ClassLecture {
	def belongsTo = [lecture:Lecture, courseClass: CourseClass]

    static constraints = {
    }
    
    String toString(){
    	"${lecture.toString()}: ${courseClass.toString()}"
    }
}

//edited by Pepe Windows
