
<%@ page import="eel.Quiz" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <g:set var="inputHours" value="${Math.floor(timeRemaining/1000/60/60).toInteger()}" />
        <g:set var="inputMinutes" value="${Math.floor((timeRemaining/1000/60)-(inputHours*60)).toInteger()}" />
        <g:set var="inputSeconds" value="${Math.floor((timeRemaining/1000)-(inputMinutes*60)).toInteger()}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    <script type="text/javascript">
    var hours, mins, secs, TimerRunning, TimerID;
    TimerRunning=false;
    
    
 
    function Init() //call the Init function when u need to start the timer
    {
        
        hours=${inputHours};
        mins=${inputMinutes};
        secs=${inputSeconds};
        StopTimer();
        StartTimer();
    }
 
    function StopTimer()
    {
        if(TimerRunning)
            clearTimeout(TimerID);
            TimerRunning=false;
    }
 
    function StartTimer()
    {
        TimerRunning=true;
        window.status="Time Remaining "+Pad(mins)+":"+Pad(secs);
        TimerID=self.setTimeout("StartTimer()",1000);
 
        Check();
        document.getElementById('txt').value=Pad(hours)+":"+Pad(mins)+":"+Pad(secs);
    
        if((hours==0 && mins==0 && secs==0)|| hours < 0)
        StopTimer();
       
        if(mins==0 && secs==0)
        {
            hours--;
            mins=60;
        }   
    
        if(secs==0)
        {
            mins--;
            secs=60;
        }
        secs--;
    }
 
    function Check()
    {
        if(mins==5 && secs==0 && hours == 0)
            alert("You have only five minutes remaining.");
        else if((hours==0 && mins==0 && secs==0)|| hours < 0)
        {
        	alert("Your alloted time is over. Your quiz will be automatically submitted.");
        	StopTimer();
            submitform();
        }
    }
 
    function Pad(number) //pads the mins/secs with a 0 if its less than 10
    {
        if(number<10)
            number=0+""+number;
        return number;
    }
    
    function submitform()
    {
        document.forms["quiz"].submit();
    }
    
    </script>
    </head>
        
     
    <body onload="Init()">
        <div class="body">
            <form id="display">
            Time Remaining: <input type="text" id="txt" />
            </form>
            
            
            <h1>${classQuiz.toString()}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="submitQuiz" name="quiz" >
            	<div class="dialog">
                	<g:each in="${items}" var="${item}" status="i">
                		<b>${i+1}. ${item.quizItem}</b><br />
                		<g:if test="${item.quizItem.quizType == eel.QuizType.IDENTIFICATION}">
                		 	<g:textField name="${item.id}_answerGiven" value="${item.answerGiven}" />
                		</g:if><g:elseif test="${item.quizItem.quizType == eel.QuizType.TRUEORFALSE}">
                			<g:radioGroup name="${item.id}_answerGiven" values="['True', 'False']" labels="['True', 'False']" value="${item.answerGiven}">
                        		${it.radio} ${it.label}<br />
                        	</g:radioGroup>
                		</g:elseif><g:elseif test="${item.quizItem.quizType == eel.QuizType.MULTIPLE}">
                			<g:radioGroup name="${item.id}_answerGiven" values="${item.quizItem.quizChoices?.id}" labels="${item.quizItem.quizChoices?.choice}" value="${item.answerGiven}">
                        		${it.radio} ${it.label}<br />
                        	</g:radioGroup>
                		</g:elseif>
                		<br /><br />
                	</g:each>
            	</div>
            	<div class="buttons">
            		<g:hiddenField name="classQuizId" value="${classQuiz.id}" />
                    <span class="button"><g:submitButton name="Submit Quiz" onClick="return confirm('Are you sure you want to finish this quiz?');"/></span>
            	</div>
            </g:form>
        </div>   
    </body>
</html>
