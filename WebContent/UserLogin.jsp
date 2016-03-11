<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<title>Online Quizbook</title>
</head>
<body style="background-color:#FFFAFA; background-image:url(loginBackground.jpg);background-size: 100%;">
		
		<div style="border-radius: 20px;
    				border: 2px solid #73AD21;
    				padding: 10px; 
				    height: 300px;
     				text-align:left;
     				left:50%;width:400px;
     				margin-left:-200px;
     				top:200px;
     				position:absolute;
     				background-color: rgba(255,255,255,0.9);
     				">
     	<% session.setAttribute("userID","Guest"); %>
     	
		<p> Please log in or<!-- Need to inform HomePage it's guest --><a href="GuestHomePage.jsp"> log in as Guest </a> / <a href="AdminLogin.jsp" style="color:#B22222;"> log in as Admin </a></p>
			<form action="UserLogin" method="post"> 
			<div class="input-group" style="opacity: 0.95;">
	  			<span class="input-group-addon" id="basic-addon1">ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  			<input type="text" class="form-control" placeholder="UserID" aria-describedby="basic-addon1" name="userID">
			</div>
			<br>
			<div class="input-group" style="opacity: 0.95;">
	  			<span class="input-group-addon" id="basic-addon1">Password</span>
	  			<input type="text" class="form-control" placeholder="Password" aria-describedby="basic-addon1" name="password">
			</div>	
			<br>
			<div style="text-align:right">
				<input type="submit" class="btn btn-info" value="Login"></input>
			</div>
			<hr style="
				border:none;	
				border-top:1px #CCCCCC solid;
				height: 1px;
				">	
			<div style="text-align:center">
				<p> Don't have an account? </p>
				<a href="CreateAccount.jsp"> Create New Account </a>
			</div>
			</form>
		</div>
</body>
</html>