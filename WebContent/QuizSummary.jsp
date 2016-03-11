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

/*----- Menu Outline -----*/
.menu-wrap {
	width: 100%;
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);
	background: black;
}

.menu {
	width: 300px;
	margin: 0px auto;
}

.menu li {
	margin: 0px;
	list-style: none;
	font-family: 'Ek Mukta';
}

.menu a {
	transition: all linear 0.15s;
	color: #919191;
}

.menu li:hover>a, .menu .current-item>a {
	text-decoration: none;
	color: #be5b70;
}

.menu .arrow {
	font-size: 11px;
	line-height: 0%;
}

/*----- Top Level -----*/
.menu>ul>li {
	float: left;
	display: inline-block;
	position: relative;
	font-size: 19px;
}

.menu>ul>li>a {
	padding: 10px 30px;
	display: inline-block;
	text-shadow: 0px 1px 0px rgba(0, 0, 0, 0.4);
}

.menu>ul>li:hover>a, .menu>ul>.current-item>a {
	background: #2e2728;
}

/*----- Bottom Level -----*/
.menu li:hover .sub-menu {
	z-index: 1;
	opacity: 1;
}

.sub-menu {
	width: 140%;
	padding: 5px 0px;
	position: absolute;
	top: 100%;
	left: 0px;
	z-index: -1;
	opacity: 0;
	transition: opacity linear 0.15s;
	box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.2);
	background: #2e2728;
}

.sub-menu li {
	display: block;
	font-size: 16px;
}

.sub-menu li a {
	padding: 10px 30px;
	display: block;
}

.sub-menu li a:hover, .sub-menu .current-item a {
	background: #3e3436;
}

.carousel-control.left, 
.carousel-control.right {
    background-image: none
}

tr {
width: 100%;
display: inline-table;
table-layout: fixed;
}

table{
 height: 300px;              
 display: -moz-groupbox;    
}

tbody{
  overflow-y: scroll;      
  height: 300px; 
  width: 100%;          
  position: absolute;
}

<script type='text/javascript'>
	function pageScrollUp(position) {
		var yPos = window.pageYOffset;
		yPos -= 95;
		if (yPos < position) {
			yPos = position;
		}
		window.scroll(0, yPos); // horizontal and vertical scroll increments
		scrolldelay = setTimeout('pageScrollUp(\'' + position + '\')', 45); // scrolls every 100 milliseconds
		if (yPos == position) {
			clearTimeout(scrolldelay);
		}
	}
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip({
	        placement : 'top'
	    });
	});
	$(function() {
		$('[data-tooltip="true"]').tooltip();
		});
	function myFunction() {
	    document.getElementById("receiver").defaultValue = "Goofy";
	}
	
</script>

</style>
<title>Quiz Summary</title>
</head>

<body style="height:770px;background-size:100%;background-color:#fffff6;">
<!-- <div style="position: fixed;  width: 100%; height: 80px; top: 0px;">
<h1>Quiz Summary</h1>
</div> -->

<div
		style="position: fixed; width: 100%; height: 50px; top: 0px; left: 0; z-index: 2; text-align: center; background-color: black; color: #FAF0E6; opacity: 0.95;">

		<div
			style="position: absolute; left: 0px; width: 300px; height: 100%; background-color: black;">
			<div style="position: absolute; left: 0px; top: 5px; width: 250px; height: 45; background-color: black;">
				<a href="HomePage.jsp"><h4 style="color:#ffb3b3;">QuizThatShit</h4></a>
			</div>
		</div>

		<div class="col-lg-6"
			style="position: absolute; top: 8px; left: 30%; width: 40%;">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="font-size:20px;"></span></button>
				</span>
			</div>
			<!-- /input-group -->
		</div>
		<div
			style="position: absolute; right: 5px; width: 300px; height: 100%; background-color: black;">

			<div class="menu-wrap">
				<nav class="menu">
					<ul class="clearfix">
						<li><a href="javascript:pageScrollUp(0)" style="color:yellow;">
							<%
								String userID = (String) session.getAttribute("userID");
								String welcome = "Hi "+userID+"!";
								out.println(welcome);
							%>
							</a>
						</li>
						<li><a href="#">Menu<span class="arrow">&#9660;</span></a>
							<ul class="sub-menu">
								<% String userIDUrl = "QuizCreat.jsp?userID="+userID; 
								   out.print("<li><a href=\""+ userIDUrl+"\">Create Quiz</a></li>");
								%>
								<% String quizRecordUrl = "UserViewHistory.jsp"; 
								   out.print("<li><a href=\""+ quizRecordUrl+"\">Quiz Record</a></li>");
								%>
								<% String announceUrl = "UserViewAnnoun.jsp"; 
								   out.print("<li><a href=\""+ announceUrl +"\">Announcements</a></li>");
								%>
								<li><a href="UserLogin.jsp">Logout</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- /.col-lg-6 -->
	</div>

<%
  	String quizID = (String) request.getParameter("quizID"); 
/* 	String userID = (String) request.getParameter("userID"); */ 
  	Quiz quizTest = (Quiz) session.getAttribute("quiz");
 	if(quizTest==null){
  		Quiz newQuiz = new Quiz();
  		session.setAttribute("quiz",newQuiz);
  	}
 	Quiz quiz = (Quiz) session.getAttribute("quiz");
 	quiz.setQuizID(quizID);
  	quiz.setUser(userID);
  	
  	String url = quiz.getImage();
	String name = quiz.getName();
	String author = quiz.getAuthor();
	String description = quiz.getDescription();
	QuizSummary quizSummary = quiz.getQuizSummary();
	String takeNum = quizSummary.getTakeNum();
	String mean = quizSummary.getMeanScore();
	String max = quizSummary.getMaxScore();
	String min = quizSummary.getMinScore();
	boolean isOnePage = quiz.isOnePage();
	boolean isPracticeMode = quiz.isPracticeMode();
	String link = "QuizTakingOnePage.jsp";
	String linkPractice = "QuizTakingOnePagePractice.jsp";
	if (!isOnePage) {
		link = "QuizTakingMultiPage.jsp";
		linkPractice = "QuizTakingMultiPagePractice.jsp";
	}

%>
<div style="border-radius: 20px; position: relative; top: 65px; left: 50%; width: 800px; height: 550px; margin-left: -400px; border-radius: 10px; background-color: rgba(0, 0, 0, 0); overflow: hidden; border: 2px solid #73AD21; padding: 15px;">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" data-interval="4000"
			style="border-radius: 20px; position: relative; left: 0%; width: 100%; height: 100%;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active" style="background-color: #73AD21"></li>
    <li data-target="#myCarousel" data-slide-to="1" style="background-color: #73AD21"></li>
    <li data-target="#myCarousel" data-slide-to="2" style="background-color: #73AD21"></li>
    <li data-target="#myCarousel" data-slide-to="3" style="background-color: #73AD21"></li>
    <li data-target="#myCarousel" data-slide-to="4" style="background-color: #73AD21"></li>
    <li data-target="#myCarousel" data-slide-to="5" style="background-color: #73AD21"></li>
    <li data-target="#myCarousel" data-slide-to="6" style="background-color: #73AD21"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" style="width: 600px; left: 50%; margin-left: -300px">
    <div class="item active" style="height:450px;text-align:center;">

    	<h2 style="color:#C71585;">Basic Information</h2> 
    	<center>
    	<img src=<%=url %> width="140" height="140" border="0" class="img-circle">
    	</center>
    	<h2>     </h2>
    	<h4>Name: <%=name %></h4>
    	<h2>     </h2>
    	<h4>Author: <%=author %></h4>
    	<h2>     </h2>
    	<h4>Description: <%=description %></h4>
    	<div>
    	<span><strong>Categories: </strong></span>
    	<%
			String[] colors = new String[4];
/* 			colors[0] = "success";
			colors[1] = "info";
			colors[2] = "warning";
			colors[3] = "danger"; */
			ArrayList<String> cates = Category.getCategory(quiz.getQuizID());
			for (int i = 0; i < cates.size(); i++) {
				if (i % 3 == 0) {
				out.print("<span class=\"label label-success\">" + cates.get(i) + "</span>");
				} else if (i % 3 == 2) {
				out.print("<span class=\"label label-info\">" + cates.get(i) + "</span>");
				} else {
				out.print("<span class=\"label label-danger\">" + cates.get(i) + "</span>");
				}
								
			}
		%>	
		</div>
		<div>
    	<span><strong>Tags: </strong></span>
    	<%
/* 			String[] colors = new String[4];
			colors[0] = "success";
			colors[1] = "info";
			colors[2] = "warning";
			colors[3] = "danger"; */
			ArrayList<String> tags = Tag.getTags(quiz.getQuizID());
			for (int i = 0; i < tags.size(); i++) {
				if (i % 3 == 0) {
				out.print("<span class=\"label label-success\">" + tags.get(i) + "</span>");
				} else if (i % 3 == 2) {
				out.print("<span class=\"label label-info\">" + tags.get(i) + "</span>");
				} else {
				out.print("<span class=\"label label-danger\">" + tags.get(i) + "</span>");
				}
								
			}
		%>
		</div>
    </div>
    
    <div class="item"
    	style="height:450px;text-align:center;">
    	<h2 style="color:#C71585;">Statistics</h2>
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
    	style="height:450px;text-align:center;">
    	<h2 style="color:#C71585;">Performances History</h2>
    	
    	<div class="panel panel-default" style="height: 60px; background: rgba(122, 130, 136, 0.2)">
		<div class="panel-body"
			style="font-family: 'Ek Mukta'; color: #C71585; font-size: 18px; font-weight: bold;">
			<div class="row">
			   <div class="col-sm-2 text-left">Questions</div>
			
				<div class = "btn-group btn-group-me col-sm-8 pull-right">
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseDate" aria-expanded="false"
						aria-controls="collapseDate">
						Sort By Date
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseScore" aria-expanded="false"
						aria-controls="collapseScore">
						Sort By Score
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseDuration" aria-expanded="false"
						aria-controls="collapseDuration">
						Sort By Duration
					</button>
				</div>	
		    </div>			
		</div>
	</div>
	
	<div class="collapse" id="collapseDate">
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
     	    ArrayList<Performance> perfUD = quizSummary.getUserPerformanceByDate();
/*     		for (int i = 0; i < perfUD.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfUD.get(i).getStartTime();
        		per[1] = String.valueOf(perfUD.get(i).getScore());
        		per[2] = perfUD.get(i).getDuration();
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
        		per[0] = "hi";
        		per[1] = "awkward";
        		per[2] = "never care";
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
	
	<div class="collapse" id="collapseScore">
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
    	    ArrayList<Performance> perfUS = quizSummary.getUserPerformanceByScore();
    		for (int i = 0; i < perfUS.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfUS.get(i).getStartTime();
        		per[1] = String.valueOf(perfUS.get(i).getScore());
        		per[2] = perfUS.get(i).getDuration();
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
	
	<div class="collapse" id="collapseDuration">
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
     	    ArrayList<Performance> perfUDU = quizSummary.getUserPerformanceByDuration();
    		for (int i = 0; i < perfUDU.size(); i++) {
    			String[] per = new String[3];
        		per[0] = perfUDU.get(i).getStartTime();
        		per[1] = String.valueOf(perfUDU.get(i).getScore());
        		per[2] = perfUDU.get(i).getDuration();
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

    <div class="item"
    	style="height:450px;text-align:center;">
    	<h2 style="color:#C71585;">Highest Performances</h2>
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
    	style="height:450px;text-align:center;">
        <h2 style="color:#C71585;">Highest Performances Last Day</h2>
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
    	style="height:450px;text-align:center;">
        <h2 style="color:#C71585;">Recent Good Performances</h2>
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
    	style="height:450px;text-align:center;">
        <h2 style="color:#C71585;">Recent Bad Performances</h2>
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
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"
				style="color: #73AD21;"></span> <span class="sr-only">Previous</span>
			</a> <a class="right carousel-control"
				href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
				style="color: #73AD21;"></span> <span class="sr-only">Next</span>
			</a>
</div>
</div>
<div class="text-center"
style="position: fixed;  width: 100%; height: 20%; top: 80%; left: 0;">
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
<%
	if (userID.equals(author)) {
		out.print("<a href=\"QuizEditing.jsp\" class=\"btn btn-info\"  role=\"button\">Edit Quiz</a>");
	} else {
		out.print("<a disabled=\"disabled\" class=\"btn btn-info\"  role=\"button\">Edit Quiz</a>");
	}
%>

</div>
</body>
</html>