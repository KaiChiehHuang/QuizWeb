<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.*" %>
    <%@ page import="bian.*" %>
    <%@ page import="java.util.*" %>
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
<title>User History</title>
</head>

<body style="background-image: linear-gradient(rgba(255,255,255,0.4),rgba(255,255,255,0.4)),url('http://stylearena.net/wp-content/uploads/2015/03/cute-hd-wallpapers4.jpeg')">
<%
	String userID = (String)session.getAttribute("userID");
	User user = new User(userID);
	/* User user = new User("jay"); */
	ArrayList<Performance> userPerformance = new ArrayList<Performance>();
	userPerformance = user.getQuizHistory();
%>

<form action="DeleteUserServlet" method="post">

<div class="container" style = "position: relative; width:80%; top: 20px;">
  <h2 style="text-align:center;">Your Quiz History</h2>         
  <table class="table">
    <thead>
      <tr>
      	<th>Quiz Name</th>
        <th>Start Time</th>
        <th>Score</th>
        <th>Duration</th>
        <th>Challenge Friend</th>
      </tr>
    </thead>
    <tbody>
    
    <%
    	for (int i = userPerformance.size() - 1; i >= 0 ; i--) {
     		String[] per = new String[4];
     		per[0] = userPerformance.get(i).getQuizName();
    		per[1] = userPerformance.get(i).getStartTime();
    		per[2] = String.valueOf(userPerformance.get(i).getScore());
    		per[3] = userPerformance.get(i).getDuration();
 
    		if (i % 2 == 0) {
    			out.println("<tr class=\"warning\">");
    		} else {
    			out.println("<tr class=\"active\">");
    		}
    		for (int j = 0; j < 4; j++) {
    			out.println("<td>");
    			out.println(per[j]);
    			out.println("</td>");
    		}
    		
    		String quizID = userPerformance.get(i).getQuizID();
    		out.println("<td>");
    		out.println("<button data-placement=\"left\" data-toggle=\"popover\" title=\"Popover title\" data-content=\"And here's some amazing content. It's very engaging. Right?\" name = \"quizchallenge\" type=\"submit\" class=\"btn btn-warning\" value =\"" +quizID+ "\"/>Challenge</button>");
    		out.println("</td>");
    		
    		out.println("</tr>");	
    	}
    %>
    </tbody>
  </table>
  <div><a href="HomePage.jsp"> Back to Home Page </a></div>
</div>

</body>
</html>

