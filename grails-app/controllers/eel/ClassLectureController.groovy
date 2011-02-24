package eel

class ClassLectureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [classLectureInstanceList: ClassLecture.list(params), classLectureInstanceTotal: ClassLecture.count()]
    }

    def create = {
        def classLectureInstance = new ClassLecture()
        classLectureInstance.properties = params
        return [classLectureInstance: classLectureInstance]
    }

    def save = {
        def classLectureInstance = new ClassLecture(params)
        if (classLectureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), classLectureInstance.id])}"
            redirect(action: "show", id: classLectureInstance.id)
        }
        else {
            render(view: "create", model: [classLectureInstance: classLectureInstance])
        }
    }

    def show = {
        def classLectureInstance = ClassLecture.get(params.id)
        if (!classLectureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), params.id])}"
            redirect(action: "list")
        }
        else {
            [classLectureInstance: classLectureInstance]
        }
    }

    def edit = {
        def classLectureInstance = ClassLecture.get(params.id)
        if (!classLectureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [classLectureInstance: classLectureInstance]
        }
    }

    def update = {
        def classLectureInstance = ClassLecture.get(params.id)
        if (classLectureInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (classLectureInstance.version > version) {
                    
                    classLectureInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'classLecture.label', default: 'ClassLecture')] as Object[], "Another user has updated this ClassLecture while you were editing")
                    render(view: "edit", model: [classLectureInstance: classLectureInstance])
                    return
                }
            }
            classLectureInstance.properties = params
            if (!classLectureInstance.hasErrors() && classLectureInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), classLectureInstance.id])}"
                redirect(action: "show", id: classLectureInstance.id)
            }
            else {
                render(view: "edit", model: [classLectureInstance: classLectureInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def classLectureInstance = ClassLecture.get(params.id)
        if (classLectureInstance) {
            try {
                classLectureInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), params.id])}"
            redirect(action: "list")
        }
    }
}
