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
<title>Admin Login</title>
</head>
<body style="background-color:#282828;">
		<hr style="
				position:relative;top:40px;
				border:none;	
				border-top:1px #CCCCCC solid;
				height: 1px;
				width:60%;
				">	
		<h1 style="text-align:center;position:relative;top:60px;color:white;">Admin Login</h1>
		<hr style="
				position:relative;top:80px;
				border:none;	
				border-top:1px #CCCCCC solid;
				height: 1px;
				width:60%;
				">	
		<div style="border-radius: 20px;
    				border: 2px solid #73AD21;
    				padding: 15px; 
				    height: 310px;
     				text-align:left;
     				left:50%;width:400px;
     				margin-left:-200px;
     				top:220px;
     				position:absolute;
     				opacity: 0.8;
     				background-color:white;
     				">
     	<% session.setAttribute("userID","Guest"); %>
		<p style="display: inline-block;color:#FF1493;"> Invalid Admin ID or Password! Please try again...</a></p>
			<form action="AdminLoginServlet" method="post"> 
			<div class="input-group" style="opacity: 0.95;">
	  			<span class="input-group-addon" id="basic-addon1">Admin ID&nbsp</span>
	  			<input type="text" class="form-control" placeholder="Administrator ID" aria-describedby="basic-addon1" name="adminID">
			</div>
			<br>
			<div class="input-group" style="opacity: 0.95;">
	  			<span class="input-group-addon" id="basic-addon1">Password</span>
	  			<input type="text" class="form-control" placeholder="Administrator Password" aria-describedby="basic-addon1" name="adminPassword">
			</div>	
			<br>
			<div style="text-align:right">
				<input type="submit" class="btn btn-block" value="Login" style="color:white;background-color:#505050;" ></input>
			</div>
			<hr style="
				border:none;	
				border-top:1px #CCCCCC solid;
				height: 1px;
				">	
			<div style="text-align:center">
				<p> Changed your mind? </p>
				<a href="UserLogin.jsp" > Back to user login </a>
			</div>
			</form>
		</div>
</body>
</html>