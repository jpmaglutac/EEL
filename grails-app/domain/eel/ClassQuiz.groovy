package eel

class ClassQuiz {
	def belongsTo = [quiz: Quiz, courseClass:CourseClass]
	
	Date startDate
	Date endDate
	
    static constraints = {
    	endDate(validator: {endDate, classQuiz ->
    	    if(classQuiz.startDate){
    	        if(classQuiz.startDate.getTime() > endDate.getTime()){
    	            return false
    	        }else{
    	            return true
    	        }
    	    }
    	})
    	quiz(unique: "courseClass")
    }
    
    String toString(){
    	"${quiz.toString()}: ${courseClass.toString()}"
    }
}
