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
<title>Quiz</title>
</head>
<body>

<h1>Quiz Problem</h1>
<%
	Quiz quiz = (Quiz)request.getAttribute("quiz");
%>

<%!
	/* getParameter(answer1) get the answer of user. */
	public void takeSingleChoice(JspWriter myOut, SingleChoice mc, int index) throws IOException {
		String[] choices = mc.getChoices();
		String question = mc.getQuestion();
		
		myOut.println("<div class=\"container\">");
		myOut.println("<p>"+ "<h5>Problem" + index + ": </h5>"+question +"</p>");
		for (int i = 0; i < choices.length; i++) {
			myOut.println("<div class=\"radio\">");
			myOut.println("<label><input type=\"radio\" name=\"answer"+ index +"\">"+ choices[i] +"</label>");
			myOut.println("</div>");
		}
		myOut.println("</div>");
	}
%>

<%!
	/* getParameter(answer2) get the answer of user. */
	public void takeFillBlank(JspWriter myOut, FillBlank fb, int index) throws IOException {
		String que = fb.getQuestion();
		String[] question = new String[2];
		question = que.split("\\|\\|\\|\\|\\|\\|");
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem"+ index + ": </h5>" + question[0]);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer\" "+ index + " />");
		myOut.println(question[1] + "</p></div>");

	}
%>
<!-- Fill Blank -->
<div class = \"container\">
	<p><h5>Problem2: </h5>The bigest city in <input type="text" placeHolder="Answer" size="8" name="answer2" > is Beijing.</p>
</div>

<%!
	/* getParameter(answer3) get the answer of user. */
	public void takePictureResponse(JspWriter myOut, PictureResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		String url = pr.getURL();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem"+ index + ": </h5>" + question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer\" "+ index + " />");
		myOut.println("</p></div>");
		myOut.println("<div class = \"container\" style = \"position: relative; left: 50%; width: 400px; margin-left:-200px\">");
		myOut.println("<img class=\"img-thumbnail\"src =" + url + "></div>");

	}
%>
<!-- Picture Response -->
<div class = "container">
	<p><h5>Problem3:</h5> what is the main color of the picture? <input type="text" placeholder="Answer" size="8" name="answer" /></p>
</div>
<div class = "container" style = "position: relative; left: 50%; width: 400px; margin-left:-200px">
	<img class="img-thumbnail" alt="Cinque Terre" src = "http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_527bf56961712_1.JPG" >
</div>

<%!
	/* getParameter(answer3) get the answer of user. */
	public void takeQuestionResponse(JspWriter myOut, QuestionResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer\" "+ index + " />");
		myOut.println("</p></div>");
	}
%>
<!-- Question Response -->
<div class = "container">
	<p><h5>Problem 4:</h5> who is the energetic boy? <input type="text" placeholder="Answer" size="8" name="answer" /></p>
</div>


<%!
	/* getParameter(answer3) get the answer of user. */
	public void takeMultiResponse(JspWriter myOut, MultiResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		int count = pr.getCount();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question);
		for (int i = 0; i < count; i++) {
			myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer\" "+ index + " />");
		}
		myOut.println("</p></div>");
	}
%>
<!-- MultiResponse -->
<div class = "container">
	<p><h5>Problem 5:</h5> List three of the energetic boys?</p>
	<p><input type="text" placeholder="Answer" size="8" name="answer"/></p>
	<p><input type="text" placeholder="Answer" size="8" name="answer"/></p>
	<p><input type="text" placeholder="Answer" size="8" name="answer"/></p>
</div>



<form action="QuizResultServlet" method="post">

<% takeSingleChoice(out, mc, 3); %>


<input type="submit" value = "Submit Answer"/>
</form>

</body>
</html>