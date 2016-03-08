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
<title>Create Questions</title>
</head>
<body>

<h1>Create Questions</h1>

<%
/* 	String authorID = (String) request.getParameter("userID"); 

	Quiz quiz = new Quiz();
	quiz.setQuizID();
	quiz.setAuthor(authorID);
	
	session.setAttribute("newQuiz", quiz); */
	
%>

<!-- Multiple Choice Problem -->
<div class="container">
	<div class="panel panel-default" style="height: 60px;">
		<div class="panel-body"
			style="font-family: 'Ek Mukta'; color: #C71585; font-size: 18px; font-weight: bold;">
			<div class="row">
			   <div class="col-sm-2">Questions</div>
			
				<div class = "btn-group btn-group-me col-sm-10" style="text-align: right">
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseChoices" aria-expanded="false"
						aria-controls="collapseChoices">
						Choices
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseFillBlank" aria-expanded="false"
						aria-controls="collapseFillBlank">
						Fill Blank
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapsePictureResponse" aria-expanded="false"
						aria-controls="collapsePictureResponse">
						Picture Response
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseQuestionResponse" aria-expanded="false"
						aria-controls="collapseQuestionResponse">
						Question Response
					</button>
					<button class="btn btn-info" type="button" data-toggle="collapse"
						data-target="#collapseMultiResponse" aria-expanded="false"
						aria-controls="collapseMultiResponse">
						Multiple Response
					</button>
				</div>	
		    </div>			
		</div>
	</div>
	
	<div class="collapse" id="collapseChoices">
			<div class="well"
				style="height: 300px; background-color: black;">
				<form action="QuizCreateServlet" method="post">	
				Choices
				<div class="text-right">
				<input type="submit" class="btn btn-info" value = "Add Question"></input>
				</div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapseFillBlank">
			<div class="well"
				style="height: 300px; background-color: black;">
				<form action="QuizCreateServlet" method="post">	
				FillBlank
				<div class="text-right">
				<input type="submit" class="btn btn-info" value = "Add Question"></input>
				</div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapsePictureResponse">
			<div class="well"
				style="height: 300px; background-color: black;">
				<form action="QuizCreateServlet" method="post">	
				PictureResponse
				<div class="text-right">
				<input type="submit" class="btn btn-info" value = "Add Question"></input>
				</div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapseQuestionResponse">
			<div class="well"
				style="height: 300px; background-color: black;">
				<form action="QuizCreateServlet" method="post">	
				QuestionResponse
				<div class="text-right">
				<input type="submit" class="btn btn-info" value = "Add Question"></input>
				</div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapseMultiResponse">
			<div class="well"
				style="height: 300px; background-color: black;">
				<form action="QuizCreateServlet" method="post">	
				MultiResponse
				<div class="text-right">
				<input type="submit" class="btn btn-info" value = "Add Question"></input>
				</div>
                </form>
			</div>
	</div>
	
</div> 

<%--  <%
	for (int i = 1; i < problems.size() + 1; i++) {
		Problem pro = problems.get(i-1);
		String type = pro.getType();
		if (type == "QuestionResponse") {
			QuestionResponse qr = (QuestionResponse)pro;
			createQuestionResponse(out, qr, i);
		} else if (type == "FillBlank") {
			FillBlank fb = (FillBlank)pro;
			createFillBlank(out, fb, i);
		} else if (type == "PictureResponse") {
			PictureResponse pr = (PictureResponse)pro;
			createPictureResponse(out, pr, i);
		} else if (type == "MultiChoice") {
			MultiChoice mc = (MultiChoice)pro;
			if (mc.getCount() == 1) {
				createSingleChoice(out, mc, i);
			} else {
				createMultiChoice(out, mc, i);
			}
		} else if (type == "MultiResponse") {
			MultiResponse mr = (MultiResponse) pro;
			createMultiResponse(out, mr, i);
		}
	}
%> --%>
<div class="text-center">
<a href="QuizCreatedSuccess.jsp" class="btn btn-info"  role="button">Submit</a>
</div>
<%-- <%!
	/* getParameter(answer1) get the answer of user. */
	public void setProperty(JspWriter myOut) throws IOException {
		
		myOut.println("<div class=\"container\">");
		
		// Random
		myOut.println("<p><h5>Random: Is the problems in quiz randomly ordered? </h5> </p>");
		myOut.println("<div class=\"radio\">");
		
		for (int i = 0; i < choices.length; i++) {
			
			myOut.println("<label><input type=\"radio\" name=\"answer"+ index + "\" value=\"" + choices[i]+ "\" />" + choices[i] + "</label>");
/* 			myOut.println("<label><input type=\"radio\" name=\"answer"+ index + "\" />" + choices[i] + "</label>"); */
			myOut.println("</div>");
		}
		myOut.println("</div>");
	}
%>

<%!
	/* getParameter(answer1) get the answer of user. */
	public void createSingleChoice(JspWriter myOut, MultiChoice mc, int index) throws IOException {
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
	public void createFillBlank(JspWriter myOut, FillBlank fb, int index) throws IOException {
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
	public void createPictureResponse(JspWriter myOut, PictureResponse pr, int index) throws IOException {
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
	public void createQuestionResponse(JspWriter myOut, QuestionResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		
		myOut.println("<div class = \"container\"><p>" + "<h5>Problem "+ index + ": </h5>" + question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" />");
		myOut.println("</p></div>");
	}
%>

<%!
	/* getParameter(answer5) get the answer of user. */
	public void createMultiResponse(JspWriter myOut, MultiResponse pr, int index) throws IOException {
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
	public void createMultiChoice(JspWriter myOut, MultiChoice mc, int index) throws IOException {
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
 --%>
</body>
</html>