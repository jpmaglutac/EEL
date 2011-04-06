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
    
    def editLecture = {
    	def classLecture = ClassLecture.get(params.id)
    	[lectureInstance: classLecture.lecture]
    }
    
    def updateLecture = {
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
                redirect(action: "show", id: params.classLectureId)
            }
            else {
                render(view: "edit", model: [lectureInstance: lectureInstance])
            }
        }
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
        [classLectureInstanceList: ClassLecture.findAllByCourseClass(courseClass)]
    }
    
    def listAllByUser = {
    	def user = authenticateService.userDomain()
    	def terms = Term.withCriteria {
            def now = new Date()
            and{
                lt("startDate", now)
                gt("endDate", now)
            }
        }
    	def courseClasses
    	if(authenticateService.ifAllGranted("ROLE_STUDENT")){
    		courseClasses = ClassStudent.withCriteria {
    			eq("student", user)
    			courseClass{
    				'in'("term", terms)
    			}
    		}
    		courseClasses = courseClasses.courseClass
    	}else if(authenticateService.ifAllGranted("ROLE_TEACHER")){
    		courseClasses = CourseClass.findAllByInstructorAndTermInList(user, terms)
    	}
        def lectures = ClassLecture.findAllByCourseClassInList(courseClasses)
        render(view: "listByClass", model: [classLectureInstanceList: lectures])
    }

    def create = {
        User user = authenticateService.userDomain()
        def courseClass = CourseClass.get(params.id)
        if(!courseClass){
        	flash.message = "Cannot find selected class!"
        	redirect(action: "create", id: params.id)
        }
        def lectures = Lecture.findAllByCourseAndInstructor(courseClass.course, user)
        return [lectures: lectures]
    }
    
    def addLecture = {
    	def classLectureInstance = new ClassLecture()
    	def user = authenticateService.userDomain()
    	def courseClass = CourseClass.get(params.courseClassId)
    	classLectureInstance.lecture = Lecture.get(params.lectureId)
    	classLectureInstance.courseClass = courseClass
    	if (classLectureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), classLectureInstance.id])}"
            redirect(action: "show", id: classLectureInstance.id)
        }
        else {
           	render(view: "create", model: [courseClassId: params.courseClassId, lectures: Lecture.findAllByCourseAndInstructor(courseClass.course, user), classLectureInstance: classLectureInstance, id: params.courseClassId])
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
            	render(view: "create", model: [lectures: Lecture.findAllByCourseAndInstructor(courseClass.course, user),courseClassId: params.courseClassId, lectureInstance: lectureInstance, id: params.courseClassId])
        	}
        }
        else {
            render(view: "create", model: [lectures: Lecture.findAllByCourseAndInstructor(courseClass.course, user),courseClassId: params.courseClassId, lectureInstance: lectureInstance, id: params.courseClassId])
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
            def courseClassId = classLectureInstance.courseClass.id
            try {
                classLectureInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'classLecture.label', default: 'ClassLecture'), params.id])}"
                redirect(controller: "courseClass", action: "show", id: courseClassId)
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
