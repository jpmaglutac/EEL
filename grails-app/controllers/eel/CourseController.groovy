package eel

class CourseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [courseInstanceList: Course.list(params), courseInstanceTotal: Course.count()]
    }

    def create = {
        def courseInstance = new Course()
        courseInstance.properties = params
        return [courseInstance: courseInstance]
    }

    def save = {
        def courseInstance = new Course(params)
        if (courseInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])}"
            redirect(action: "show", id: courseInstance.id)
        }
        else {
            render(view: "create", model: [courseInstance: courseInstance])
        }
    }

    def show = {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])}"
            redirect(action: "list")
        }
        else {
            [courseInstance: courseInstance]
        }
    }

    def edit = {
        def courseInstance = Course.get(params.id)
        if (!courseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [courseInstance: courseInstance]
        }
    }

    def update = {
        def courseInstance = Course.get(params.id)
        if (courseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (courseInstance.version > version) {
                    
                    courseInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'course.label', default: 'Course')] as Object[], "Another user has updated this Course while you were editing")
                    render(view: "edit", model: [courseInstance: courseInstance])
                    return
                }
            }
            courseInstance.properties = params
            if (!courseInstance.hasErrors() && courseInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])}"
                redirect(action: "show", id: courseInstance.id)
            }
            else {
                render(view: "edit", model: [courseInstance: courseInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def courseInstance = Course.get(params.id)
        if (courseInstance) {
            try {
                courseInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'course.label', default: 'Course'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'course.label', default: 'Course'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])}"
            redirect(action: "list")
        }
    }
}
