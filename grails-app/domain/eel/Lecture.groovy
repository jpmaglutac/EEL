package eel


class Lecture {
	def belongsTo = [instructor: User]
	
	String title
	UFile file

    static constraints = {
    }
}
