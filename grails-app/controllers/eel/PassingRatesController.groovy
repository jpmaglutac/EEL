package eel

class PassingRatesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        //redirect(action: "list", params: params)
        def passingRate = PassingRates.list()[0]
        redirect(action: "show", id: passingRate.id)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [passingRatesInstanceList: PassingRates.list(params), passingRatesInstanceTotal: PassingRates.count()]
    }

    def create = {
        def passingRatesInstance = new PassingRates()
        passingRatesInstance.properties = params
        return [passingRatesInstance: passingRatesInstance]
    }

    def save = {
        def passingRatesInstance = new PassingRates(params)
        if (passingRatesInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), passingRatesInstance.id])}"
            redirect(action: "show", id: passingRatesInstance.id)
        }
        else {
            render(view: "create", model: [passingRatesInstance: passingRatesInstance])
        }
    }

    def show = {
        def passingRatesInstance = PassingRates.get(params.id)
        if (!passingRatesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), params.id])}"
            redirect(controller: "courseClass", action: "index")
        }
        else {
            [passingRatesInstance: passingRatesInstance]
        }
    }

    def edit = {
        def passingRatesInstance = PassingRates.get(params.id)
        if (!passingRatesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [passingRatesInstance: passingRatesInstance]
        }
    }

    def update = {
        def passingRatesInstance = PassingRates.get(params.id)
        if (passingRatesInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (passingRatesInstance.version > version) {
                    
                    passingRatesInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'passingRates.label', default: 'PassingRates')] as Object[], "Another user has updated this PassingRates while you were editing")
                    render(view: "edit", model: [passingRatesInstance: passingRatesInstance])
                    return
                }
            }
            passingRatesInstance.properties = params
            if (!passingRatesInstance.hasErrors() && passingRatesInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), passingRatesInstance.id])}"
                redirect(action: "show", id: passingRatesInstance.id)
            }
            else {
                render(view: "edit", model: [passingRatesInstance: passingRatesInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), params.id])}"
            redirect(controller: "courseClass", action: "index")
        }
    }

    def delete = {
        def passingRatesInstance = PassingRates.get(params.id)
        if (passingRatesInstance) {
            try {
                passingRatesInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'passingRates.label', default: 'PassingRates'), params.id])}"
            redirect(action: "list")
        }
    }
}
