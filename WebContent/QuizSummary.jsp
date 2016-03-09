<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ek+Mukta">
<style>

.carousel-control{
  top: 50%
}

/* .carousel-indicators {
  bottom: -500px;
}

.carousel-inner {
   margin-bottom: 500px;
} */

.carousel slide background-image {
    opacity: 0.4;
}

/* .bodycontainer { 
	overflow-y: auto; 
}
.table-scrollable { 
	margin: 0; padding: 0; 
} */

tr {
width: 100%;
display: inline-table;
table-layout: fixed;
}

table{
 height: 400px;              
 display: -moz-groupbox;    
}

tbody{
  overflow-y: scroll;      
  height: 400px; 
  width: 100%;          
  position: absolute;
}

</style>
<title>Quiz Summary</title>
</head>

<body>
<!-- <div style="position: fixed;  width: 100%; height: 80px; top: 0px;">
<h1>Quiz Summary</h1>
</div> -->

<%
  	String quizID = (String) request.getParameter("quizID"); 
	String userID = (String) request.getParameter("userID"); 
  	Quiz quizTest = (Quiz) session.getAttribute("quiz");
 	if(quizTest==null){
  		Quiz newQuiz = new Quiz();
  		session.setAttribute("quiz",newQuiz);
  	}
 	Quiz quiz = (Quiz) session.getAttribute("quiz");
 	quiz.setQuizID(quizID);
  	quiz.setUser(userID);
  	
	String name = quiz.getName();
	String author = quiz.getAuthor();
	String description = quiz.getDescription();
	QuizSummary quizSummary = quiz.getQuizSummary();
	int takeNum = quizSummary.getTakeNum();
	double mean = quizSummary.getMeanScore();
	double max = quizSummary.getMaxScore();
	double min = quizSummary.getMinScore();
	boolean isOnePage = quiz.isOnePage();
	boolean isPracticeMode = quiz.isPracticeMode();
	String link = "QuizTakingOnePage.jsp";
	String linkPractice = "QuizTakingOnePagePractice.jsp";
	if (!isOnePage) {
		link = "QuizTakingMultiPage.jsp";
		linkPractice = "QuizTakingMultiPagePractice.jsp";
	}
	
/*  	String name = "Name";
	String author = "Author";
	String description = "Description";
	int takeNum = 10;
	double mean = 88.77;
	double max = 100;
	double min = 60.88; */

%>

<div id="myCarousel" class="carousel slide" data-ride="carousel"
     style="position: fixed;  width: 100%; height: 80%; top: 0; left: 0; text-align: center; background-image: linear-gradient(rgba(255,255,255,0.4),rgba(255,255,255,0.4)), url('http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_527bf56961712_1.JPG')">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    <li data-target="#myCarousel" data-slide-to="5"></li>
    <li data-target="#myCarousel" data-slide-to="6"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" style="opacity: 2">
    <div class="item active"
    	style="position: fixed;  width: 600px; margin-left: -300px; left: 50%;">
    	<h2>Basic Information</h2> 
    	<h2>     </h2>
    	<h4>Name: <%=name %></h4>
    	<h2>     </h2>
    	<h4>Author: <%=author %></h4>
    	<h2>     </h2>
    	<h4>Description: <%=description %></h4>
    </div>
    
    <div class="item"
    	style="position: fixed;  width: 500px; margin-left: -250px; left: 50%;">
    	<h2>Statistics</h2>
    	<h2>     </h2>
    	<h4>Number of Takers: <%=takeNum %></h4>
    	<h2>     </h2>
    	<h4>Mean Score: <%=mean %></h4>
    	<h2>     </h2>
    	<h4>Max Score: <%=max %></h4>
    	<h2>     </h2>
    	<h4>Min Score: <%=min %></h4>
    </div>
    
    <div class="item"
    	style="position: fixed;  width: 500px; margin-left: -250px; left: 50%;">
    	<h2>Performances History</h2>
    	
    	<table class="table" >
<!--     	<table class="table table-striped table-hover table-condensed" > -->
    	<thead>
     		 <tr>
        		<th class="text-center">Time</th>
        		<th class="text-center">Score</th>
        		<th class="text-center">Duration</th>
      		 </tr>
    	</thead>
<!--    		 </table> -->
   		 
<!--    		 <div class="bodycontainer scrollable">
         <table class="table table-hover table-striped table-condensed table-scrollable"> -->
   		 <tbody>
    	<%
/*     	    ArrayList<Performance> perfU = quizSummary.getUserPerformance();
    		for (int i = 0; i < perfU.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfU.get(i).getStartTime();
        		per[1] = String.valueOf(perfU.get(i).getScore());
        		per[2] = perfU.get(i).getDuration();
        		if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
        		for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(per[j]);
        			out.println("</td>");
        		}
        		out.println("</tr>");
    		} */
    		for (int i = 0; i < 100; i++) {
    			String[] per = new String[3];
        		per[0] = "1";
        		per[1] = "2";
        		per[2] = "3";
        		if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
        		for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(per[j]);
        			out.println("</td>");
        		}
        		out.println("</tr>");	
    		}
    	%>
          </tbody>
      </table>
       <!--    </div> -->
    </div>

    <div class="item"
    	style="position: fixed;  width: 500px; margin-left: -250px; left: 50%;">
    	<h2>Highest Performances</h2>
    	<table class="table" >
    	<thead>
     		 <tr>
        		<th class="text-center">UserID</th>
        		<th class="text-center">Score</th>
        		<th class="text-center">Duration</th>
      		 </tr>
   		 </thead>
   		 <tbody>
    	<%
    	    ArrayList<Performance> perfH = quizSummary.getHighestPerformers();
    		for (int i = 0; i < perfH.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfH.get(i).getUserID();
        		per[1] = String.valueOf(perfH.get(i).getScore());
        		per[2] = perfH.get(i).getDuration();
        		if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
        		for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(per[j]);
        			out.println("</td>");
        		}
        		out.println("</tr>");	
    		}
    	%>
          </tbody>
          </table>
    </div>

    <div class="item"
    	style="position: fixed;  width: 500px; margin-left: -250px; left: 50%;">
        <h2>Highest Performances Last Day</h2>
    	<table class="table" >
    	<thead>
     		 <tr>
        		<th class="text-center">UserID</th>
        		<th class="text-center">Score</th>
        		<th class="text-center">Duration</th>
      		 </tr>
   		 </thead>
   		 <tbody>
    	<%
     		ArrayList<Performance> perfHLD = quizSummary.getHighestPerformersLastDay();
    		for (int i = 0; i < perfHLD.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfHLD.get(i).getUserID();
        		per[1] = String.valueOf(perfHLD.get(i).getScore());
        		per[2] = perfHLD.get(i).getDuration();
        		if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
        		for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(per[j]);
        			out.println("</td>");
        		}
        		out.println("</tr>");	
    		}		
    	%>
          </tbody>
          </table>
    </div>

    <div class="item"
    	style="position: fixed;  width: 500px; margin-left: -250px; left: 50%;">
        <h2>Recent Good Performances</h2>
    	<table class="table" >
    	<thead>
     		 <tr>
        		<th class="text-center">UserID</th>
        		<th class="text-center">Score</th>
        		<th class="text-center">Duration</th>
      		 </tr>
   		 </thead>
   		 <tbody>
    	<%
    	    ArrayList<Performance> perfG = quizSummary.getGoodPerformers();
    		for (int i = 0; i < perfG.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfG.get(i).getUserID();
        		per[1] = String.valueOf(perfG.get(i).getScore());
        		per[2] = perfG.get(i).getDuration();
        		if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
        		for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(per[j]);
        			out.println("</td>");
        		}
        		out.println("</tr>");	
    		}
    	%>
          </tbody>
          </table>
    </div>
    
    <div class="item"
    	style="position: fixed;  width: 500px; margin-left: -250px; left: 50%;">
        <h2>Recent Bad Performances</h2>
    	<table class="table" >
    	<thead>
     		 <tr>
        		<th class="text-center">UserID</th>
        		<th class="text-center">Score</th>
        		<th class="text-center">Duration</th>
      		 </tr>
   		 </thead>
   		 <tbody>
    	<%
    	    ArrayList<Performance> perfB = quizSummary.getBadPerformers();
    		for (int i = 0; i < perfB.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfB.get(i).getStartTime();
        		per[1] = String.valueOf(perfB.get(i).getScore());
        		per[2] = perfB.get(i).getDuration();
        		if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
        		for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(per[j]);
        			out.println("</td>");
        		}
        		out.println("</tr>");	
    		}
    	%>
          </tbody>
          </table>
    </div>
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="text-center"
style="position: fixed;  width: 100%; height: 20%; top: 80%; left: 0; background-color: rgba(225, 196, 193, 0.6)">
<h2>     </h2>
<a href=<%=link%> class="btn btn-info" role="button">Start Quiz</a>
<!-- <a href="QuizTakingMultiPage.jsp" class="btn btn-info" role="button">Start Quiz</a> -->
<%
if (isPracticeMode) {
	out.println("<a href=\"" + linkPractice+ "\" class=\"btn btn-info\" role=\"button\">Practice</a>");
} else {
	out.println("<a class=\"btn btn-info\" disabled=\"disabled\" role=\"button\">Practice</a>");
}
%>
<%-- <a href=<%=link%> class="btn btn-info" role="button">Practice</a> --%>
<a href="QuizTakingOnePage.jsp" class="btn btn-info"  role="button">Edit Quiz</a>
</div>
</body>
</html>