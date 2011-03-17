package eel

class ClassLectureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
	//edited by catzie
    def fileUploadService
    def authenticateService
    def fileReadingService

    def index = {
        redirect(action: "list", params: params)
    }
    
    def readFile = {
    	ClassLecture classLecture = ClassLecture.get(params.id)
    	fileReadingService.readFile(classLecture.lecture.file)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [classLectureInstanceList: ClassLecture.list(params), classLectureInstanceTotal: ClassLecture.count()]
    }
    
    def listByClass = {
        def courseClass = CourseClass.get(params.id)
        if(!courseClass){
            redirect(controller: "courseClass", action: "listByUser")
            return
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [classLectureInstanceList: ClassLecture.findAllByCourseClass(courseClass, params), classLectureInstanceTotal: ClassLecture.findAllByCourseClass(courseClass).size()]
    }

    def create = {
        def classLectureInstance = new ClassLecture()
        User user = authenticateService.userDomain()
        def courseClass = CourseClass.get(params.id)
        if(!courseClass){
        	flash.message = "Cannot find selected class!"
        	redirect(action: "create", id: params.id)
        }
        def lectures = Lecture.findAllByCourseAndInstructor(courseClass.course, user)
        classLectureInstance.properties = params
        return [classLectureInstance: classLectureInstance, lectures: lectures]
    }
    
    def addLecture = {
    	def classLectureInstance = new ClassLecture()
    	def courseClass = CourseClass.get(params.courseClassId)
    	classLectureInstance.lecture = Lecture.get(params.lectureId)
    	classLectureInstance.courseClass = courseClass
    	if (classLectureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), classLectureInstance.id])}"
            redirect(action: "show", id: classLectureInstance.id)
        }
        else {
           	render(view: "create", model: [lectureInstance: lectureInstance, id: params.courseClassId])
        }
    }

    def save = {
    	def msg
        def lectureInstance = new Lecture()
        def courseClass = CourseClass.get(params.courseClassId)
        if(!courseClass){
        	flash.message("Cannot find selected class!")
        	redirect(action: "create", id: params.courseClassId)
        }
        lectureInstance.title = params.title
        lectureInstance.course = courseClass.course
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
        	redirect(action: "create", id: params.courseClassId)
        }
        if (lectureInstance.save(flush: true)) {
        	def classLectureInstance = new ClassLecture()
        	classLectureInstance.lecture = lectureInstance
        	classLectureInstance.courseClass = courseClass
        	if (classLectureInstance.save(flush: true)) {
        		fileReadingService.saveDefinitions(lectureInstance)
            	flash.message = "${message(code: 'default.created.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), classLectureInstance.id])}"
            	redirect(action: "show", id: classLectureInstance.id)
        	}
        	else {
            	render(view: "create", model: [lectureInstance: lectureInstance, id: params.courseClassId])
        	}
        }
        else {
            render(view: "create", model: [lectureInstance: lectureInstance, id: params.courseClassId])
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
