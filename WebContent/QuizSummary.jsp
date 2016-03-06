<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.*" %>
    <%@ page import="java.util.ArrayList" %>
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
.clearfix:after {
    display:block;
    clear:both;
}
 
/*----- Menu Outline -----*/
.menu-wrap {
    width:100%;
    box-shadow:0px 1px 3px rgba(0,0,0,0.2);
    background:#3e3436;
}
 
.menu {
    width:250px;
    margin:0px auto;
}
 
.menu li {
    margin:0px;
    list-style:none;
    font-family:'Ek Mukta';
}
 
.menu a {
    transition:all linear 0.15s;
    color:#919191;
}
 
.menu li:hover > a, .menu .current-item > a {
    text-decoration:none;
    color:#be5b70;
}
 
.menu .arrow {
    font-size:11px;
    line-height:0%;
}
 
/*----- Top Level -----*/
.menu > ul > li {
    float:left;
    display:inline-block;
    position:relative;
    font-size:19px;
}
 
.menu > ul > li > a {
    padding:10px 30px;
    display:inline-block;
    text-shadow:0px 1px 0px rgba(0,0,0,0.4);
}
 
.menu > ul > li:hover > a, .menu > ul > .current-item > a {
    background:#2e2728;
}
 
/*----- Bottom Level -----*/
.menu li:hover .sub-menu {
    z-index:1;
    opacity:1;
}
 
.sub-menu {
    width:140%;
    padding:5px 0px;
    position:absolute;
    top:100%;
    left:0px;
    z-index:-1;
    opacity:0;
    transition:opacity linear 0.15s;
    box-shadow:0px 2px 3px rgba(0,0,0,0.2);
    background:#2e2728;
}
 
.sub-menu li {
    display:block;
    font-size:16px;
}
 
.sub-menu li a {
    padding:10px 30px;
    display:block;
}
 
.sub-menu li a:hover, .sub-menu .current-item a {
    background:#3e3436;
}

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

</style>
<title>Quiz Summary</title>
</head>

<body>
<!-- <div style="position: fixed;  width: 100%; height: 80px; top: 0px;">
<h1>Quiz Summary</h1>
</div> -->

<%
  	String quizID = (String) request.getAttribute("quizID"); 
	String userID = (String) request.getAttribute("userID"); 
  	Quiz quiz = (Quiz) session.getAttribute("quiz");
 	if(quiz==null){
  		Quiz newQuiz = new Quiz();
  		session.setAttribute("quiz",newQuiz);
  	}
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
    	<thead>
     		 <tr>
        		<th class="text-center">Time</th>
        		<th class="text-center">Score</th>
        		<th class="text-center">Duration</th>
      		 </tr>
   		 </thead>
   		 <tbody>
    	<%
    	    ArrayList<Performance> perfU = quizSummary.getUserPerformance();
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
    		}
    		
/*     		for (int i = 0; i < 10; i++) {
    			if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
    			for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(j);
        			out.println("</td>");
        		}
        		out.println("</tr>");
    		}  */
    	%>
          </tbody>
          </table>
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
    		
/*     		for (int i = 0; i < 10; i++) {
    			if (i % 2 == 0) {
        			out.println("<tr class=\"success\">");
        		} else {
        			out.println("<tr class=\"warning\">");
        		}
    			for (int j = 0; j < 3; j++) {
        			out.println("<td>");
        			out.println(j);
        			out.println("</td>");
        		}
        		out.println("</tr>");
    		} */
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
<a href="QuizTaking.jsp" class="btn btn-info" role="button">Start Quiz</a>
<a href="QuizTaking.jsp" class="btn btn-info" role="button">Practice</a>
<a href="QuizTaking.jsp" class="btn btn-info"  role="button">Edit Quiz</a>
</div>
</body>
</html>