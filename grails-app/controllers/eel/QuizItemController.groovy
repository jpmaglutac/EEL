package eel

import java.util.Random

class QuizItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [quizItemInstanceList: QuizItem.list(params), quizItemInstanceTotal: QuizItem.count()]
    }
    
    def chooseType = {
    }
    
    def chooseGeneratedType = {
    	def quiz = Quiz.get(params.id)
    	def lectures = Lecture.findAllByInstructorAndCourse(quiz.instructor, quiz.course)
    	[lectures: lectures]
    }
    
    def goToType = {
    	redirect(action: params.quizType, id: params.id)
    }
    
    def generateType = {
    	def lecture = Lecture.get(params.lectureId)
    	def lectureDefinitions = LectureDefinition.findAllByLecture(lecture)
    	Collections.shuffle(lectureDefinitions)
    	def quizType = QuizType.valueOf(params.quizType)
    	def rand = new Random()
    	if(lectureDefinitions.size()==0){
    		flash.message = "Cannot generate questions for selected lecture"
    		redirect(controller: "quiz", action: "show", id: params.id)
    	}
    	def item = new QuizItem()
    	def quiz = Quiz.get(params.id)
    	item.quiz = quiz
    	item.quizType = quizType
    	
    	switch(quizType){
    		case QuizType.IDENTIFICATION:
    			item.correctAns = lectureDefinitions[0].identifier
    			item.question = lectureDefinitions[0].definition
    			break
    		case QuizType.TRUEORFALSE:
    			def torf = (rand.nextInt()%2==0)
    			if(lectureDefinitions.size()==1)
    				torf = true
    			def identifier = lectureDefinitions[0].identifier
    			if(torf)
    				item.correctAns = "True"
    			else{
    				item.correctAns = "False"
    				identifier = lectureDefinitions[1]?.identifier
    			}
    			item.question = "Identify if the statement below is true or false.\n ${identifier}: ${lectureDefinitions[0].definition}"
    			break
    		case QuizType.MULTIPLE:
    			def numChoices = (lectureDefinitions.size()>4)?4:lectureDefinitions.size()
    			if(lectureDefinitions.size()==1){
    				flash.message = "Cannot generate questions for selected type of question"
    				redirect(controller: "quiz", action: "show", id: params.id)
    				return 
    			}
    			item.question = lectureDefinitions[0].definition
    			item.save(flush: true)
    			for(int i=0; i!=numChoices; i++){
    				def quizChoice = new QuizChoice()
    				quizChoice.choice = lectureDefinitions[i].identifier
    				quizChoice.quizItem = item
    				quizChoice.save(flush: true)
    				if(i==0)
    					item.correctAns = quizChoice.id.toString()
    			}
    			break
    	}
    	if (item.save(flush: true)) {
            quiz.addToQuizItems(item)
	        quiz.save(flush:true)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), item.id])}"
            redirect(controller: "quizItem", action: "show", id: item.id, params: [definitionId: lectureDefinitions[0].id])
        }

    }
    
    def MULTIPLE = {
    
    }
    
    def saveMULTIPLE = {
	    Quiz quiz = Quiz.get(params.quizId)
	    if(quiz){
	        def quizItem = new QuizItem()
	        quizItem.quiz = quiz
	        quizItem.quizType = QuizType.MULTIPLE
	        quizItem.question = params.question
	        if(quizItem.save(flush:true)){
	            quiz.addToQuizItems(quizItem)
	            quiz.save(flush:true)
	            redirect(action: "enterChoices", id: quizItem.id)
	        }
	    }else{
	        redirect(controller: "quiz")
	    }
    }
    
    def enterChoices = {
        def quizItemInstance = QuizItem.get(params.id)
        [quizItemInstance: quizItemInstance]
    }
    
    def saveChoices = {
        def quizItemInstance = QuizItem.get(params.id)
        if(!quizItemInstance){
            redirect(controller: "quiz")
            return
        }
        quizItemInstance.correctAns = params.correctAns
        if (quizItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), quizItemInstance.id])}"
            redirect(controller: "quiz", action: "show", id: quizItemInstance.quiz.id)
        }
        else {
            render(view: "enterChoices", model: [id: params.quizItemId, quizItemInstance: quizItemInstance])
        }
    }
    
    def IDENTIFICATION = {
    
    }
    
    def saveIDENTIFICATION = {
    	def quizItemInstance = new QuizItem(params)
    	quizItemInstance.quizType = QuizType.IDENTIFICATION
    	Quiz quiz = Quiz.get(params.quizId)
    	if(quiz){ quizItemInstance.quiz = quiz }
        if (quizItemInstance.save(flush: true)) {
            quiz.addToQuizItems(quizItemInstance)
	        quiz.save(flush:true)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), quizItemInstance.id])}"
            redirect(controller: "quiz", action: "show", id: quizItemInstance.quiz.id)
        }
        else {
            render(view: "IDENTIFICATION", model: [id: params.quizId, quizItemInstance: quizItemInstance])
        }
    }
    
    def TRUEORFALSE = {
    
    }
    
    def saveTRUEORFALSE = {
    	def quizItemInstance = new QuizItem(params)
    	quizItemInstance.quizType = QuizType.TRUEORFALSE
    	Quiz quiz = Quiz.get(params.quizId)
    	if(quiz){ quizItemInstance.quiz = quiz }
        if (quizItemInstance.save(flush: true)) {
            quiz.addToQuizItems(quizItemInstance)
	        quiz.save(flush:true)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), quizItemInstance.id])}"
            redirect(controller: "quiz", action: "show", id: quizItemInstance.quiz.id)
        }
        else {
            render(view: "IDENTIFICATION", model: [id: params.quizId, quizItemInstance: quizItemInstance])
        }
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
        if(quizItemInstance.quizType == QuizType.MULTIPLE){
        	redirect(action: "enterChoices", id: params.id)
        	return
        }
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
                redirect(controller: "quiz", action: "show", id: quizItemInstance.quiz.id)
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
    
    def removeDefinition = {
    	if(params.definitionId){
        	def definition = LectureDefinition.get(params.definitionId)
            definition?.delete(flush: true)
        }
        def quizItemInstance = QuizItem.get(params.id)
        def quizId = quizItemInstance.quiz.id
        println params
        if (quizItemInstance) {
            try {
            	def quizChoices = QuizChoice.findAllByQuizItem(quizItemInstance)
            	quizChoices.each {
            		quizItemInstance.removeFromQuizChoices(it)
            		it.delete(flush: true)
            	}
                quizItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
                redirect(controller:"quiz", action: "show", id:quizId)
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

    def delete = {
        def quizItemInstance = QuizItem.get(params.id)
        def quizId = quizItemInstance.quiz.id
        println params
        if (quizItemInstance) {
            try {
            	def quizChoices = QuizChoice.findAllByQuizItem(quizItemInstance)
            	quizChoices.each {
            		quizItemInstance.removeFromQuizChoices(it)
            		it.delete(flush: true)
            	}
                quizItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'quizItem.label', default: 'QuizItem'), params.id])}"
                redirect(controller:"quiz", action: "show", id:quizId)
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
    
    def useItem = {
    	def quizItemInstance = QuizItem.get(params.id)
        def quizId = quizItemInstance.quiz.id
        redirect(controller:"quiz", action: "show", id:quizId)
    }
}
