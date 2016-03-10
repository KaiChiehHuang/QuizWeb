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
<title>Quiz created successfully!</title>
</head>
<body style="background-image: linear-gradient(rgba(255,255,255,0.4),rgba(255,255,255,0.4)),url('http://stylearena.net/wp-content/uploads/2015/03/cute-hd-wallpapers12.jpg')">
<%
	
	Quiz quiz = (Quiz) session.getAttribute("newQuiz"); 
	for (Problem pr : quiz.getProblems()) {
		pr.updateDatabase();
	}
	quiz.setCreating();
	quiz.setCreatedDate();
	quiz.updateDatabase();
%>

		<div style="border-radius: 20px;
    				border: 2px solid #73AD21;
    				padding: 15px; 
				    height: 290px;
     				text-align:left;
     				left:50%;width:340px;
     				margin-left:-170px;
     				top:200px;
     				position:absolute;
     				opacity: 0.9;
     				background-color:white;
     				"><h3>Quiz Created Successfully!</h3>
     				<h3></h3>
     				<div class = "container" style = "position: relative; left: 50%; width: 340px; margin-left:-170px">
     				<img class="img-thumbnail" src = "http://cdn1.tnwcdn.com/wp-content/blogs.dir/1/files/2015/08/emoji.jpg" >
     				</div>
     				<div><a href="HomePage.jsp"> Back to Home Page </a></div>
     				</div>


</body>
</html>