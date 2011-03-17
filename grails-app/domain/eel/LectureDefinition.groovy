package eel

class LectureDefinition {

	static belongsTo = [lecture: Lecture]
	
	String identifier
	String definition

    static constraints = {
    }
}
