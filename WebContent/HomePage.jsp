<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,xuandong.*,javax.servlet.*,KaiChieh.*,bian.*" %>
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

.carousel-control.left, .carousel-control.right {
    background-image: none
}

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
		style="border-radius: 20px; position: relative; top: 65px; left: 50%; width: 800px; height: 300px; margin-left: -400px; border-radius: 10px; background-color: rgba(0, 0, 0, 0); overflow: hidden; border: 2px solid #73AD21; padding: 15px;">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" data-interval="4000"
			style="border-radius: 20px; position: relative; left: 0%; width: 100%; height: 100%;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<% 
					User user = new User(userID);
					ArrayList<Performance> recentQuizPerformances = user.getRecentTakenQuiz();
					ArrayList<Quiz>   recentCreatedQuizzes = user.getRecentCreatedQuiz();
					int numPages = recentQuizPerformances.size() + recentCreatedQuizzes.size();
					for(int pageIndex = 0; pageIndex<numPages; pageIndex++) {
						String state = "";
						if(pageIndex == 0) {
							state = "class=\"active\" ";
						}
						String pager = "<li data-target=\"#carousel-example-generic\" data-slide-to=" + "\"" + pageIndex + "\" " + state + "style=\"background-color: #73AD21;\"></li>";
						out.print(pager);
					}
					
				%>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<%
					int pageIndex = 0;
						for(Performance performance:recentQuizPerformances) {
				/* 					if(pageIndex==3) {
								break;
							} */
							if(pageIndex==0) {
								out.print("<div class=\"item active\" style=\"height:280px;text-align:center;\">");
							}else{
								out.print("<div class=\"item\" style=\"height:280px;text-align:center;\">");
							}
							Quiz quizTook = new Quiz();
							quizTook.setQuizID(performance.getQuizID());
						out.print("<h3>Your Recent Performance</h3><br>");
						out.print("<h4>Quiz: " + quizTook.getName() + "</h4>");
						out.print("<h4>Score: " + performance.getScore() + "</h4>");
						out.print("<h4>Start Time: " + performance.getStartTime() + "</h4>");
						out.print("<h4>Duration: " + performance.getDuration() + "</h4>");
						out.print("</div>");
						pageIndex++;
					}
					for (Quiz quiz : recentCreatedQuizzes) {
						/* 					if(pageIndex==3) {
												break;
											} */
						if (pageIndex == 0) {
							out.print("<div class=\"item active\" style=\"height:280px;text-align:center;\">");
						} else {
							out.print("<div class=\"item\" style=\"height:280px;text-align:center;\">");
						}
						out.print("<h3>Your Recent Created Quiz</h3><br>");
						out.print("<h4>Name: " + quiz.getName() + "</h4>");
						out.print("<h4>Popularity: " + quiz.getPopularity() + "</h4>");
						out.print("<h4>Created Time: " + quiz.getCreatedDate() + "</h4>");
						String isPracticeMode = quiz.isPracticeMode() ? "Yes" : "No";
						out.print("<h4>Practice Mode: " + isPracticeMode + "</h4>");
						out.print("</div>");
						pageIndex++;
					}
				%>

			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color:#73AD21;"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color:#73AD21;"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div
		style="position: relative; top: 85px; left: 50%; width: 900px; height: 1000px; margin-left: -450px;">

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
						data-target="#collapseSentEmail" aria-expanded="false"
						aria-controls="collapseSentEmail">
						<span class="glyphicon glyphicon-comment"
							style="width: 30px; font-size: 18px;"></span>
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseExample" aria-expanded="false"
						aria-controls="collapseExample">
						<span class="glyphicon glyphicon-user"
							style="width: 30px; font-size: 18px;"></span>
						<%
							EmailManager eManager = new EmailManager();
							userID = (String) session.getAttribute("userID");
							eManager.setUser(userID);
							int unreadEmailCount = eManager.getUnreadEmailsCount();
							if (unreadEmailCount > 0) {
								out.println(" <span class=\"badge\" style=\"font-size:11px;top:-5px\">"
										+ String.valueOf(unreadEmailCount) + "</span>");
							}
						%>
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseExample" aria-expanded="false"
						aria-controls="collapseExample">
						<span class="glyphicon glyphicon-envelope"
							style="width: 30px; font-size: 18px;"></span>
						<% 
							userID = (String) session.getAttribute("userID");
							eManager.setUser(userID);
							unreadEmailCount = eManager.getUnreadEmailsCount();
							if (unreadEmailCount > 0) {
								out.println(" <span class=\"badge\" style=\"font-size:11px;top:-5px\">"+ String.valueOf(unreadEmailCount) +"</span>");
							}
						%>
						<script>
							$(document).on("click", ".btn-info", function(e) {
							    e.preventDefault();
							    var $badge = $(this).find('.badge'),
							        count = Number($badge.text()),
							        active = $(this).hasClass('active');
							    $badge.text("");
							    $(this).toggleClass('active');
							});
						</script>
					</button>
				</div>
			</div>
		</div>

		<div class="collapse" id="collapseSentEmail">
			<div class="well"
				style="width: 900px; height: 330px; background-color: black;">

				<div class="form-group" style="text-align: right;">
					<form action="SentEmail" method="post">
 						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" placeholder="Sent to which user ID?"
								aria-describedby="sizing-addon2" name="receiverID">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2"><span
								class="glyphicon glyphicon-pencil"></span></span> <input type="text"
								class="form-control"
								placeholder="Write a subject for this email..."
								aria-describedby="sizing-addon2" name="emailSubject">
						</div>
						<br>
						<textarea class="form-control" rows="6" id="note"
							placeholder="Write a note to your friend..." name="emailContent"></textarea>

						<br> <input type="submit" class="btn btn-info" value="Send"
							data-toggle="collapse" data-target="#collapseSentEmail"
							aria-expanded="false" aria-controls="collapseSentEmail"></input>

					</form>
				 </div>

			</div>
		</div>

		<div class="collapse" id="collapseExample">
			<div class="well"
				style="width: 900px; height: 300px; background-color: black;">
				<%
					userID = (String) session.getAttribute("userID");
					eManager.setUser(userID);
					ArrayList<Email> emails = eManager.getToUserEmail();
					for (Email mail: emails) {
						out.println("<div class=\"media\">");
						out.println("<div class=\"media-left media-middle\" style=\"text-align:left !important;\">");
						String sentEmailUserID = mail.getSenderID();
						String sentEmailUserIDUrl = "<a href=\"#\">" +sentEmailUserID+ "</a>";
						out.println(sentEmailUserIDUrl);
						out.println("<br>");
						String sentEmailTime = mail.getTime();
						out.println("<small>"+sentEmailTime+"</small>");
						out.println("</div>");
						out.println("<div class=\"media-body\">");
						String emailSubject = mail.getSubject();
						String emailSubjectTitle = "<h4 class=\"media-heading\">" + emailSubject + "</h4>";
						out.println(emailSubjectTitle);
						String content = mail.getContent();
						out.println(content);
						out.println("</div>");
						out.println("</div>");
					}
				%>
			</div>
		</div>
		<div class="collapse" id="collapseUserInfo">
			<div class="well"
				style="width: 900px; height: 300px; background-color: black;">
				User Info</div>
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
				out.println("<div style=\"position:relative;left:50%; margin-left:-90px; width: 180px; height: 180px; background-color: white;\">");
				out.println("<img src=\"" + quiz.getImage() +"\" style=\"position:relative;top:8px;left:5%;width:90%;height:60%;\">");
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
					out.println("<div style=\"position:relative;left:50%; margin-left:-90px; width: 180px; height: 180px; background-color: white;\">");
					out.println("<img src=\"" + quiz.getImage() +"\" style=\"position:relative;top:8px;left:5%;width:90%;height:60%;\">");
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