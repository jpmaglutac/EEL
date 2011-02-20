package eel

class Lecture {
	def belongsTo = [course: Course]
	
	String title
	String documentLocation

    static constraints = {
    }
}
