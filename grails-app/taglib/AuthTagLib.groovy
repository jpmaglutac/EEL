class AuthTagLib {
	def authenticateService
	
	def loggedInUserFullName = {attrs, body ->
		def user = authenticateService.userDomain()
		if(user){
			out << user.toString()
		}
	}
	
	def loggedInUserProfileLink = {attrs, body ->
	    def user = authenticateService.userDomain()
		if(user){
		    def profilePage = "/EEL/profile/view/${user.id}"
			out << "<a class='${(request.forwardURI==profilePage)?'current':''}' href='${createLink(controller: 'profile', action: 'view', id: user.id)}'>${body()}</a>"
		}
	}

}
