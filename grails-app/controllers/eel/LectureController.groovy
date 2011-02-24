package eel

class LectureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def fileUploadService
    def authenticateService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [lectureInstanceList: Lecture.list(params), lectureInstanceTotal: Lecture.count()]
    }

    def create = {
        def lectureInstance = new Lecture()
        lectureInstance.properties = params
        return [lectureInstance: lectureInstance]
    }

    def save = {
    	def msg
        def lectureInstance = new Lecture()
        lectureInstance.title = params.title
        User user = authenticateService.userDomain() 
        if(user){
        	lectureInstance.instructor = user
        }else{
        	redirect(controller: "login")
     	}
     	try{
        	lectureInstance.file = fileUploadService.uploadFile(request.getFile("file"), msg)
        }catch(Exception e){
        	flash.message = e.getMessage()
        	redirect(action: "create")
        }
        if (lectureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'lecture.label', default: 'Lecture'), lectureInstance.id])}"
            redirect(action: "show", id: lectureInstance.id)
        }
        else {
            render(view: "create", model: [lectureInstance: lectureInstance])
        }
    }

    def show = {
        def lectureInstance = Lecture.get(params.id)
        if (!lectureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), params.id])}"
            redirect(action: "list")
        }
        else {
            [lectureInstance: lectureInstance]
        }
    }

    def edit = {
        def lectureInstance = Lecture.get(params.id)
        if (!lectureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [lectureInstance: lectureInstance]
        }
    }

    def update = {
        def lectureInstance = Lecture.get(params.id)
        if (lectureInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (lectureInstance.version > version) {
                    
                    lectureInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lecture.label', default: 'Lecture')] as Object[], "Another user has updated this Lecture while you were editing")
                    render(view: "edit", model: [lectureInstance: lectureInstance])
                    return
                }
            }
            lectureInstance.properties = params
            if (!lectureInstance.hasErrors() && lectureInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lecture.label', default: 'Lecture'), lectureInstance.id])}"
                redirect(action: "show", id: lectureInstance.id)
            }
            else {
                render(view: "edit", model: [lectureInstance: lectureInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def lectureInstance = Lecture.get(params.id)
        if (lectureInstance) {
            try {
                lectureInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'lecture.label', default: 'Lecture'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'lecture.label', default: 'Lecture'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lecture.label', default: 'Lecture'), params.id])}"
            redirect(action: "list")
        }
    }
}
