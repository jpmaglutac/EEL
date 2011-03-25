package eel

class QuizChoiceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [quizChoiceInstanceList: QuizChoice.list(params), quizChoiceInstanceTotal: QuizChoice.count()]
    }

    def create = {
        def quizChoiceInstance = new QuizChoice()
        quizChoiceInstance.properties = params
        return [quizChoiceInstance: quizChoiceInstance]
    }

    def save = {
        def quizChoiceInstance = new QuizChoice(params)
        QuizItem quizItem = QuizItem.get(params.quizItemId)
        quizChoiceInstance.quizItem = quizItem
        if (quizChoiceInstance.save(flush: true)) {
            quizItem.addToQuizChoices(quizChoiceInstance)
            quizItem.save(flush:true)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), quizChoiceInstance.id])}"
            redirect(action: "enterChoices", controller: "quizItem", id: quizItem.id)
        }
        else {
            render(view: "create", model: [quizChoiceInstance: quizChoiceInstance, id: quizItem?.id])
        }
    }

    def show = {
        def quizChoiceInstance = QuizChoice.get(params.id)
        if (!quizChoiceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), params.id])}"
            redirect(action: "list")
        }
        else {
            [quizChoiceInstance: quizChoiceInstance]
        }
    }

    def edit = {
        def quizChoiceInstance = QuizChoice.findByChoice(params.id)
        if (!quizChoiceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), params.id])}"
            redirect(controller: "quizItem", action: "enterChoices", id: params.quizItemId)
        }
        else {
            return [quizChoiceInstance: quizChoiceInstance, quizItemId: params.quizItemId]
        }
    }

    def update = {
        def quizChoiceInstance = QuizChoice.get(params.id)
        if (quizChoiceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (quizChoiceInstance.version > version) {
                    
                    quizChoiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'quizChoice.label', default: 'QuizChoice')] as Object[], "Another user has updated this QuizChoice while you were editing")
                    render(view: "edit", model: [quizChoiceInstance: quizChoiceInstance, quizItemId: params.quizItemId])
                    return
                }
            }
            quizChoiceInstance.properties = params
            if (!quizChoiceInstance.hasErrors() && quizChoiceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), quizChoiceInstance.id])}"
                redirect(controller: "quizItem", action: "enterChoices", id: params.quizItemId)
            }
            else {
                render(view: "edit", model: [quizChoiceInstance: quizChoiceInstance, quizItemId: params.quizItemId])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), params.id])}"
            redirect(controller: "quizItem", action: "enterChoices", id: params.quizItemId)
        }
    }

    def delete = {
        def quizChoiceInstance = QuizChoice.get(params.id)
        if (quizChoiceInstance) {
            try {
                quizChoiceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), params.id])}"
                redirect(controller: "quizItem", action: "enterChoices", id: params.quizItemId)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'quizChoice.label', default: 'QuizChoice'), params.id])}"
            redirect(controller: "quizItem", action: "enterChoices", id: params.quizItemId)
        }
    }
}
