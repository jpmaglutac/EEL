package eel

import eel.Role

/**
 * User domain class.
 */
class User {
	static transients = ['pass']
	static hasMany = [authorities:Role]
	static belongsTo = Role

	/** Username */
	String username
	/** User Real Name*/
	String userFirstName
	String userLastName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled
	
	String courseOrDepartment

	String email
	boolean emailShow

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'
	
	String toString(){
		"${userLastName}, ${userFirstName}"
	}

	static constraints = {
		username(blank: false, unique: true)
		userFirstName(blank: false)
		userLastName(blank: false)
		passwd(blank:false, size:6..50)
		email(email: true)
		enabled()
	}
	
	def getUserRealName = {
		userFirstName + " " + userLastName
	}
}
