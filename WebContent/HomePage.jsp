<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,xuandong.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ek+Mukta">
<script>
function pageScrollUp(position) {
    var yPos = window.pageYOffset;
    yPos -= 95;
    if(yPos<position)
    {
        yPos = position;
    }
    window.scroll(0,yPos); // horizontal and vertical scroll increments
    scrolldelay = setTimeout('pageScrollUp(\''+position+'\')',45); // scrolls every 100 milliseconds
    if(yPos==position)
    {
        clearTimeout(scrolldelay);
    }
}
</script>

<style>
.clearfix:after {
    display:block;
    clear:both;
}
 
/*----- Menu Outline -----*/
.menu-wrap {
    width:100%;
    box-shadow:0px 1px 3px rgba(0,0,0,0.2);
    background:black;
}
 
.menu {
    width:300px;
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
</style>
<title>Home Page</title>
</head>
<body style="height: 2200px;">
	<div
		style="position: fixed; width: 100%; height: 50px; top: 0px; left: 0; z-index: 2; text-align: center; background-color: black; color: #FAF0E6; opacity: 0.95;">

		<div
			style="position: absolute; left: 0px; width: 300px; height: 100%; background-color: black;">
			LOGO</div>

		<div class="col-lg-6"
			style="position: absolute; top: 8px; left: 30%; width: 40%;">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">Go!</button>
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
								<li><a href="#">Profile</a></li>
								<li><a href="#">Coming Soon</a></li>
								<li><a href="#">Quiz Record</a></li>
								<li><a href="#">Logout</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- /.col-lg-6 -->
	</div>
	<!-- /.row -->
	<!-- 	<div style="position:relative;top:55px;left:50%;width:800px;height:300px;
     								 margin-left:-400px;background-color:red;"> -->
	<div
		style="border-radius: 20px; position: relative; top: 65px; left: 50%; width: 800px; height: 300px; margin-left: -400px; background-image: url('http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_527bf56961712_1.JPG');">

	</div>

	<div style="position: relative; top: 85px; left: 50%; width: 900px; height: 1000px; margin-left: -450px;">

		<div class="panel panel-default" style="height: 60px;">
			<div class="panel-body"
				style="font-family: 'Ek Mukta'; color: #C71585; font-size: 18px; font-weight: bold;">
				<div class="col-xs-6 col-md-6 text-left">
					<a style="color: #C71585;" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapseUserInfo"
						aria-expanded="false" aria-controls="collapseUserInfo"><span
						class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp&nbspUSER
						INFO </a>
				</div>
				<div class="col-xs-6 col-md-6 text-right">
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseExample" aria-expanded="false"
						aria-controls="collapseExample">
						Messages <span class="badge">4</span>
					</button>
				</div>
			</div>
		</div>

		<div class="collapse" id="collapseExample">
			<div class="well" style="width: 900px; height: 300px; background-color: black;">
				<%
					EmailManager eManager = new EmailManager();
					userID = (String) session.getAttribute("userID");
					eManager.setUser(userID);
					ArrayList<Email> emails = eManager.getToUserEmail();
					for (Email mail: emails) {
						out.println("<div class=\"media\">");
						out.println("<div class=\"media-left media-middle\">");
						sentEmailUserID = mail.getSenderID();
						sentEmailUserIDUrl = "<a href=\"#\">" + sentEmailUserID + "</a>";
						out.println("</div>");
						out.println("<div class=\"media-body\">");
						emailSubject = mail.getSubject();
						emailSubjectTitle = "<h4 class=\"media-heading\">" + emailSubject + "</h4>";
						out.println(emailSubjectTitle);
						content = mail.getContent();
						out.println(content);
						out.println("</div>");
						out.println("</div>");
					}
				%>
			</div>
		</div>
		<div class="collapse" id="collapseUserInfo">
			<div class="well" style= "width:900px;height:300px;background-color:black;">
   				User Info
  			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-body"
				style="font-family: 'Ek Mukta'; color: #C71585; font-size: 18px; font-weight: bold;">
				<div class="col-xs-6 col-md-6 text-left" style="left: 0px;">
					<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>&nbsp&nbspPOPULAR
					QUIZZES
				</div>
				<div class="col-xs-6 col-md-6 text-right">
					<a href="#">More...</a>
				</div>
			</div>
		</div>
	    <% 
	 	 {
		    int numPopularQuizzes = 0; 
			int numQuizzesInRow = 4;
			out.println("<div class=\"row\">");
			for(Quiz quiz : Quiz.getPopularQuizzes()) {
				out.println("<div class=\"col-xs-6 col-md-3\">");
				// Make Quiz ID url to link to summary page
				String quizID = quiz.getQuizID();
				String quizIDUrl = "QuizSummary.jsp?quizID="+quizID+"&userID="+userID;
				String showQuizUrl = "<a href=" + "\"" + quizIDUrl + "\"" + " " + "class=\"thumbnail\">";
				out.println(showQuizUrl);
				out.println("<div style=\"width: 180px; height: 180px; background-color: white;\">");
					out.println("<div class=\"caption\">");
							String quizName = quiz.getName();
							String popularity = String.valueOf(quiz.getPopularity());
							String heartIcon = "<br><span class=\"glyphicon glyphicon-heart\" aria-hidden=\"true\"></span>  ";
							String showQuizName = "<h3 style=\"font-size:20px;\">"+quizName+"<small>"+heartIcon+popularity+"</small>"+"</h3>";
							out.println(showQuizName);
						out.println("</div>");
						// Add popularity
				out.println("</div>");
				out.println("</a>");
				out.println("</div>");
				numPopularQuizzes += 1;
			}
			out.println("</div>");
	 	 }
		 %>   

		<div class="panel panel-default">
			<div class="panel-body"
				style="font-family: 'Ek Mukta'; color: #C71585; font-size: 18px; font-weight: bold;">
				<div class="col-xs-6 col-md-6 text-left" style="left: 0px;">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp&nbspRECENT
						REATED QUIZZES
				</div>
				<div class="col-xs-6 col-md-6 text-right">
					<a href="#">More...</a>
				</div>
			</div>
		</div>
		
		<%
			{
				int numRecentQuizzes = 0;
				int numQuizzesInRow = 4;
				out.println("<div class=\"row\">");
				for (Quiz quiz : Quiz.getRecentQuizzes()) {
					out.println("<div class=\"col-xs-6 col-md-3\">");
					// Make Quiz ID url to link to summary page
					String quizID = quiz.getQuizID();
					String quizIDUrl = "QuizSummary.jsp?quizID="+quizID+"&userID="+userID;
					String showQuizUrl = "<a href=" + "\"" + quizIDUrl + "\"" + " " + "class=\"thumbnail\">";
					out.println(showQuizUrl);
					out.println("<div style=\"width: 180px; height: 180px; background-color: white;\">");
					out.println("<div class=\"caption\">");
					String quizName = quiz.getName();
					String createTime = String.valueOf(quiz.getCreatedDate());
					String heartIcon = "<br><span class=\"glyphicon glyphicon-time\" aria-hidden=\"true\"></span>  ";
					String showQuizName = "<h3 style=\"font-size:20px;\">" + quizName + "<small>" + heartIcon
							+ createTime + "</small>" + "</h3>";
					out.println(showQuizName);
					out.println("</div>");
					// Add popularity
					out.println("</div>");
					out.println("</a>");
					out.println("</div>");
					numRecentQuizzes += 1;
				}
				out.println("</div>");
			}
		%>  
	</div>

</body>
</html>