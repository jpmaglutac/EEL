package eel

class ProfileController {

    def authenticateService
    
    def view = {
        def user = User.get(params.id)
        boolean isUser = false
        if(!user){
            redirect(action: "index")
        }
        def loggedInUser = authenticateService.userDomain()
        if(user.id == loggedInUser?.id){
            isUser = true
        }
        [person: user, isUser: isUser]
    }
    
    def edit = {

		def person = User.get(params.id)
		if (!person) {
			flash.message = "User not found with id $params.id"
			redirect action: index
			return
		}

		return buildPersonModel(person)
	}

	/**
	 * Person update action.
	 */
	def update = {
		def role
		def person = User.get(params.id)
		if (!person) {
			flash.message = "User not found with id $params.id"
			redirect action: "edit", id: params.id
			return
		}

		long version = params.version.toLong()
		if (person.version > version) {
			person.errors.rejectValue 'version', "person.optimistic.locking.failure",
				"Another user has updated this User while you were editing."
				render view: 'edit', model: buildPersonModel(person)
			return
		}

		def oldPassword = person.passwd
		person.properties = params
		if(authenticateService.encodePassword(params.oldpassword) != oldPassword){
		    flash.message = "The inputted current password is incorrect!"
		    render(view: "edit", model: buildPersonModel(person))
		    return
		}
		if(params.password != params.repassword){
		    flash.message = "The password and retyped password do not match!"
		    render(view: "edit", model: buildPersonModel(person))
		    return
		}
		if (!params.password.equals(oldPassword)&&params.password) {
			person.passwd = authenticateService.encodePassword(params.password)
		}
		if (person.save()) {
			redirect(action: "view", id: person.id)
		}
		else {
			render view: 'edit', model: buildPersonModel(person)
		}
	}
	
	private Map buildPersonModel(person) {

		List roles = Role.list()
		roles.sort { r1, r2 ->
			r1.authority <=> r2.authority
		}
		Set userRoleNames = []
		for (role in person.authorities) {
			userRoleNames << role.authority
		}
		LinkedHashMap<Role, Boolean> roleMap = [:]
		for (role in roles) {
			roleMap[(role)] = userRoleNames.contains(role.authority)
		}

		return [person: person, roleMap: roleMap]
	}


}
