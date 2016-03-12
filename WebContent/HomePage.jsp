<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,xuandong.*,javax.servlet.*,KaiChieh.*,bian.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ek+Mukta">

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

<style>

h5 {
	color:#ff9999;
}

h6 {
	font-size:16px;
}

.button-container form,
.button-container form div {
    display: inline;
}

.button-container button {
    display: inline;
    vertical-align: middle;
}

.linkButton { 
     background: none;
     border: none;
     color: #0066CC;
     text-decoration: underline;
     cursor: pointer; 
}

.grayscale {
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
}

.tooltip-inner  {
	white-space:pre-wrap;
	max-width:200px;
	word-wrap:break-word;
	background-color:#181818 ;
}


.carousel-control.left, .carousel-control.right {
	background-image: none
}

.clearfix:after {
	display: block;
	clear: both;
}

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
</style>
<title>Home Page</title>
</head>
<body style="height: 2200px;background-color:#fffff6;">
	<div
		style="position: fixed; width: 100%; height: 50px; top: 0px; left: 0; z-index: 2; text-align: center; background-color: black; color: #FAF0E6; opacity: 0.8;">

		<div
			style="position: absolute; left: 0px; width: 300px; height: 100%; background-color:black;">
			<div
				style="position: absolute; left: 0px; top: 5px; width: 250px; height: 45; background-color: black;">
				<a href="HomePage.jsp"><h4 style="color: #ffb3b3;">QuizzGo</h4></a>
			</div>
		</div>

		<div class="col-lg-6"
			style="position: absolute; top: 8px; left: 30%; width: 40%;">
			<form action="SearchServlet" method="post" id="search">
				<div class="input-group">
					<input type="text" name="targetToSearch" class="form-control" placeholder="Search for...">
					<span class="input-group-btn" style="width:65px"> 
					<select class="selectpicker form-control" id="sel1" name="searchOption">
							<option value="quiz">Quiz</option>
							<option value="user">User</option>
					</select>
					</span> <span class="input-group-btn">
						<button type="submit" form="search" class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search" style="font-size: 20px;"></span>
						</button>
					</span>
				</div>
			</form>
			<!-- /input-group -->
		</div>
		<div
			style="position: absolute; right: 5px; width: 300px; height: 100%; background-color: black;">

			<div class="menu-wrap">
				<nav class="menu">
					<ul class="clearfix">
						<li style="left:-10px;width:110px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><a href="javascript:pageScrollUp(0)" style="top:30px;padding:10px 1px;color:yellow;">
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
					ArrayList<Announcement> announcements = Announcement.getAnnouncement();
					int numAnnounceMent = (announcements.size() > 2) ? 2 : announcements.size();
					int numPages = recentQuizPerformances.size() + recentCreatedQuizzes.size() + numAnnounceMent;
					for(int pageIndex = 0; pageIndex<numPages; pageIndex++) {
						String state = "";
						if(pageIndex == 0) {
							state = "class=\"active\" ";
						}
						String pager = "<li data-target=\"#carousel-example-generic\" data-slide-to=" + "\"" + pageIndex + "\" " + state + "style=\"z-index:1;background-color: #73AD21;\"></li>";
						out.print(pager);
					}
					
				%>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<%
					int pageIndex = 0;
					if (numPages == 0) {
						out.print("<div class=\"item active\" style=\"height:280px;text-align:center;\">");
						out.print("<br><br><h2 style=\"color:#C71585;\">No Recent Activities</h2><br>");
						out.print("</div>");
					} else {
						for (int announcePage = announcements.size() - 1; announcePage > announcements.size() - numAnnounceMent
								- 1; announcePage--) {
							if (pageIndex == 0) {
								out.print("<div class=\"item active\" style=\"height:280px;text-align:center;\">");
							} else {
								out.print("<div class=\"item\" style=\"height:280px;text-align:center;\">");
							}
							out.print("<h3 style=\"color:#C71585;\">Annoucement!!!</h3><br>");
							String announceIDUrl = "UserViewAnnoun.jsp";
							String showQuizUrl = "<a href=" + "\"" + announceIDUrl + "\"" + ">";
							out.print(showQuizUrl + "<h4 style=\"font-size:22px;\">"
									+ announcements.get(announcePage).getSubject() + "</h4>");
							out.print("</a>");
							out.print("<h4>" + announcements.get(announcePage).getContent() + "</h4>");
							out.print("<h6>" + announcements.get(announcePage).getDate() + "</h6>");
							out.print("<h6>By: " + announcements.get(announcePage).getAdminID() + "</h6>");
							out.print("</div>");
							pageIndex++;
						}
						for (Performance performance : recentQuizPerformances) {
							/* 						if(pageIndex==4) {
														break;
													} */
							if (pageIndex == 0) {
								out.print("<div class=\"item active\" style=\"height:280px;text-align:center;\">");
							} else {
								out.print("<div class=\"item\" style=\"height:280px;text-align:center;\">");
							}
							Quiz quizTook = new Quiz();
							quizTook.setQuizID(performance.getQuizID());
							out.print("<h3 style=\"color:#C71585;\">Your Recent Performance</h3><br>");
							String quizID = quizTook.getQuizID();
							String quizIDUrl = "QuizSummary.jsp?quizID=" + quizID + "&userID=" + userID;
							String showQuizUrl = "<a href=" + "\"" + quizIDUrl + "\"" + ">";
							out.print(showQuizUrl + "<h4>Quiz: " + quizTook.getName() + "</h4>");
							out.print("</a>");
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
							out.print("<h3 style=\"color:#C71585;\">Your Recent Created Quiz</h3><br>");
							String quizIDUrl = "QuizSummary.jsp?quizID=" + quiz.getQuizID() + "&userID=" + userID;
							String showQuizUrl = "<a href=" + "\"" + quizIDUrl + "\"" + ">";
							out.print(showQuizUrl + "<h4>Name: " + quiz.getName() + "</h4>");
							out.print("</a>");
							out.print("<h4>Popularity: " + quiz.getPopularity() + "</h4>");
							out.print("<h4>Highest Score: " + quiz.getHighestScore() + "</h4>");
							out.print("<h4>Created Time: " + quiz.getCreatedDate() + "</h4>");
							String isPracticeMode = quiz.isPracticeMode() ? "Yes" : "No";
							out.print("</div>");
							pageIndex++;
						}
					}
				%>

			</div>

			<!-- Controls -->
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

	<div
		style="position: relative; top: 85px; left: 50%; width: 900px; height: 1000px; margin-left: -450px;">
		
		<div class="panel panel-default" style="height: 60px;">

			<div class="panel-body"
				style="font-family: 'Ek Mukta'; color: #C71585; font-size: 18px; font-weight: bold;">
				<div class="col-xs-6 col-md-6 text-left">
					<a style="color: #C71585;" role="tab" data-toggle="collapse"
						data-parent="#accordion" href="#collapseUserInfo"
						aria-expanded="true" aria-controls="collapseUserInfo"><span
						class="glyphicon glyphicon-user" aria-hidden="false"></span>&nbsp&nbspUSER
						INFO </a>
				</div>
				<div class="col-xs-6 col-md-6 text-right">

			<!-- 		<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseSentEmail" aria-expanded="false"
						aria-controls="collapseSentEmail"> -->
					<button type="button" onclick="myFunction" class="btn btn-info" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">
						<span class="glyphicon glyphicon-comment"
							style="width: 30px; font-size: 18px;"></span>
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseFriendInfo" aria-expanded="false"
						aria-controls="collapseFriendInfo">
						<span class="glyphicon glyphicon-user"
							style="width: 30px; font-size: 18px;"></span>
						<%
							ArrayList<User> friendRequests = user.getFriendRequests();
							if (friendRequests.size() > 0) {
								out.println(" <span class=\"badge\" style=\"font-size:11px;top:-5px\">"
										+ String.valueOf(friendRequests.size()) + "</span>");
							}
						%>
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseExample" aria-expanded="false"
						aria-controls="collapseExample">
						<span class="glyphicon glyphicon-envelope"
							style="width: 30px; font-size: 18px;"></span>
						<% 
							EmailManager eManager = new EmailManager();
							userID = (String) session.getAttribute("userID");
							eManager.setUser(userID);
							int unreadEmailCount = eManager.getUnreadEmailsCount();
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
		<!-- Modal test -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="exampleModalLabel">New message</h4>
					</div>
					<div class="modal-body">
						<div class="form-group" style="text-align: right;">
							<form action="SentEmail" method="post">
								<div class="input-group">
									<span class="input-group-addon" id="sizing-addon2"><span
										class="glyphicon glyphicon-user"></span></span> <input type="text"
										class="form-control" placeholder="Sent to which user ID?"
										aria-describedby="sizing-addon2" name="receiverID" id="receiver">
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
									placeholder="Write a note to your friend..."
									name="emailContent"></textarea>
								<br>
								<input type="submit" value="Send Message"></input>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="collapse" id="collapseExample">
			<div class="well"
				style="width: 900px; height: 300px; background-color: black; overflow:auto;max-height:300px;">
				
				<%
					userID = (String) session.getAttribute("userID");
					eManager.setUser(userID);
					ArrayList<Email> emails = eManager.getToUserEmail();
					for (Email mail: emails) {
						mail.setRead(true);
						out.println("<div class=\"media\" style=\"\">");
						out.println("<div class=\"media-left media-middle\" style=\"width:100px !important;text-align:left !important;\">");
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
						out.println("<hr style=\"height: 1px;color:#0099CC;background-color:#0099CC;border-color:#0099CC;\">");
					}
				%>
			</div>
		</div>
			<div class="collapse" id="collapseFriendInfo">
			<div class="well"
				style="width: 900px; height: 300px; background-color: black; overflow: auto; max-height: 300px;">
				<table class="table table-striped">
					<tr>
						<th>#</th>
						<th>Friend ID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Age</th>
						<th>Options</th>
					</tr>
					<%
						ArrayList<User>   pendingFriendRequests = user.getFriendRequests();
						ArrayList<String> friendsID = user.getFriends();
						int numOfFriends = 0;
						for(User newFriend: pendingFriendRequests) {
							out.print("<tr  class=\"success\">");
							out.print("<td>"+String.valueOf(numOfFriends+1)+"</td>");
							out.print("<td>"+"<a href=\"UserProfile.jsp?usertoview="+newFriend.getID()+"\">"+newFriend.getID()+"</a>"+"</td>");
							out.print("<td>"+newFriend.getName()+"</td>");
							out.print("<td>"+newFriend.getGender()+"</td>");
							out.print("<td>"+newFriend.getAge()+"</td>");
							out.print("<td>");
							out.print("<div class=\"button-container\">");
							out.print("<form id=\"addFriendForm\" action=\"AddFriendServlet\" method=\"post\"><input type=\"hidden\" name=\"friendToAddID\" value=\""+ newFriend.getID() +"\">");
							String addFriendButton = "<button form=\"addFriendForm\" class=\"linkButton\" value=\"Delete\" type=\"submit\"  data-toggle=\"tooltip\" title=\"Accept friend request!\"><span class=\"glyphicon glyphicon-thumbs-up\" style=\"width: 25px; font-size: 18px;\"></span></button></form>";
							out.print(addFriendButton);
							out.print("<form id=\"declineFriendForm\" action=\"DeclineFriendServlet\" method=\"post\"><input type=\"hidden\" name=\"friendToDeclineID\" value=\""+ newFriend.getID() +"\">");
							String declineFriendButton  = "<button form=\"declineFriendForm\" class=\"linkButton\" value=\"Delete\" type=\"submit\"  data-toggle=\"tooltip\" title=\"Decline friend request!\"><span class=\"glyphicon glyphicon-thumbs-down\" style=\"width: 25px; font-size: 18px;\"></span></button></form>";
							out.print(declineFriendButton);
							out.print("</div>");
							out.print("</td>");
							out.print("</tr>");
							numOfFriends++;	
						}
						for (String fID : friendsID) {
							User friend = new User(fID);
							out.print("<tr  class=\"success\">");
							out.print("<td>"+String.valueOf(numOfFriends+1)+"</td>");
							out.print("<td>"+"<a href=\"UserProfile.jsp?usertoview="+fID+"\">"+fID+"</a>"+"</td>");
							out.print("<td>"+friend.getName()+"</td>");
							out.print("<td>"+friend.getGender()+"</td>");
							out.print("<td>"+friend.getAge()+"</td>");
							String sentEmailButton = "<a href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModal\" data-whatever=\"@getbootstrap\" data-tooltip=\"true\" title=\"Message him/her!\"><span class=\"glyphicon glyphicon-comment\" style=\"width: 25px; font-size: 18px;\"></span></a>";
							out.print("<form id=\"deleteForm\" action=\"DeleteChallengeFriendServlet\" method=\"post\"><input type=\"hidden\" name=\"friendToDeleteID\" value=\""+ friend.getID() +"\">");
							String deleteFriendButton = "<button form=\"deleteForm\" class=\"linkButton\" value=\"Delete\" type=\"submit\"  data-toggle=\"tooltip\" title=\"Unfriend this user!\"><span class=\"glyphicon glyphicon-trash\" style=\"width: 25px; font-size: 18px;\"></span></button>";
							String challengeFriendButton = "<a href=\"UserViewHistory.jsp\" data-toggle=\"tooltip\" title=\"Challenge your friend!\"><span class=\"glyphicon glyphicon-exclamation-sign\" style=\"width: 30px; font-size: 18px;\"></span></a>";
							out.print("<td>"+sentEmailButton+deleteFriendButton+" "+challengeFriendButton+"</td>");
							out.print("</tr>");
							numOfFriends++;
						}
					%>
				</table>
			</div>
		</div>
		<div class="collapse in" id="collapseUserInfo">
			<div class="well"
				style="width: 900px; height: 250px; background-color: black;">
				<div class="col-xs-6 col-md-6 text-left" style="left: 0px;">
					<div class="col-xs-6 col-md-6 text-left" style="left: 0px;">
						<br>
						<br>
						<h4>
							User ID:
						</h4>
						<h4>
							User Name:
						</h4>
						<h4>
							User Age:
						</h4>
						<h4>
							User Gender:
						</h4>
					</div>
					<div class="col-xs-6 col-md-6 text-right" style="left: 0px;">
						<br>
						<br>
						<h4>
							<%=user.getID()%>
						</h4>
						<h4>
							<%=user.getName()%></h4>
						<h4>
							<%= user.getAge()%></h4>
						<h4>
							<%=user.getGender()%></h4>
					</div>
				</div>
				<div class="col-xs-6 col-md-6 text-center" style="height: 100%;top:0%;">
					<% 
						ArrayList<Achievement> allUserAchievements = user.getAchievements();
						ArrayList<String> AllAchievements = Achievement.getAllAchievement();
						ArrayList<String> allAchievements = new ArrayList<String>(AllAchievements);
						for(Achievement ach: allUserAchievements) {
							String imageUrl = ach.getImage();
							String description = Achievement.getDescription(ach.getAchievementName());
							String getAchTime = ach.getTime();
							String achImage = "<img src=\"" + imageUrl +"\" style=\"position:relative;top:8px;left:5%;width:30%;height:43%;\" data-toggle=\"tooltip\" title=\"<h5>"+ach.getAchievementName()+ "</h5> You"+description+ "\" data-html=\"true\" >";
							out.print(achImage);
							allAchievements.remove(ach.getAchievementName());
						}
						for(String ach: allAchievements) {
							String imageUrl = Achievement.getImage(ach);
							String description = Achievement.getDescription(ach);
							String achImage = "<img src=\"" + imageUrl +"\" style=\"position:relative;top:8px;left:5%;width:30%;height:43%;\" class=\"grayscale\" data-toggle=\"tooltip\" title=\"<h5>" +  ach + "</h5> Received when you" + description + "\" data-html=\"true\">";
							out.print(achImage);
						}
					%>
				</div>
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
				String showQuizName = "<h3 style=\"font-size:17px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis; \">"+quizName+"<small>"+heartIcon+popularity+"</small>"+"</h3>";
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
					CREATED QUIZZES
				</div>
				<div class="col-xs-6 col-md-6 text-right">
					
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
					String showQuizName = "<h3 style=\"font-size:17px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;\">" + quizName + "<small>" + heartIcon
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
		<div class="panel panel-default">
			<div class="panel-body"
				style="font-family: 'Ek Mukta'; color: #C71585; font-size: 18px; font-weight: bold;">
				<div class="col-xs-6 col-md-6 text-left" style="left: 0px;">
					<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>&nbsp&nbspFRIEND ACTIVITIES
				</div>
				<div class="col-xs-6 col-md-6 text-right">
				
				</div>
			</div>
		</div>
		
		<table class="table table-striped">
			<tr>
				<th>#</th>
				<th>User ID</th>
				<th>Time</th>
				<th>Activity</th>
			</tr>
		<%
			ArrayList<Performance> friendRecentPerformance =  user.getFriendRecentTakenQuiz();
			int numOfActivity = 0;
			for(Performance performance: friendRecentPerformance) {
				out.print("<tr  class=\"success\">");
				out.print("<td>"+String.valueOf(numOfActivity+1)+"</td>");
				out.print("<td>"+"<a href=\"UserProfile.jsp?usertoview="+performance.getUserID()+"\">"+performance.getUserID()+"</a>"+"</td>");
				out.print("<td>"+performance.getStartTime()+"</td>");
				String quizUrl = "QuizSummary.jsp?quizID="+performance.getQuizID()+"&userID="+userID;
				String quizString = "<a href=\""+quizUrl+"\">" + Quiz.getName(performance.getQuizID()) +"</a>";
				String activity = "Took quiz: "+quizString+" and received "+performance.getScore()+"!";
				out.print("<td>"+activity+"</td>");
				out.print("</tr>");
				numOfActivity++;
			}
			ArrayList<Quiz> friendRecentCreatedQuiz =  user.getFriendRecentCreatedQuiz();
			for(Quiz quiz: friendRecentCreatedQuiz) {
				out.print("<tr  class=\"warning\">");
				out.print("<td>"+String.valueOf(numOfActivity+1)+"</td>");
				out.print("<td>"+"<a href=\"UserProfile.jsp?usertoview="+quiz.getAuthor()+"\">"+quiz.getAuthor()+"</a>"+"</td>");
				out.print("<td>"+quiz.getCreatedDate()+"</td>");
				String quizUrl = "QuizSummary.jsp?quizID="+quiz.getQuizID()+"&userID="+userID;
				String quizString = "<a href=\""+quizUrl+"\">" + quiz.getName() +"</a>";
				String activity = "Created quiz: "+quizString+" and has popularity: "+quiz.getPopularity()+"!";
				out.print("<td>"+activity+"</td>");
				out.print("</tr>");
				numOfActivity++;
			}
			ArrayList<Achievement> friendRecentAchievement =  user.getFriendAchievement();
			for(Achievement Achi: friendRecentAchievement) {
				out.print("<tr  class=\"danger\">");
				out.print("<td>"+String.valueOf(numOfActivity+1)+"</td>");
				out.print("<td>"+"<a href=\"UserProfile.jsp?usertoview="+Achi.getUserID()+"\">"+Achi.getUserID()+"</a>"+"</td>");
				out.print("<td>"+Achi.getTime()+"</td>");
				String activity = Achi.getUserID() +" " + Achi.getDescription() + " And achieved " + Achi.getAchievementName()+"!";
				out.print("<td>"+activity+"</td>");
				out.print("</tr>");
				numOfActivity++;
			}
		%>
		</table>
	</div>
<!-- 	<div style="position:relative;width=100%;bottom:0px;height:22%;background-color:#ffb3b3;">
	<hr style="
				border:none;	
				border-top:1px #CCCCCC solid;
				height: 1px;
	">	
	 
	</div>	 -->
		
</body>
</html>