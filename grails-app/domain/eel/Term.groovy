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
        term(min: 1, max: 9, unique: "schoolYear", blank: false)
        schoolYear(matches:/\d{4}\d{4}/, blank: false)
        startDate(validator: {startDate, term ->
        	def date = new Date()
        	date = date.previous()
    	    if(date.getTime() > startDate.getTime()){
    	        return false
    	    }else{
    	        return true
    	    }
    	})
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
