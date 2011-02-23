package eel

class CourseClassController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [courseClassInstanceList: CourseClass.list(params), courseClassInstanceTotal: CourseClass.count()]
    }

    def create = {
        def courseClassInstance = new CourseClass()
        courseClassInstance.properties = params
        return [courseClassInstance: courseClassInstance]
    }

    def save = {
        def courseClassInstance = new CourseClass(params)
        if (courseClassInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), courseClassInstance.id])}"
            redirect(action: "show", id: courseClassInstance.id)
        }
        else {
            render(view: "create", model: [courseClassInstance: courseClassInstance])
        }
    }

    def show = {
        def courseClassInstance = CourseClass.get(params.id)
        if (!courseClassInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), params.id])}"
            redirect(action: "list")
        }
        else {
            [courseClassInstance: courseClassInstance]
        }
    }

    def edit = {
        def courseClassInstance = CourseClass.get(params.id)
        if (!courseClassInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [courseClassInstance: courseClassInstance]
        }
    }

    def update = {
        def courseClassInstance = CourseClass.get(params.id)
        if (courseClassInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (courseClassInstance.version > version) {
                    
                    courseClassInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'courseClass.label', default: 'CourseClass')] as Object[], "Another user has updated this CourseClass while you were editing")
                    render(view: "edit", model: [courseClassInstance: courseClassInstance])
                    return
                }
            }
            courseClassInstance.properties = params
            if (!courseClassInstance.hasErrors() && courseClassInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), courseClassInstance.id])}"
                redirect(action: "show", id: courseClassInstance.id)
            }
            else {
                render(view: "edit", model: [courseClassInstance: courseClassInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def courseClassInstance = CourseClass.get(params.id)
        if (courseClassInstance) {
            try {
                courseClassInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), params.id])}"
            redirect(action: "list")
        }
    }
}
