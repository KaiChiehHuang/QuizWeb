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
					<div class="container">
						<p><h3>Creating Single/Multi Choice Problem: </h5> </p>
						<input type="hidden" name = "type" value = "MC">
						<p><h5>Question: </h5> </p>
						<input type="text" size = "20" name = "question" placeholder="Question">
					<div>
						<p><h5>Choice: </h5> </p>
						<input type="text" class="form-control" name = "choice" placeholder="Choice">
					</div>
					<div>
						<p><h5>Answer(Must be one/some of choices) : </h5> </p>
						<input type="text" class="form-control" name = "answer" placeholder="Answer">
					</div>
					</div>
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
				
<div class="container">
	<p><h3>Creating Fill Blank Problem: </h5> </p>
	<input type="hidden" name = "type" value = "FB">
	<p><h5>Question: </h5> </p>
	<div>
		<input type="text" class="form-control" name = "fbquestion" placeholder="Question">
		<p><h5>Blank field: </h5> </p>
		<input type="text" class="form-control" name = "answer" placeholder="Answer">
		<p><h5>Question part 2: </h5> </p>
		<input type="text" class="form-control" name = "fbquestion" placeholder="Question">
	</div>
</div>

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

<div class="container">
	<p><h3>Creating Picture Respond Problem: </h5> </p>
	<input type="hidden" name = "type" value = "PR">
	<p><h5>Question: </h5> </p>
	<input type="text" class="form-control" name = "question" placeholder="Question">
	<div>
		<p><h5>Picture: </h5> </p>
		<input type="text" class="form-control" name = "picture" placeholder="Picture URL">
	</div>
	<div>
		<p><h5>Answer: </h5> </p>
		<input type="text" class="form-control" name = "answer" placeholder="Answer">
	</div>
</div>

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

<div class="container">
	<p><h3>Creating Question Respond Problem: </h5> </p>
	<input type="hidden" name = "type" value = "QR">
	<p><h5>Question: </h5> </p>
	<input type="text" class="form-control" name = "question" placeholder="Question">
	<div>
		<p><h5>Answer: </h5> </p>
		<input type="text" class="form-control" name = "answer" placeholder="Answer">
	</div>
</div>

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
				
<div class="container">
	<p><h3>Creating Multiple Respond Problem: </h5> </p>
	<input type="hidden" name = "type" value = "MR">
	<p><h5>Question: </h5> </p>
	<input type="text" class="form-control" name = "question" placeholder="Question">
	<div>
		<p><h5>Answer: </h5> </p>
		<input type="text" class="form-control" name = "answer" placeholder="Answer">
	</div>
	<p><h5>Should the answers be ordered?</h5> </p>
	<div class="radio">
		  <label><input type="radio" name="ordered" value="Yes">Yes</label>
	</div>
		<div class="radio">
		  <label><input type="radio" name="ordered" value="No">No</label>
	</div>
</div>
				
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
	
</body>
</html>