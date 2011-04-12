<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
	<head>
		<title>EEL - Expert E-Learning System</title>
		<link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" type="text/css" />	
		<link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" type="text/css" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" type="text/css" />
		<script src="${resource(dir:'js',file:'jquery.js')}" type="text/javascript"></script>
		<script>
			var timeout    = 500;
			var closetimer = 0;
			var ddmenuitem = 0;

			function jsddm_open()
			{  jsddm_canceltimer();
			   jsddm_close();
			   ddmenuitem = $(this).find('ul').css('visibility', 'visible');}

			function jsddm_close()
			{  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');}

			function jsddm_timer()
			{  closetimer = window.setTimeout(jsddm_close, timeout);}

			function jsddm_canceltimer()
			{  if(closetimer)
			   {  window.clearTimeout(closetimer);
				  closetimer = null;}}

			$(document).ready(function()
			{  $('#jsddm > li').bind('mouseover', jsddm_open)
			   $('#jsddm > li').bind('mouseout',  jsddm_timer)});

			document.onclick = jsddm_close;		
		</script>
		<g:layoutHead />
        <g:javascript library="application" />
	</head>
	<body onload="${pageProperty(name:'body.onload')}">

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
				<ul id="jsddm">
					<g:ifAnyGranted role="ROLE_TEACHER,ROLE_STUDENT">
						<li><g:loggedInUserProfileLink>My Profile</g:loggedInUserProfileLink></li>
					    <li><g:link class="${(request.forwardURI=='/EEL/course/list')?'current':''}" controller="course" action="list">List Courses</g:link></li>
					    <li>
							<g:link class="${(request.forwardURI=='/EEL/courseClass/listByUser')?'current':''}" controller="courseClass" action="listByUser">My Classes</g:link>
							<ul>
								<li><g:link controller="classLecture" action="listAllByUser">Lectures</g:link></li>
								<li><g:link controller="classQuiz" action="listAllByUser">Quizzes</g:link></li>
							</ul>
						</li>
				        <li><g:link class="${(request.forwardURI=='/EEL/courseClass/listByTerm')?'current':''}" controller="courseClass" action="listByTerm">Historical Class List</g:link></li>
				        
					</g:ifAnyGranted>
					<g:ifAnyGranted role="ROLE_ADMIN">
						<li><g:loggedInUserProfileLink>My Profile</g:loggedInUserProfileLink></li>
						<li><g:link class="${(request.forwardURI=='/EEL/user/list')?'current':''}" controller="user" action="list">Users</g:link>
						<li>
						    <g:link class="${(request.forwardURI=='/EEL/course/list')?'current':''}" controller="course" action="list">Courses</g:link>
						    <ul>
						        <li><g:link controller="passingRates" action="index">Passing Rates</g:link></li>
						    </ul>
						</li>
						
						<li><g:link class="${(request.forwardURI=='/EEL/term/list')?'current':''}" controller="term" action="list">Terms</g:link></li>
					</g:ifAnyGranted>
				</ul>
			</div>
			<div id="body-container">
				<g:layoutBody />
			</div>
			<div id="body-bottom">

			</div>
			<div id="footer">
				Expert E-Learning &copy; 2011 
			</div>

		</div> <!-- end wrapper -->
	</body>
</html>
