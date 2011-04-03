package eel

class CourseClassController {

    def authenticateService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
    
    def joinClass = {
    	CourseClass courseClass = CourseClass.get(params.id)
    	[courseClass: courseClass]
    }
    
    def addStudent = {
    	User user = authenticateService.userDomain()
    	CourseClass courseClass = CourseClass.get(params.courseClassId)
    	if(params.enrollmentKey != courseClass.enrollmentKey){
    		flash.message = "Incorrect enrollment key!"
    		redirect(action: "joinClass", id: courseClass.id)
    	}else{
    		ClassStudent classStudent = new ClassStudent(student: user, courseClass: courseClass)
    		if(classStudent.save(flush: true)){
    			flash.message = "Welcome to this class!"
    			redirect(action: "show", id: courseClass.id)
    		}else{
    			flash.message = "Something went wrong!"
    			redirect(action: "joinClass", id: courseClass.id)
    		}
    	}
    }
    
    def instructorList = {
    	User user = authenticateService.userDomain()
    	params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [courseClassInstanceList: CourseClass.findAllByInstructor(user, params), courseClassInstanceTotal: CourseClass.count()]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [courseClassInstanceList: CourseClass.list(params), courseClassInstanceTotal: CourseClass.count()]
    }
    
    def listByCourse = {
        Course course = Course.get(params.id)
        if(!course){
            redirect(controller:"course", action: "list")
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def terms = Term.withCriteria {
            def now = new Date()
            and{
                lt("startDate", now)
                gt("endDate", now)
            }
        }
        def courseClasses = CourseClass.findAllByCourseAndTermInList(course, terms, params)
        [courseClassInstanceList: courseClasses, courseClassInstanceTotal: CourseClass.findAllByCourseAndTermInList(course, terms).size()]
    }
    
    def listByTerm = {
    	User user = authenticateService.userDomain()
    	def term
    	if(!params.term){
    	    term = Term.withCriteria {
                def now = new Date()
                and{
                    lt("startDate", now)
                    gt("endDate", now)
                }
            }
            term = term[0]
        }else{
            term = Term.get(params.term)
        }
    	def courseClasses
    	if(authenticateService.ifAllGranted("ROLE_STUDENT")){
    		courseClasses = ClassStudent.withCriteria {
    			eq("student", user)
    			courseClass{
    				eq("term", term)
    			}
    		}
    		courseClasses = courseClasses.courseClass
    	}else if(authenticateService.ifAllGranted("ROLE_TEACHER")){
    		courseClasses = CourseClass.findAllByInstructorAndTerm(user, term)
    		
    	}else{
    		redirect(action: "list")
    		return
    	}
    	[term: term, courseClassInstanceList: courseClasses]
    }
    
    def listByUser = {
	
    	User user = authenticateService.userDomain()
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
    		
    	}else{
    		redirect(action: "list")
    		return
    	}
    	[courseClassInstanceList: courseClasses]
    }

    def create = {
        def courseClassInstance = new CourseClass()
        courseClassInstance.properties = params
        return [courseClassInstance: courseClassInstance]
    }

    def save = {
        def courseClassInstance = new CourseClass(params)
        def course = Course.get(params.courseId)
        User user = authenticateService.userDomain() 
        if(user){
        	courseClassInstance.instructor = user
        }else{
        	redirect(controller: "login")
        	return
     	}
     	if(course){
     	    courseClassInstance.course = course
     	}else{
     	    println "course not found"
     	    redirect(controller: "course")
     	    return
     	}
        if (courseClassInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), courseClassInstance.id])}"
            redirect(action: "show", id: courseClassInstance.id)
        }
        else {
            render(view: "create", model: [courseId: params.courseId, courseClassInstance: courseClassInstance])
        }
    }

    def show = {
		def courseClass = CourseClass.get(params.id)//show list of lectures by class
        def courseClassInstance = CourseClass.get(params.id)
        User user = authenticateService.userDomain()
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		//show list of lectures by class
		if(!courseClass){
            redirect(controller: "courseClass", action: "listByUser")
            return
        }
        if(authenticateService.ifAnyGranted("ROLE_STUDENT")&&!ClassStudent.findByStudentAndCourseClass(user,courseClassInstance)){
        	
        	redirect(action:"joinClass", id: courseClassInstance.id)
        }
        if (!courseClassInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'courseClass.label', default: 'CourseClass'), params.id])}"
            redirect(action: "list")
        }
        else {
        	def quizzes
        	if(authenticateService.ifAllGranted("ROLE_TEACHER")){
        		quizzes = ClassQuiz.findAllByCourseClass(courseClass)
        	}else{
        		quizzes = ClassQuiz.withCriteria {
            		def now = new Date()
            		and{
                		lt("startDate", now)
                		gt("endDate", now)
                		eq("courseClass", courseClass)
            		}
        		}
        	}
            [classQuizInstanceList: quizzes, courseClassInstance: courseClassInstance, classLectureInstanceList: ClassLecture.findAllByCourseClass(courseClass, params)]
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
