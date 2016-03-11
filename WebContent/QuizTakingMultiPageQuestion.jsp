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
<style>
/*----- Menu Outline -----*/
.menu-wrap {
	width: 100%;
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);
	background: black;
}

.menu {
	width: 300px;
	margin: 0px auto;
}

.menu li {
	margin: 0px;
	list-style: none;
	font-family: 'Ek Mukta';
}

.menu a {
	transition: all linear 0.15s;
	color: #919191;
}

.menu li:hover>a, .menu .current-item>a {
	text-decoration: none;
	color: #be5b70;
}

.menu .arrow {
	font-size: 11px;
	line-height: 0%;
}

/*----- Top Level -----*/
.menu>ul>li {
	float: left;
	display: inline-block;
	position: relative;
	font-size: 19px;
}

.menu>ul>li>a {
	padding: 10px 30px;
	display: inline-block;
	text-shadow: 0px 1px 0px rgba(0, 0, 0, 0.4);
}

.menu>ul>li:hover>a, .menu>ul>.current-item>a {
	background: #2e2728;
}

/*----- Bottom Level -----*/
.menu li:hover .sub-menu {
	z-index: 1;
	opacity: 1;
}

.sub-menu {
	width: 140%;
	padding: 5px 0px;
	position: absolute;
	top: 100%;
	left: 0px;
	z-index: -1;
	opacity: 0;
	transition: opacity linear 0.15s;
	box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.2);
	background: #2e2728;
}

.sub-menu li {
	display: block;
	font-size: 16px;
}

.sub-menu li a {
	padding: 10px 30px;
	display: block;
}

.sub-menu li a:hover, .sub-menu .current-item a {
	background: #3e3436;
}

.carousel-control.right {
    background-image: none
}

<script type='text/javascript'>
	function pageScrollUp(position) {
		var yPos = window.pageYOffset;
		yPos -= 95;
		if (yPos < position) {
			yPos = position;
		}
		window.scroll(0, yPos); // horizontal and vertical scroll increments
		scrolldelay = setTimeout('pageScrollUp(\'' + position + '\')', 45); // scrolls every 100 milliseconds
		if (yPos == position) {
			clearTimeout(scrolldelay);
		}
	}
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip({
	        placement : 'top'
	    });
	});
	$(function() {
		$('[data-tooltip="true"]').tooltip();
		});
	function myFunction() {
	    document.getElementById("receiver").defaultValue = "Goofy";
	}
	
</script>
</style>
<title>Quiz</title>
</head>
<body style="height:770px;background-size:100%;background-color:#fffff6;">
<div
		style="position: fixed; width: 100%; height: 50px; top: 0px; left: 0; z-index: 2; text-align: center; background-color: black; color: #FAF0E6; opacity: 0.8;">

		<div
			style="position: absolute; left: 0px; width: 300px; height: 100%; background-color:black;">
			<div
				style="position: absolute; left: 0px; top: 5px; width: 250px; height: 45; background-color: black;">
				<% 
					String userID = (String) session.getAttribute("userID");
					if(userID.equals("Guest")) {
						out.print("<a href=\"GuestHomePage.jsp\"><h4 style=\"color: #ffb3b3;\">QuizzGo</h4></a>");
					}else{
						out.print("<a href=\"HomePage.jsp\"><h4 style=\"color: #ffb3b3;\">QuizzGo</h4></a>");
					}
				%>
			</div>
		</div>

		<div class="col-lg-6"
			style="position: absolute; top: 8px; left: 30%; width: 40%;">
			<form action="SearchServlet" method="post" id="search">
				<div class="input-group">
					<input type="text" name="targetToSearch" class="form-control" placeholder="Search for...">
					<span class="input-group-btn" style="width:65px"> 
					<select class="selectpicker form-control" id="sel1" name="searchOption">
							<option value="quiz">Quiz</option>
							<option value="user">User</option>
					</select>
					</span> <span class="input-group-btn">
						<button type="submit" form="search" class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search" style="font-size: 20px;"></span>
						</button>
					</span>
				</div>
			</form>
			<!-- /input-group -->
		</div>
		<div
			style="position: absolute; right: 5px; width: 300px; height: 100%; background-color: black;">

			<div class="menu-wrap">
				<nav class="menu">
					<ul class="clearfix">
						<li style="left:-10px;width:110px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><a href="javascript:pageScrollUp(0)" style="top:30px;padding:10px 1px;color:yellow;">
							<%
								userID = (String) session.getAttribute("userID");
								String welcome = "Hi "+userID+"!";
								out.println(welcome);
							%>
							</a>
						</li>
						<li><a href="#">Menu<span class="arrow">&#9660;</span></a>
							<ul class="sub-menu">
								<% 
								   if(userID.equals("Guest")) {
									   out.print("<li><a href=\"CreateAccount.jsp\">Create Account</a></li>");
								   }else{
									   String userIDUrl = "QuizCreat.jsp?userID="+userID; 
									   String quizRecordUrl = "UserViewHistory.jsp"; 
									   out.print("<li><a href=\""+ userIDUrl+"\">Create Quiz</a></li>");
									   out.print("<li><a href=\""+ quizRecordUrl+"\">Quiz Record</a></li>");
								   }
								%>
								<% String announceUrl = "UserViewAnnoun.jsp"; 
								   out.print("<li><a href=\""+ announceUrl +"\">Announcements</a></li>");
								%>
								<li><a href="UserLogin.jsp">Logout</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- /.col-lg-6 -->
	</div>

<%
	Quiz quiz = (Quiz)session.getAttribute("quiz");
	int index = (Integer)session.getAttribute("index");
	ArrayList<Problem> problems = (ArrayList<Problem>)session.getAttribute("problems");
/* 	String url = quiz.getImage();
	String name = quiz.getName();
	String author = quiz.getAuthor();
	String description = quiz.getDescription();
	ArrayList<Problem> problems = new ArrayList<Problem>();
	problems = quiz.getProblems();
	quiz.setOnQuizMode();
	if (quiz.isRandomQuiz()) {
		Collections.shuffle(problems);
	}
	quiz.quizStart(); */
%>
	<form action="MultiPageTransfer" method="post">
		<div class="container"
			style="position: relative; width: 70%; top: 50px; height:500px;">
			<h2 style="text-align: center;">Quiz Problem</h2>
			<div
				style="border-radius: 20px; border: 2px solid #73AD21; padding: 15px; height: 400px; text-align: left; left: 50%; width: 600px; margin-left: -300px; top: 70px; position: absolute; opacity: 0.9; background-color: white; overflow: auto">
				<%
					out.println("<div style=\"position: relative; top: 7%\">");
					Problem pro = problems.get(index - 1);
					String type = pro.getType();
					if (type == "QuestionResponse") {
						QuestionResponse qr = (QuestionResponse) pro;
						takeQuestionResponse(out, qr, index);
					} else if (type == "FillBlank") {
						FillBlank fb = (FillBlank) pro;
						takeFillBlank(out, fb, index);
					} else if (type == "PictureResponse") {
						PictureResponse pr = (PictureResponse) pro;
						takePictureResponse(out, pr, index);
					} else if (type == "MultiChoice") {
						MultiChoice mc = (MultiChoice) pro;
						if (mc.getCount() == 1) {
							takeSingleChoice(out, mc, index);
						} else {
							takeMultiChoice(out, mc, index);
						}
					} else if (type == "MultiResponse") {
						MultiResponse mr = (MultiResponse) pro;
						takeMultiResponse(out, mr, index);
					}
					out.println("</div>");
				%>
			</div>
		</div>
		
		<div class="text-center"
			style="position:relative; width: 100%; height: 20%; top: 10px; left: 0px;">
			<h2></h2>
			<input type="submit" class="btn btn-info" value="Next" />
		</div>
		</form>
	
	<%!/* getParameter(answer1) get the answer of user. */
	public void takeSingleChoice(JspWriter myOut, MultiChoice mc, int index) throws IOException {
		String[] choices = mc.getChoices();
		String question = mc.getQuestion();

		myOut.println("<div class=\"item\" style=\"height:400px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%;\">");
		myOut.println("<p>" + "<h4>Problem " + index + ": </h4>" + "<h5 style=\"font-weight: bold; text-align: left\">" + question + "</h5>" + "</p>");
		myOut.println("<div style=\"text-align: left\">");
		for (int i = 0; i < choices.length; i++) {
			myOut.println("<div class=\"radio\">");
			myOut.println("<label><input type=\"radio\" name=\"answer" + index + "\" value=\"" + choices[i] + "\" />"
					+ choices[i] + "</label>");
			myOut.println("</div>");
		}
		myOut.println("</div>");
		myOut.println("</div>");
		myOut.println("</div>");
	}%>

<%!
	/* getParameter(answer2) get the answer of user. */
	public void takeFillBlank(JspWriter myOut, FillBlank fb, int index) throws IOException {
		String que = fb.getQuestion();
		String[] question = new String[2];
		question = que.split("\\|\\|\\|\\|\\|\\|");
		
		myOut.println("<div class=\"item\" style=\"height:400px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p><h4>Problem "+ index + ": </h4>" + question[0]);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" />");
		myOut.println(question[1] + "</p></div>");
		myOut.println("</div>");
	}
%>

<%!
	/* getParameter(answer3) get the answer of user. */
	public void takePictureResponse(JspWriter myOut, PictureResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		String url = pr.getURL();
		
		myOut.println("<div class=\"item\" style=\"height:400px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>"+ "<h4>Problem " + index + ": </h4>" + question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" /> </p></div>");
		myOut.println("<div class = \"container\" style = \"position: relative; left: 50%; width: 200px; margin-left:-150px; max-height: 200px\">");
		myOut.println("<img class=\"img-thumbnail\"src =" + url + "></div>");
		myOut.println("</div>");

	}
%>

<%!

	/* getParameter(answer4) get the answer of user. */
	public void takeQuestionResponse(JspWriter myOut, QuestionResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		
		myOut.println("<div class=\"item\" style=\"height:400px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>"+ "<h4>Problem "+ index + ": </h4>" + question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" />");
		myOut.println("</p></div>");
		myOut.println("</div>");
	}
%>

<%!
	/* getParameter(answer5) get the answer of user. */
	public void takeMultiResponse(JspWriter myOut, MultiResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		int count = pr.getCount();
		
		myOut.println("<div class=\"item\" style=\"height:400px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>" + "<h4>Problem "+ index + ": </h4>" + question);
		
		for (int i = 0; i < count; i++) {
			myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"5\" name=\"answer"+ index + "\" />");
		}
		
		myOut.println("</p></div>");
		myOut.println("</div>");
	}
%>

<%!
	/* getParameter(answer6) get the answer of user. */
	public void takeMultiChoice(JspWriter myOut, MultiChoice mc, int index) throws IOException {
		String question = mc.getQuestion();
		String[] choices = mc.getChoices();
		
		myOut.println("<div class=\"item\" style=\"height:400px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>" + "<h4>Problem "+ index + ": </h4>" + "<h5 style=\"font-weight: bold; text-align: left\">" + question + "</h5>" + "</p>");
		
		myOut.println("<div style=\"text-align: left\">");
		for (int i = 0; i < choices.length; i++) {
			myOut.println("<label class=\"checkbox-inline\"> <input type=\"checkbox\" name=\"answer" + index + "\" value=\"" + choices[i] + "\">");
			myOut.println(choices[i] +" </label><br>");
		}		
		myOut.println("</div>");
		
		myOut.println("</div>");
		myOut.println("</div>");
	}
%>



</body>
</html>