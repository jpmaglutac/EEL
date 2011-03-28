package eel

class Term {

	int term
	String schoolYear
	Date startDate
	Date endDate
	
	String toString(){
		"${term}-${schoolYear}"
	}

    static constraints = {
    }
}
