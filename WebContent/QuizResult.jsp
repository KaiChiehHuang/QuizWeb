<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="xuandong.*" %>
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
<title>Quiz Result</title>
</head>

<body>

<%
 	Quiz quiz = (Quiz) session.getAttribute("quiz");

//Display score and time;
	String score = quiz.getScore();
	String duration = quiz.getDuration();
	
// Performance
	QuizSummary summary = new QuizSummary(quiz.getQuizID(), quiz.getUserID());
	ArrayList<Performance> userPerformance = summary.getUserPerformanceByDate();
%>

<div class="container">
  <h2>Your Performance</h2>
  <h3>Score:</h3>
  <p><% out.println(score); %></p>
  <h3>Duration:</h3>
  <p><% out.println(duration); %></p>  
  <h2>Past Performance</h2>
  <p>Your Past Performance on this quiz</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Start Time</th>
        <th>Score</th>
        <th>Duration</th>
      </tr>
    </thead>
    <tbody>
    
    <%
    	for (int i = 0; i < userPerformance.size(); i++) {
     		String[] per = new String[3];
    		per[0] = userPerformance.get(i).getStartTime();
    		per[1] = String.valueOf(userPerformance.get(i).getScore());
    		per[2] = userPerformance.get(i).getDuration();
    		if (i % 2 == 0) {
    			out.println("<tr class=\"warning\">");
    		} else {
    			out.println("<tr>");
    		}
    		for (int j = 0; j < 3; j++) {
    			out.println("<td>");
    			out.println(per[j]);
    			out.println("</td>");
    		}
    		out.println("</tr>");	
    	}
    %>
    </tbody>
  </table>
</div>

</body>
</html>