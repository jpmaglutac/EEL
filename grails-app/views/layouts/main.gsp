<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
	<head>
		<title>EEL - Expert E-Learning System</title>
		<link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" type="text/css" />	
		<link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" type="text/css" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" type="text/css" />
		<g:layoutHead />
        <g:javascript library="application" />
	</head>
	<body>

		<div id="wrapper">

			<div id="top-bar">
				<g:isLoggedIn>
					Welcome, <g:loggedInUserFullName /> . <g:link controller="logout">Logout?</g:link>
				</g:isLoggedIn>
				<g:isNotLoggedIn>
					You are not logged in. <g:link controller="login">Login?</g:link>
				</g:isNotLoggedIn>
			</div>
			<div id="banner">

			</div>
			<div id="nav-bar">
				<ul>
					<li><a href="${createLink(uri: '/')}" class="${(request.forwardURI=='/EEL/')?'current':''}">Home</a></li>
					<li><g:link class="${(request.forwardURI=='/EEL/course/list')?'current':''}" controller="course" action="list">List Courses</g:link></li>
					<li><g:link class="${(request.forwardURI=='/EEL/courseClass/listByUser')?'current':''}" controller="courseClass" action="listByUser">My Classes</g:link></li>
				    <li><g:link class="${(request.forwardURI=='/EEL/courseClass/listByTerm')?'current':''}" controller="courseClass" action="listByTerm">Historical Class List</g:link></li>
				    <li><g:loggedInUserProfileLink>My Profile</g:loggedInUserProfileLink></li>
				</ul>
			</div>
			<div id="body-container">
				<g:layoutBody />
			</div>
			<div id="body-bottom">

			</div>
			<div id="footer">
				Lorem ipsum dolor sit amet &copy; 2011
			</div>

		</div> <!-- end wrapper -->
	</body>
</html>
