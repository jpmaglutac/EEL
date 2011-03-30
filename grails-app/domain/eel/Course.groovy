package eel

class Course {

	String courseCode
	String description
	String department
	
	String toString() {
		"${courseCode}: ${description}"
	}

    static constraints = {
        courseCode(unique: true)
    }
}
