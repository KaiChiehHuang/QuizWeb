<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.*" %>
    <%@ page import="bian.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.ArrayList" %>
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
<title>Announcement Page</title>
</head>
<body style="background-image: linear-gradient(rgba(255,255,255,0.4),rgba(255,255,255,0.4)),url('http://stylearena.net/wp-content/uploads/2015/03/cute-hd-wallpapers14.jpg')">
<%
	String userID = request.getParameter("usertoview");
	User user = new User("jay");
%>

<div class = "container">

<div>
	<h4>Name:</h4>
	<p><%=user.getName()%></p>
	<h4>Gender:</h4>
	<p><%=user.getGender()%></p>
	<h4>Age:</h4>
	<p><%=user.getAge()%></p>
	<h4>Achievements:</h4>
	<%
		out.print("<p>");
		ArrayList<Achievement> ach = new ArrayList<Achievement>();
		ach = user.getAchievements();
		for (int i = 0; i < ach.size(); i++) {
			if (i != ach.size() - 1) {
				out.print(ach.get(i).getAchievementName() + ",  ");
			} else {
				out.print(ach.get(i).getAchievementName() + ".");
			}
			
		}
		out.print("</p>");
	%>	
</div>

<button type="submit" name="friendtoadd" class="btn btn-warning" value = <%=user%>style = "position: relative; left: 50%; width: 120px; margin-left:-60px">Add Friend</button>
  <div><a href="HomePage.jsp"> Back to Home Page </a></div>
</div>

</body>
</html>