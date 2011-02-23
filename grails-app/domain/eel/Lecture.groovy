package eel

class Lecture {
	def belongsTo = [instructor: User]
	
	String title
	String documentLocation

    static constraints = {
    }
}
