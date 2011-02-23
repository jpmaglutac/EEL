package eel

class Quiz {
	def belongsTo = [instructor: User]
	
	def noItems
	
    static constraints = {
    }
}
