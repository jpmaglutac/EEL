import eel.*

class BootStrap {

    def init = { servletContext ->
    	(new Role(authority: "ROLE_STUDENT", description: "Student")).save(flush: true)
    	(new Role(authority: "ROLE_TEACHER", description: "Teacher")).save(flush: true)
    }
    def destroy = {
    }
}
