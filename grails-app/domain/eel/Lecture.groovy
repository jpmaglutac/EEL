package eel


class Lecture {
	def belongsTo = [instructor: User, course: Course]
	
	String title
	UFile file

    static constraints = {
    	title(blank: false, unique: ["instructor", "course"])
    }
    
    String toString(){
    	"${title}"
    }
}
