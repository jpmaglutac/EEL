package eel

class ClassQuizController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def authenticateService

    def create = {
        def quizInstance = new Quiz()
        quizInstance.properties = params
        return [quizInstance: quizInstance]
    }

    def save = {
        def quizInstance = new Quiz(params)
    	User user = authenticateService.userDomain()
		quizInstance.instructor = user
		def courseClass = CourseClass.get(params.courseClassId)
		if(!courseClass)
			redirect(controller: "courseClass", action: "listByUser")
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

}
