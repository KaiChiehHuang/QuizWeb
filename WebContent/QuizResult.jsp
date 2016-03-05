<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.Quiz" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz Result</title>
</head>
<body>


<%
	Quiz quiz = (Quiz)request.getAttribute("quiz");

//Display score and time;
	double score = quiz.getScore();
	String duration = quiz.getDuration();
	
	

%>


</body>
</html>