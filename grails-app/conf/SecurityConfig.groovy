security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "eel.User"
	authorityDomainClass = "eel.Role"
	requestMapClass = "eel.Requestmap"
	
	// added for config'd requestmap
	useRequestMapDomainClass = true
}
