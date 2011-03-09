package eel

class QuizItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [quizItemInstanceList: QuizItem.list(params), quizItemInstanceTotal: QuizItem.count()]
    }

    def create = {
        def quizItemInstance = new QuizItem()
        quizItemInstance.properties = params
        return [quizItemInstance: quizItemInstance]
    }

    def save = {
        def quizItemInstance = new QuizItem(params)
        if (quizItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), quizItemInstance.id])}"
            redirect(action: "show", id: quizItemInstance.id)
        }
        else {
            render(view: "create", model: [quizItemInstance: quizItemInstance])
        }
    }

    def show = {
        def quizItemInstance = QuizItem.get(params.id)
        if (!quizItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [quizItemInstance: quizItemInstance]
        }
    }

    def edit = {
        def quizItemInstance = QuizItem.get(params.id)
        if (!quizItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [quizItemInstance: quizItemInstance]
        }
    }

    def update = {
        def quizItemInstance = QuizItem.get(params.id)
        if (quizItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (quizItemInstance.version > version) {
                    
                    quizItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'quizItem.label', default: 'QuizItem')] as Object[], "Another user has updated this QuizItem while you were editing")
                    render(view: "edit", model: [quizItemInstance: quizItemInstance])
                    return
                }
            }
            quizItemInstance.properties = params
            if (!quizItemInstance.hasErrors() && quizItemInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), quizItemInstance.id])}"
                redirect(action: "show", id: quizItemInstance.id)
            }
            else {
                render(view: "edit", model: [quizItemInstance: quizItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def quizItemInstance = QuizItem.get(params.id)
        if (quizItemInstance) {
            try {
                quizItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
            redirect(action: "list")
        }
    }
}
