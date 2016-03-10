<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.*" %>
    <%@ page import="bian.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.Random" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ek+Mukta">
<script> 
$(function () {
	  $('[data-toggle="popover"]').popover()
	})
</script>

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

<title>User History</title>
</head>
<!-- background-image: linear-gradient(rgba(255,255,255,0.4),rgba(255,255,255,0.4)),url('http://stylearena.net/wp-content/uploads/2015/03/cute-hd-wallpapers9.jpg') -->
<body style="height:770px;background-size:100%;background-color:#fffff6;">

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
/* 	String viewUserID = request.getParameter("usertoview");
	User viewUser = new User(viewUserID); */
	String viewUserID = "jay";
	User viewUser = new User("jay");
%>

<form action="RequestAddFriendServlet" method="post">
<div class="container" style = "position: relative; width:70%; top: 50px;">
  <h2 style="text-align:center;">Personal Profile</h2> 
  		<div style="border-radius: 20px;
    				border: 2px solid #73AD21;
    				padding: 15px; 
				    height: 500px;
     				text-align:left;
     				left:50%;width:900px;
     				margin-left:-450px;
     				top:70px;
     				position:absolute;
     				opacity: 0.9;
     				background-color:white;
     				">

<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title" id="myModalLabel">About <%=viewUser.getID() %></h4>
                    </div>
                <div class="modal-body">
                    <center>
                    <!-- "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" -->
                    <!-- "http://eyelidsurgerysydney.typepad.com/.a/6a0148c6efc82f970c014e86367c69970d-popup" -->
                    <%
                    	if(viewUser.getGender().equals("Male")) {
                    		out.print("<img src=\"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R\" name=\"aboutme\" width=\"140\" height=\"140\" border=\"0\" class=\"img-circle\"></a>");
                    	} else {
                    		out.print("<img src=\"http://www.newwavefilm.com/images/jeanne-moreau-gallery/jeanne-moreau14.png\" name=\"aboutme\" width=\"140\" height=\"140\" border=\"0\" class=\"img-circle\"></a>");
                    	}
                    %>
                    <!-- <img src="http://www.newwavefilm.com/images/jeanne-moreau-gallery/jeanne-moreau14.png" name="aboutme" width="140" height="140" border="0" class="img-circle"></a> -->
                    <h3 class="media-heading"><%=viewUser.getName() %> <small>USA</small></h3>
                    <span><strong>Achievements: </strong></span>
					    <%
							String[] colors = new String[4];
					    	colors[0] = "success";
					    	colors[1] = "info";
					    	colors[2] = "warning";
					    	colors[3] = "danger";
					    	
							ArrayList<Achievement> ach = new ArrayList<Achievement>();
							ach = viewUser.getAchievements();
							for (int i = 0; i < ach.size(); i++) {
								if (i % 3 == 0) {
									out.print("<span class=\"label label-success\">" + ach.get(i).getAchievementName()+ "</span>");
								} else if (i % 3 == 2) {
									out.print("<span class=\"label label-info\">" + ach.get(i).getAchievementName()+ "</span>");
								} else {
									out.print("<span class=\"label label-danger\">" + ach.get(i).getAchievementName()+ "</span>");
								}
								
							}
						%>	

                    </center>
                    <hr>
                    <center>
                    <p class="text-left"><strong>Bio: </strong><br>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sem dui, tempor sit amet commodo a, vulputate vel tellus.</p>
                    <br>
                    </center>
                </div>
                <div class="modal-footer">
                    <center>
                    <%
                    ArrayList<String> friends = new ArrayList<String>();
                    User user = new User("xuandong");
                    /* "xuandong" is viewUser */
                    friends = user.getFriends();
                    boolean isFriend = false;
                    for (int i = 0; i < friends.size(); i++){
                    	if (friends.get(i).equals("xuandong") || userID.equals("xuandong")) {
                    		isFriend = true;
                    	}
                    }
                    if (!isFriend) {
                    	out.print("<button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Add Friend</button>");
                    } else {
                    	out.print("<button disabled=\"disabled\" type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Add Friend</button>");
                    }
                    %>
                    </center>
                </div>

  <div  style = "position: relative; width:80%; top: 45px;"><a href="HomePage.jsp"> Back to Home Page </a></div>
</div>

</div>
</form>
</body>
</html>