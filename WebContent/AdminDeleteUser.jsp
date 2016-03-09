<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.*" %>
    <%@ page import="java.io.*" %>
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
<title>Administration</title>
</head>
<body>

<%
	ArrayList users = new ArrayList();
	users = Administration.getAllUsers();
	ArrayList quizs = new ArrayList();
	quizs = Administration.getAllQuizzes();
%>

<div style="background-image: linear-gradient(rgba(255,255,255,0.4),rgba(255,255,255,0.4)),url('http://stylearena.net/wp-content/uploads/2015/03/cute-hd-wallpapers3.jpg')">
<div class = "container">
<h4>Web Statistics:</h4> 
<p>Total users number: <%=users.size()%></p>
<p>Total quiz number: <%=quizs.size()%></p>
<p>Total taken quiz number: <%Administration.getQuizTakenNumber();%></p>
<a href="AdminCreateAnnoun.jsp"> Create Announcement </a>

</div>
<form action="DeleteUserServlet" method="post">
<div class = "container">

<h4>Manage Users</h4>
  <table class="table">
    <thead>
      <tr>
        <th>UserID</th>
        <th>Delete User</th>
        <th>Promote Admin</th>
      </tr>
    </thead>
    <tbody>
    <%
    	for (int i = 0; i < users.size(); i++) {
     		String userID = (String)users.get(i);
    		if (i % 2 == 0) {
    			out.println("<tr class=\"warning\">");
    		} else {
    			out.println("<tr class=\"active\">");
    		}
    		out.println("<td>");
    		out.println(userID);
    		out.println("</td>");
    		
    		out.println("<td>");
    		out.println("<button name = \"usertodelete\" type=\"submit\" class=\"btn btn-warning\" value =\"" +userID + "\"/>Delete</button>");
    		out.println("</td>");
    		
    		out.println("<td>");
    		out.println("<button name = \"usertoadmin\" type=\"submit\" class=\"btn btn-success\" value =\"" +userID + "\"/>Promote</button>");
    		out.println("</td>");
    		
    		out.println("</tr>");	
    	}
    %>
    </tbody>
  </table>
</div>


<div class = "container">
<h4>Manage Quizs</h4>
  <table class="table">
    <thead>
      <tr>
        <th>QuizID</th>
        <th>Delete Quiz</th>
        <th>Clear History</th>
      </tr>
    </thead>
    <tbody>
    <%
    	for (int i = 0; i < quizs.size(); i++) {
     		String quizID = (String)quizs.get(i);
    		if (i % 2 == 0) {
    			out.println("<tr class=\"warning\">");
    		} else {
    			out.println("<tr class=\"active\">");
    		}
    		out.println("<td>");
    		out.println(quizID);
    		out.println("</td>");
    		
    		out.println("<td>");
    		out.println("<button name = \"quiztodelete\" type=\"submit\" class=\"btn btn-warning\" value =\"" +quizID+ "\"/>Delete</button>");
    		out.println("</td>");
    		
    		out.println("<td>");
    		out.println("<button name = \"quiztoclear\" type=\"submit\" class=\"btn btn-success\" value =\"" +quizID+ "\"/>Clear</button>");
    		out.println("</td>");
    		
    		out.println("</tr>");	
    	}
    %>
    </tbody>
  </table>
</div>

</form>
</div>
</body>
</html>