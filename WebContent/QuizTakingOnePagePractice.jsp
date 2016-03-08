<%@page import="java.util.ArrayList"%>
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
	Quiz quiz = (Quiz)session.getAttribute("quiz");
	ArrayList<Problem> problems = new ArrayList<Problem>();
	quiz.quizStart();
	problems = quiz.getProblems();
	quiz.setOnPracticeMode();
%>

<form action="QuizResultServlet" method="post">

<%
	for (int i = 1; i < problems.size() + 1; i++) {
		Problem pro = problems.get(i-1);
		String type = pro.getType();
		if (type == "QuestionResponse") {
			QuestionResponse qr = (QuestionResponse)pro;
			takeQuestionResponse(out, qr, i);
		} else if (type == "FillBlank") {
			FillBlank fb = (FillBlank)pro;
			takeFillBlank(out, fb, i);
		} else if (type == "PictureResponse") {
			PictureResponse pr = (PictureResponse)pro;
			takePictureResponse(out, pr, i);
		} else if (type == "MultiChoice") {
			MultiChoice mc = (MultiChoice)pro;
			if (mc.getCount() == 1) {
				takeSingleChoice(out, mc, i);
			} else {
				takeMultiChoice(out, mc, i);
			}
		} else if (type == "MultiResponse") {
			MultiResponse mr = (MultiResponse) pro;
			takeMultiResponse(out, mr, i);
		}
	}
%>
<input type="submit" value = "Submit Answer"/>
</form>

<%!
	/* getParameter(answer1) get the answer of user. */
	public void takeSingleChoice(JspWriter myOut, MultiChoice mc, int index) throws IOException {
		String[] choices = mc.getChoices();
		String question = mc.getQuestion();
		
		myOut.println("<div class=\"container\">");
		myOut.println("<p>"+ "<h5>Problem " + index + ": </h5>"+question +"</p>");
		for (int i = 0; i < choices.length; i++) {
			myOut.println("<div class=\"radio\">");
			myOut.println("<label><input type=\"radio\" name=\"answer"+ index + "\" value=\"" + choices[i]+ "\" />" + choices[i] + "</label>");
/* 			myOut.println("<label><input type=\"radio\" name=\"answer"+ index + "\" />" + choices[i] + "</label>"); */
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
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question[0]);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" />");
		myOut.println(question[1] + "</p></div>");

	}
%>

<%!
	/* getParameter(answer3) get the answer of user. */
	public void takePictureResponse(JspWriter myOut, PictureResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		String url = pr.getURL();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" /> </p></div>");
		myOut.println("<div class = \"container\" style = \"position: relative; left: 50%; width: 400px; margin-left:-200px\">");
		myOut.println("<img class=\"img-thumbnail\"src =" + url + "></div>");

	}
%>

<%!

	/* getParameter(answer4) get the answer of user. */
	public void takeQuestionResponse(JspWriter myOut, QuestionResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" />");
		myOut.println("</p></div>");
	}
%>

<%!
	/* getParameter(answer5) get the answer of user. */
	public void takeMultiResponse(JspWriter myOut, MultiResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		int count = pr.getCount();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question);
		for (int i = 0; i < count; i++) {
			myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" />");
		}
		myOut.println("</p></div>");
	}
%>

<%!
	/* getParameter(answer6) get the answer of user. */
	public void takeMultiChoice(JspWriter myOut, MultiChoice mc, int index) throws IOException {
		String question = mc.getQuestion();
		String[] choices = mc.getChoices();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question + "</p>");
		for (int i = 0; i < choices.length; i++) {
			myOut.println("<label class=\"checkbox-inline\"> <input type=\"checkbox\" name=\"answer" + index + "\" value=\"" + choices[i] + "\">");
			myOut.println(choices[i] +" </label><br>");
		}
		
		myOut.println("</div>");
	}
%>

</body>
</html>