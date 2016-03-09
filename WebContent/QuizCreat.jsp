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
<title>Create a quiz</title>
</head>
<body>

<h1>Create a quiz</h1>

<%
	String authorID = (String) request.getParameter("userID"); 

	Quiz quiz = new Quiz();
	quiz.setAuthor(authorID);
	
	session.setAttribute("newQuiz", quiz); 
	
%>

<form action="QuizCreatServlet" method="post">

<!-- Quiz Properties -->
<!-- name description image -->
<div class = "container">
	<p><h5>Name: </h5> </p>
	<input type="text" class="form-control" name = "name" placeholder="Quiz Name">
	<p><h5>Quiz Description: </h5> </p>
  	<textarea class="form-control" rows="3" name = "description" placeholder="Quiz Description"></textarea>
  	<p><h5>Quiz Picture: </h5> </p>
	<input type="text" class="form-control" name = "picture" placeholder="URL">
</div>

<!-- Random -->
<div class="container">
	<p><h5>Random: Will the problems in quiz display in randomly ordered? </h5> </p>
	<div class="radio">
		  <label><input type="radio" name="Random" value="Yes">Yes</label>
	</div>
		<div class="radio">
		  <label><input type="radio" name="Random" value="No">No</label>
	</div>
</div>

<!-- OnePage -->
<div class="container">
	<p><h5>Page: Will the problems in quiz display in one page or multiple pages? </h5> </p>
	<div class="radio">
		  <label><input type="radio" name="OnePage" value="Yes">One Page</label>
	</div>
		<div class="radio">
		  <label><input type="radio" name="OnePage" value="No">Multiple Pages</label>
	</div>
</div>

<!-- PracticeMode -->
<div class="container">
	<p><h5>Practice Mode: Will this quiz have practice mode? </h5> </p>
	<div class="radio">
		  <label><input type="radio" name="Practice" value="Yes">Yes</label>
	</div>
		<div class="radio">
		  <label><input type="radio" name="Practice" value="No">No</label>
	</div>
</div>
		  
<!-- ImmediateCorrection -->
<div class="container">
	<p><h5>Immediate Correction: Will problems in this quiz be immediately corrected when being taken? </h5> </p>
	<div class="radio">
		  <label><input type="radio" name="ImmCorr" value="Yes">Yes</label>
	</div>
		<div class="radio">
		  <label><input type="radio" name="ImmCorr" value="No">No</label>
	</div>
</div>		

<button type="submit" type="button" class="btn btn-warning" style = "position: relative; left: 50%; width: 120px; margin-left:-60px">Add Questions</button>

</form>
</body>
</html>







<!-- Multiple Choice Problem -->

<!-- Fill Blank Problem -->
<%-- <%!
	/* getParameter(answer1) get the answer of user. */
	public void createFillBlank(JspWriter myOut, int index) throws IOException {
		Problem pro = new FillBlank("FB", true);
		
		myOut.println("<div class=\"container\">");
		myOut.println("<p><h3>Creating Fill Blank Problem: </h5> </p><p> <h5>Question: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"question\""+index+"placeholder=\"Question\">");
		myOut.println("<div><p><h5>Blank field: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"answer\""+index+"placeholder=\"Answer\"></div>");
		myOut.println("<div><p><h5>Question part 2: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"question\""+index+"placeholder=\"Question\"></div>");
		myOut.println("</div>");
	}
%> --%>

<!-- Picture Respond Problem -->
<%-- <%!
	/* getParameter(answer1) get the answer of user. */
	public void createPictureResponse(JspWriter myOut, int index) throws IOException {
		Problem pro = new PictureResponse("MC", true);
		
		myOut.println("<div class=\"container\">");
		myOut.println("<p><h3>Creating Picture Respond Problem: </h5> </p><p> <h5>Question: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"question\""+index+"placeholder=\"Question\">");
		myOut.println("<div><p><h5>Picture: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"picture\""+index+"placeholder=\"Picture URL\"></div>");
		myOut.println("<div><p><h5>Answer: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"answer\""+index+"placeholder=\"Answer\"></div>");
		myOut.println("</div>");
	}
%> --%>

<!-- Question Respond Problem -->
<%-- <%!
	/* getParameter(answer1) get the answer of user. */
	public void createQuestionResponse(JspWriter myOut, int index) throws IOException {
		Problem pro = new QuestionResponse("QR", true);
		
		myOut.println("<div class=\"container\">");
		myOut.println("<p><h3>Creating Question Respond Problem: </h5> </p><p> <h5>Question: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"question\""+index+"placeholder=\"Question\">");
		myOut.println("<div><p><h5>Answer: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"answer\""+index+"placeholder=\"Answer\"></div>");
		myOut.println("</div>");
	}
%> --%>

<!-- Multiple Respond Problem -->
<%-- <%!
	/* getParameter(answer1) get the answer of user. */
	public void createMultiResponse(JspWriter myOut, int index) throws IOException {
		Problem pro = new MultiResponse("MR", true);
		
		myOut.println("<div class=\"container\">");
		myOut.println("<p><h3>Creating Multiple Respond Problem: </h5> </p><p> <h5>Question: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"question\""+index+"placeholder=\"Question\">");
		myOut.println("<div><p><h5>Answer: </h5> </p>");
		myOut.println("<input type=\"text\" class=\"form-control\" name = \"answer\""+index+"placeholder=\"Answer\"></div>");
		myOut.println("</div>");
	}
%> --%>
