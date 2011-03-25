class AuthTagLib {
	def authenticateService
	
	def loggedInUserFullName = {attrs, body ->
		def user = authenticateService.userDomain()
		if(user){
			out << user.toString()
		}
	}

}
