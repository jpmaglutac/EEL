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
        term(max: 9, blank: false)
        schoolYear(matches:/\d{4}\d{4}/, blank: false)
        endDate(validator: {endDate, term ->
    	    if(term.startDate){
    	        if(term.startDate.getTime() > endDate.getTime()){
    	            return false
    	        }else{
    	            return true
    	        }
    	    }
    	})
    }
}
