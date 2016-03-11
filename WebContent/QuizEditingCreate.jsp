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
.form-control-inline {
    min-width: 0;
    width: 600px;
    display: inline;
}
</style>
<title>Add Questions</title>
    <SCRIPT type="text/javascript">
        function addRow(tableID) {
 
            var table = document.getElementById(tableID);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var cell1 = row.insertCell(0);
            cell1.style.width='1.8%';
            var element1 = document.createElement("input");
            element1.type = "checkbox";
            element1.style = "border-radius:6px; min-width: 0;  width:10px;  height:34px;";
            element1.name ="choicecheck";
            element1.value = "box" + (rowCount + 1);
            cell1.appendChild(element1);

            var cell2 = row.insertCell(1);
            cell2.style.width='68.2%';
            var element2 = document.createElement("input");
            element2.type = "text";
            element2.style = "border-radius:6px; min-width: 0; width:640px;  height:34px;";
            element2.name = "choice" + (rowCount + 1);
            element2.placeholder="Choice";
            cell2.appendChild(element2);
        }
        
        function addRowResponse(tableID) {
        	 
            var table = document.getElementById(tableID);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 

            var cell2 = row.insertCell(0);
            var element2 = document.createElement("input");
            element2.type = "text";
            element2.style = "border-radius:6px; min-width: 0; width:640px;  height:34px;";
            element2.name = "answer" + (rowCount + 1);
            element2.placeholder="Answer";
            cell2.appendChild(element2);
        }
 
    </SCRIPT>
</head>
<body>
<body style="height:300px; width:100%;background-size:100%;background-color:#fffff6;">

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


<div class="container" style = "position: relative; width:70%; top: 50px;">
  <h2 style="text-align:center;">Create Questions</h2> 
  		<div style="border-radius: 20px;
    				border: 2px solid #73AD21;
    				padding: 15px; 
				    height: 520px;
     				text-align:left;
     				left:50%;width:800px;
     				margin-left:-400px;
     				top:70px;
     				position:absolute;
     				opacity: 0.9;
     				background-color:white;
     				">


<div class="container">
	<div class="panel panel-default" style="height: 60px; width:65%;">
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
				style="height: 410px; width:65%;background-color: white;">
				<form action="QuizEditingAddProblem" method="post">	
					<div class="container">
						<input type="hidden" name = "type" value = "MC">
						<p><h5>Question: </h5> </p>
						
						<input style="width:57%;" type="text" class="form-control form-control-inline" name = "question" placeholder="Question">

						<p><h5>Choice: <p>Please check the right answers before adding question.</p></h5></p>

						<!-- <input type="text" class="form-control form-control-inline" name = "choice" placeholder="Choice"> -->
						
						<INPUT type="button" class="btn btn-info btn-sm" value="Add Choice" onclick="addRow('dataTable')" />
    					<div style="overflow:auto;">
    					<TABLE id="dataTable" border="0" style="position: relative; width:60%; max-height:200px; overflow:auto">
        					<TR>
            				<TD style="width:1.5%;"><INPUT type="checkbox" style="width:10px;" name="choicecheck" value = "box1"/></TD>
            				<TD style="width:58.5%;"> <INPUT type="text" style="border-radius:6px; min-width: 0; width:640px; height:34px;" name = "choice1" placeholder="Choice"> </TD>
        					</TR>
    					</TABLE>
						</div>
					</div>
				<div class="btn-group" role="group" aria-label="..." style="position: relative; top:5px;width:300px; left:50%; margin-left:-100px">
				  <input type="submit" class="btn btn-info btn-sm" value = "Add Question"></input>
				  <a href="QuizEditing.jsp" class="btn btn-sm btn-info"  role="button">Submit</a>
				 </div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapseFillBlank">
			<div class="well"
				style="height: 410px; width:65%;background-color: white;">
				<form action="QuizEditingAddProblem" method="post">	
				
					<div class="container">
						<input type="hidden" name = "type" value = "FB">
						<p><h5>Question: </h5> </p>
						<div>
							<input style="width:60%;" type="text" class="form-control form-control-inline" name = "fbquestion" placeholder="Question">
							<p><h5>Blank field: </h5> </p>
							<input style="width:60%;" type="text" class="form-control form-control-inline" name = "answer" placeholder="Answer">
							<p><h5>Question part 2: </h5> </p>
							<input style="width:60%;" type="text" class="form-control form-control-inline" name = "fbquestion" placeholder="Question">
						</div>
					</div>

				<div class="btn-group" role="group" aria-label="..." style="position: relative; top:8px;width:300px; left:50%; margin-left:-100px">
				  <input type="submit" class="btn btn-info btn-sm" value = "Add Question"></input>
				  <a href="QuizEditing.jsp" class="btn btn-sm btn-info"  role="button">Submit</a>
				 </div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapsePictureResponse">
			<div class="well"
				style="height: 410px; width:65%;background-color: white;">
				<form action="QuizEditingAddProblem" method="post">	

					<div class="container">
						<input type="hidden" name = "type" value = "PR">
						<p><h5>Question: </h5> </p>
						<input style="width:60%;"type="text" class="form-control form-control-inline" name = "question" placeholder="Question">
						<div>
							<p><h5>Picture: </h5> </p>
							<input style="width:60%;"type="text" class="form-control form-control-inline" name = "picture" placeholder="Picture URL">
						</div>
						<div>
							<p><h5>Answer: </h5> </p>
							<input style="width:60%;"type="text" class="form-control form-control-inline" name = "answer" placeholder="Answer">
						</div>
					</div>

				<div class="btn-group" role="group" aria-label="..." style="position: relative; top:8px;width:300px; left:50%; margin-left:-100px">
				  <input type="submit" class="btn btn-info btn-sm" value = "Add Question"></input>
				  <a href="QuizEditing.jsp" class="btn btn-sm btn-info"  role="button">Submit</a>
				 </div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapseQuestionResponse">
			<div class="well"
				style="height: 410px; width:65%;background-color: white;">
				<form action="QuizEditingAddProblem" method="post">	

					<div class="container">
						<input type="hidden" name = "type" value = "QR">
						<p><h5>Question: </h5> </p>
						<input style="width:60%;" type="text" class="form-control form-control-inline" name = "question" placeholder="Question">
						<div>
							<p><h5>Answer: </h5> </p>
							<input style="width:60%;" type="text" class="form-control form-control-inline" name = "answer" placeholder="Answer">
						</div>
					</div>

				<div class="btn-group" role="group" aria-label="..." style="position: relative; top:8px;width:300px; left:50%; margin-left:-100px">
				  <input type="submit" class="btn btn-info btn-sm" value = "Add Question"></input>
				  <a href="QuizEditing.jsp" class="btn btn-sm btn-info"  role="button">Submit</a>
				</div>
                </form>
			</div>
	</div>
	
	<div class="collapse" id="collapseMultiResponse">
			<div class="well"
				style="height: 410px; width:65%;background-color: white;">
				<form action="QuizEditingAddProblem" method="post">	
				
						<div class="container">
							<input type="hidden" name = "type" value = "MR">
							<p><h5>Question: </h5> </p>
							<input style="width:56%;" type="text" class="form-control form-control-inline" name = "question" placeholder="Question">
							<div>
								<p><h5>Answer: If there exists parallel answers, please split them by "#"</h5></p>
								<p>eg: CA#California</p>
								<INPUT type="button" class="btn btn-info btn-sm" value="Add Answer" onclick="addRowResponse('dataTableMR')" />
    							<div style="overflow:auto;">
			    					<TABLE id="dataTableMR" border="0" style="position: relative; width:618px;; max-height:100px; overflow:auto">
			        					<TR>
			            				<TD style="width:60%;"> <INPUT type="text" style="border-radius:6px; min-width: 0; width:640px; height:34px;" name = "answer1" placeholder="Answer"> </TD>
			        					</TR>
			    					</TABLE>
			    				</div>
							</div>
							<p><h5>Should the answers be ordered? (Default: unordered)</h5> </p>
							<div class="radio">
								  <label><input type="radio" name="ordered" value="Yes">Yes</label>
							</div>
								<div class="radio">
								  <label><input type="radio" name="ordered" value="No">No</label>
							</div>
						</div>
				
				<div class="btn-group" role="group" aria-label="..." style="position: relative; width:300px; left:50%; margin-left:-100px">
				  <input type="submit" class="btn btn-info btn-sm" value = "Add Question"></input>
				  <a href="QuizEditing.jsp" class="btn btn-sm btn-info"  role="button">Submit</a>
				</div>
				
                </form>
			</div>
	</div>





  <div  style = "position: absolute; width:80%; top:530px;"><a href="HomePage.jsp"> Back to Home Page </a></div>
</div>

</div>
</form>
</body>
</html>