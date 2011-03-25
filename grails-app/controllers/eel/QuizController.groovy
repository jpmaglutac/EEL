package eel

class QuizController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def authenticateService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [quizInstanceList: Quiz.list(params), quizInstanceTotal: Quiz.count()]
    }

    def create = {
        def quizInstance = new Quiz()
        quizInstance.properties = params
        return [quizInstance: quizInstance]
    }

    def save = {
        def quizInstance = new Quiz(params)
    	User user = authenticateService.userDomain()
	quizInstance.instructor = user
        if (quizInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quiz.label', default: 'Quiz'), quizInstance.id])}"
            redirect(action: "show", id: quizInstance.id)
        }
        else {
            render(view: "create", model: [quizInstance: quizInstance])
        }
    }

    def show = {
        def quizInstance = Quiz.get(params.id)
        if (!quizInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), params.id])}"
            redirect(action: "list")
        }
        else {
            [quizInstance: quizInstance, quizItems: QuizItem.findAllByQuiz(quizInstance)]
        }
    }

    def edit = {
        def quizInstance = Quiz.get(params.id)
        if (!quizInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [quizInstance: quizInstance]
        }
    }

    def update = {
        def quizInstance = Quiz.get(params.id)
        if (quizInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (quizInstance.version > version) {
                    
                    quizInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'quiz.label', default: 'Quiz')] as Object[], "Another user has updated this Quiz while you were editing")
                    render(view: "edit", model: [quizInstance: quizInstance])
                    return
                }
            }
            quizInstance.properties = params
            if (!quizInstance.hasErrors() && quizInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'quiz.label', default: 'Quiz'), quizInstance.id])}"
                redirect(action: "show", id: quizInstance.id)
            }
            else {
                render(view: "edit", model: [quizInstance: quizInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def quizInstance = Quiz.get(params.id)
        if (quizInstance) {
            try {
                quizInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'quiz.label', default: 'Quiz'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'quiz.label', default: 'Quiz'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), params.id])}"
            redirect(action: "list")
        }
    }
}
