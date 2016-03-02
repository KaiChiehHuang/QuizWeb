<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="xuandong.Quiz" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz Summary Page</title>
</head>
<body>
<h1>Shopping Cart</h1>

<form action="QuizSummaryServlet" method = "post" >

<%
	Quiz quiz = (Quiz)request.getAttribute("quiz");
	String quizID = quiz.getQuizID();
	String userID = quiz.getUserID();
	out.println("name:");
	out.println(quiz.getName());
	out.println("author:");
	out.println(quiz.getAuthor());
	out.println("description:");
	out.println(quiz.getDescription());
	out.println("class:");
	out.println(quiz.getClass());
%>


</form>

<form action="TakeQuizServlet" method="post">
<%="<input name=\"quizID\" type=\"hidden\" value=\""+ quizID +"\"/>"%>
<%="<input name=\"userID\" type=\"hidden\" value=\""+ userID +"\"/>"%>

<input type="submit" value = "Start Quiz"/>
</form>

</body>
</html>