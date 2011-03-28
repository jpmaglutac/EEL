package eel

class TermController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [termInstanceList: Term.list(params), termInstanceTotal: Term.count()]
    }

    def create = {
        def termInstance = new Term()
        termInstance.properties = params
        return [termInstance: termInstance]
    }

    def save = {
        def termInstance = new Term(params)
        if (termInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'term.label', default: 'Term'), termInstance.id])}"
            redirect(action: "show", id: termInstance.id)
        }
        else {
            render(view: "create", model: [termInstance: termInstance])
        }
    }

    def show = {
        def termInstance = Term.get(params.id)
        if (!termInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), params.id])}"
            redirect(action: "list")
        }
        else {
            [termInstance: termInstance]
        }
    }

    def edit = {
        def termInstance = Term.get(params.id)
        if (!termInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [termInstance: termInstance]
        }
    }

    def update = {
        def termInstance = Term.get(params.id)
        if (termInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (termInstance.version > version) {
                    
                    termInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'term.label', default: 'Term')] as Object[], "Another user has updated this Term while you were editing")
                    render(view: "edit", model: [termInstance: termInstance])
                    return
                }
            }
            termInstance.properties = params
            if (!termInstance.hasErrors() && termInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'term.label', default: 'Term'), termInstance.id])}"
                redirect(action: "show", id: termInstance.id)
            }
            else {
                render(view: "edit", model: [termInstance: termInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def termInstance = Term.get(params.id)
        if (termInstance) {
            try {
                termInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'term.label', default: 'Term'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'term.label', default: 'Term'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), params.id])}"
            redirect(action: "list")
        }
    }
}
