package eel

class Quiz {
	def belongsTo = [course: Course]
	
	def noItems
	
    static constraints = {
    }
}
