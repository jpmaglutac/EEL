package eel

class ResultController {
    def authenticateService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [resultInstanceList: Result.list(params), resultInstanceTotal: Result.count()]
    }
    
    def create = {
        def resultInstance = new Result()
        resultInstance.properties = params
        return [resultInstance: resultInstance]
    }

    def save = {
        def resultInstance = new Result(params)
        if (resultInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'result.label', default: 'Result'), resultInstance.id])}"
            redirect(action: "show", id: resultInstance.id)
        }
        else {
            render(view: "create", model: [resultInstance: resultInstance])
        }
    }

    def show = {
        def resultInstance = Result.get(params.id)
        if (!resultInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'result.label', default: 'Result'), params.id])}"
            redirect(action: "list")
        }
        else {
            def answerInstances = StudentAnswer.findAllByResult(resultInstance)
            
            [resultInstance: resultInstance, answerInstances: answerInstances]
        }
    }
    
    def gradebook = {
    	User user = authenticateService.userDomain()
    	CourseClass courseClass = CourseClass.get(params.id)
    	if(!courseClass)
    		redirect(controller: "courseClass", action: "listByUser")
        def allQuizzes = Result.withCriteria {
    		eq("student", user)
    		eq("submitted", true)
    		classQuiz{
    			eq("courseClass", courseClass)
    		}
    	}
        [resultInstanceList: allQuizzes]
    }

    def edit = {
        def resultInstance = Result.get(params.id)
        if (!resultInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'result.label', default: 'Result'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [resultInstance: resultInstance]
        }
    }

    def update = {
        def resultInstance = Result.get(params.id)
        if (resultInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (resultInstance.version > version) {
                    
                    resultInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'result.label', default: 'Result')] as Object[], "Another user has updated this Result while you were editing")
                    render(view: "edit", model: [resultInstance: resultInstance])
                    return
                }
            }
            resultInstance.properties = params
            if (!resultInstance.hasErrors() && resultInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'result.label', default: 'Result'), resultInstance.id])}"
                redirect(action: "show", id: resultInstance.id)
            }
            else {
                render(view: "edit", model: [resultInstance: resultInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'result.label', default: 'Result'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def resultInstance = Result.get(params.id)
        if (resultInstance) {
            try {
                resultInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'result.label', default: 'Result'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'result.label', default: 'Result'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'result.label', default: 'Result'), params.id])}"
            redirect(action: "list")
        }
    }
}
