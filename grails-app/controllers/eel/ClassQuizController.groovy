package eel

class ClassQuizController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def authenticateService

    def create = {
        def courseClass = CourseClass.get(params.id)
        User user = authenticateService.userDomain()
        def quizzes = Quiz.findAllByCourseAndInstructor(courseClass.course, user)
        return [quizzes: quizzes]
    }
    
    def checkQuiz = {
    	def quiz = Quiz.get(params.quizId)
    	[quizInstance: quiz]
    }
    
    def addQuiz = {
    	def quiz = Quiz.get(params.quizId)
    	def courseClass = CourseClass.get(params.courseClassId)
    	def classQuiz = new ClassQuiz(params)
    	classQuiz.quiz = quiz
    	classQuiz.courseClass = courseClass
    	if (classQuiz.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'classQuiz.label', default: 'Class Quiz'), classQuiz.id])}"
            redirect(controller: "quiz", action: "show", id: quiz.id)
        }
        else {
            render(view: "checkQuiz", model: [quizInstance: quizInstance, classQuizInstance: classQuiz])
        }
    }

    def save = {
        def quizInstance = new Quiz(params)
        def timeAllotted = (params.timeAllottedHours.toInteger()*60+params.timeAllottedMins.toInteger())*60*1000
    	quizInstance.timeAllotted = timeAllotted
    	User user = authenticateService.userDomain()
		quizInstance.instructor = user
		def courseClass = CourseClass.get(params.courseClassId)
		if(!courseClass)
			redirect(controller: "courseClass", action: "listByUser")
		quizInstance.course = courseClass.course
        if (quizInstance.save(flush: true)) {
        	def classQuiz = new ClassQuiz(params)
        	classQuiz.quiz = quizInstance
        	classQuiz.courseClass = courseClass
        	classQuiz.save(flush: true)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quiz.label', default: 'Quiz'), quizInstance.id])}"
            redirect(controller: "quiz", action: "show", id: quizInstance.id)
        }
        else {
            render(view: "create", model: [quizInstance: quizInstance])
        }
    }
    
    def listActiveByClass = {
        def courseClass = CourseClass.get(params.id)
        if(!courseClass)
            redirect(controller: "courseClass", action: "listByUser")
        def quizzes = ClassQuiz.withCriteria {
            def now = new Date()
            and{
                lt("startDate", now)
                gt("endDate", now)
                eq("courseClass", courseClass)
            }
        }
        [quizInstanceList:quizzes]
    }
    
    def initializeQuiz = {
    	def user = authenticateService.userDomain()
    	def classQuiz = ClassQuiz.get(params.id)
    	Result result = new Result()
		result.classQuiz = classQuiz
		result.student = user
		result.score = 0
		result.save(flush: true)
    	if(user&&classQuiz){
    		def quizItems = classQuiz.quiz.quizItems.asList()
    		Collections.shuffle(quizItems)
    		quizItems.each {
    			if(StudentAnswer.countByStudentAndQuizItem(user, it)==0){
    				def studentAnswer = new StudentAnswer(student: user, quizItem: it)
    				studentAnswer.save(flush: true)
    			}
    		}
    		redirect(action: "takeQuiz", id: params.id)
    	}
    }
    
    def startQuiz = {
    	ClassQuiz quiz = ClassQuiz.get(params.id)
    	[quiz: quiz]
    }
    
	def takeQuiz = {
		ClassQuiz classQuiz = ClassQuiz.get(params.id)
		def user = authenticateService.userDomain()
		def result = Result.findByStudentAndClassQuiz(user, classQuiz)
		def timeRemaining = classQuiz.quiz.timeAllotted - ((new Date()).getTime() - result.dateCreated.getTime())
		def items = StudentAnswer.findAllByStudentAndQuizItemInList(user, classQuiz.quiz.quizItems, [sort: "id", order: "asc"])
		[classQuiz: classQuiz, items: items, timeRemaining: timeRemaining]
	}
	
	def submitQuiz = {
		def score = 0
		def user = authenticateService.userDomain()
		def classQuiz = ClassQuiz.get(params.classQuizId)
		def result = Result.findByStudentAndClassQuiz(user, classQuiz)
		def answersGiven = params.findAll {
			it.toString().contains("answerGiven")
		}
		answersGiven.each {
			def id = it.key[0]
			def studentAnswer = StudentAnswer.get(id)
			studentAnswer.answerGiven = it.value
			studentAnswer.result = result
			studentAnswer.save(flush: true)
			result.addToStudentAnswers(studentAnswer)
			result.save(flush: true)
			if(studentAnswer.answerGiven == studentAnswer.quizItem.correctAns){
				score++
			}
		}
		result.score = score
		result.save(flush: true)
		redirect(controller: "courseClass", action: "show", id: classQuiz.courseClass.id)
	}

}
