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
		style="position: fixed; width: 100%; height: 50px; top: 0px; left: 0; z-index: 2; text-align: center; background-color: black; color: #FAF0E6; opacity: 0.95;">

		<div
			style="position: absolute; left: 0px; width: 300px; height: 100%; background-color: black;">
			<div style="position: absolute; left: 0px; top: 5px; width: 250px; height: 45; background-color: black;">
				<a href="HomePage.jsp"><h4 style="color:#ffb3b3;">QuizThatShit</h4></a>
			</div>
		</div>

		<div class="col-lg-6"
			style="position: absolute; top: 8px; left: 30%; width: 40%;">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" style="font-size:20px;"></span></button>
				</span>
			</div>
			<!-- /input-group -->
		</div>
		<div
			style="position: absolute; right: 5px; width: 300px; height: 100%; background-color: black;">

			<div class="menu-wrap">
				<nav class="menu">
					<ul class="clearfix">
						<li><a href="javascript:pageScrollUp(0)" style="color:yellow;">
							<%
								String userID = (String) session.getAttribute("userID");
								String welcome = "Hi "+userID+"!";
								out.println(welcome);
							%>
							</a>
						</li>
						<li><a href="#">Menu<span class="arrow">&#9660;</span></a>
							<ul class="sub-menu">
								<% String userIDUrl = "QuizCreat.jsp?userID="+userID; 
								   out.print("<li><a href=\""+ userIDUrl+"\">Create Quiz</a></li>");
								%>
								<% String quizRecordUrl = "UserViewHistory.jsp"; 
								   out.print("<li><a href=\""+ quizRecordUrl+"\">Quiz Record</a></li>");
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
<h1>Quiz Problem</h1>

<%
	Quiz quiz = (Quiz)session.getAttribute("quiz");
	String name = quiz.getName();
	String author = quiz.getAuthor();
	String description = quiz.getDescription();
	ArrayList<Problem> problems = new ArrayList<Problem>();
	problems = quiz.getProblems();
	quiz.setOnQuizMode();
	if (quiz.isRandomQuiz()) {
		Collections.shuffle(problems);
	}
	quiz.quizStart();
%>
<form action="QuizResultServlet" method="post">
<div style="border-radius: 20px; position: relative; top: 65px; left: 50%; width: 800px; height: 550px; margin-left: -400px; border-radius: 10px; background-color: rgba(0, 0, 0, 0); overflow: hidden; border: 2px solid #73AD21; padding: 15px;">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" data-interval="false"
			style="border-radius: 20px; position: relative; left: 0%; width: 100%; height: 100%;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active" style="background-color: #73AD21"></li>
 <%
    for (int i = 1; i < problems.size() + 1; i++) {
    	out.println("<li data-target=\"#myCarousel\" data-slide-to=\"" + i + "\"style=\"background-color: #73AD21\"></li>");
    }
 %>
 	<li data-target="#myCarousel" data-slide-to="<%=problems.size() + 1%>" class="active"></li>
  </ol>

<div class="carousel-inner" role="listbox" style="width: 600px; left: 50%; margin-left: -300px">
    <div class="item active" style="height:450px;text-align:center;">
    	<h2 style="color:#C71585;">Basic Information</h2> 
    	<h2>     </h2>
    	<h4>Name: <%=name %></h4>
    	<h2>     </h2>
    	<h4>Author: <%=author %></h4>
    	<h2>     </h2>
    	<h4>Description: <%=description %></h4>
    </div>
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
    <div class="item"
    	style="position: fixed;  width: 600px; margin-left: -300px; left: 50%;">
    	<h2>Congratulations!</h2> 
    	<h2>     </h2>
    	<h4>You can submit now!</h4>
    </div>
</div>
</div>


<%!
	/* getParameter(answer1) get the answer of user. */
	public void takeSingleChoice(JspWriter myOut, MultiChoice mc, int index) throws IOException {
		String[] choices = mc.getChoices();
		String question = mc.getQuestion();
		
		myOut.println("<div class=\"item\" style=\"height:450px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%;\">");
		myOut.println("<p>"+ "<h5>Problem " + index + ": </h5>"+question +"</p>");
		myOut.println("<div style=\"text-align: left\">");
		for (int i = 0; i < choices.length; i++) {
			myOut.println("<div class=\"radio\">");
			myOut.println("<label><input type=\"radio\" name=\"answer"+ index + "\" value=\"" + choices[i]+ "\" />" + choices[i] + "</label>");
			myOut.println("</div>");
		}
		myOut.println("</div>");
		myOut.println("</div>");
		myOut.println("</div>");
	}
%>

<%!
	/* getParameter(answer2) get the answer of user. */
	public void takeFillBlank(JspWriter myOut, FillBlank fb, int index) throws IOException {
		String que = fb.getQuestion();
		String[] question = new String[2];
		question = que.split("\\|\\|\\|\\|\\|\\|");
		
		myOut.println("<div class=\"item\" style=\"height:450px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p><h5>Problem "+ index + ": </h5>" + question[0]);
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
		
		myOut.println("<div class=\"item\" style=\"height:450px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>"+ "<h5>Problem " + index + ": </h5>"+ question);
		myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" /> </p></div>");
		myOut.println("<div class = \"container\" style = \"position: relative; left: 50%; width: 400px; margin-left:-200px\">");
		myOut.println("<img class=\"img-thumbnail\"src =" + url + "></div>");
		myOut.println("</div>");

	}
%>

<%!

	/* getParameter(answer4) get the answer of user. */
	public void takeQuestionResponse(JspWriter myOut, QuestionResponse pr, int index) throws IOException {
		String question = pr.getQuestion();
		
		myOut.println("<div class=\"item\" style=\"height:450px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>"+ "<h5>Problem "+ index + ": </h5>" + question);
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
		
		myOut.println("<div class=\"item\" style=\"height:450px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>" + "<h5>Problem "+ index + ": </h5>" + question);
		
		for (int i = 0; i < count; i++) {
			myOut.println("<input type=\"text\" placeholder=\"Answer\" size=\"8\" name=\"answer"+ index + "\" />");
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
		
		myOut.println("<div class=\"item\" style=\"height:450px;text-align:center;\">");
		myOut.println("<div style=\"position: relative;  width: 400px; margin-left: -200px; left: 50%\">");
		myOut.println("<p>" + "<h5>Problem "+ index + ": </h5>" + question + "</p>");
		
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

<!-- Right controls -->
			</a> <a class="right carousel-control"
				href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
				style="color: #73AD21;"></span> <span class="sr-only">Next</span>
			</a>
 
</div>

<div class="text-center"
style="position: fixed;  width: 100%; height: 20%; top: 80%; left: 0; background-color: rgba(225, 196, 193, 0.6)">
<h2>     </h2>
<input type="submit" value = "Submit Answer"/>
</form>
</div>

</body>
</html>