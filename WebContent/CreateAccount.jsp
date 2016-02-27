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
<title>Create New Account</title>
</head>
<body>
		<h1 style="text-align:center;">Create Your Account</h1>
		
		<div style="text-align:left;left:50%;width:400px;margin-left:-200px;top:200px;position:absolute;">
		<p> Please enter your ID and password... </p>
			<form action="CreateNewAccount" method="post"> 
			<div class="input-group">
	  			<span class="input-group-addon" id="basic-addon1">ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  			<input type="text" class="form-control" placeholder="UserID" aria-describedby="basic-addon1" name="userID">
			</div>
			<div class="input-group">
	  			<span class="input-group-addon" id="basic-addon1">Password</span>
	  			<input type="text" class="form-control" placeholder="Password" aria-describedby="basic-addon1" name="password">
			</div>	
			<div style="text-align:right">
				<input type="submit" class="btn btn-danger" value="Create"></input>
			</div>
			</form>
		</div>
</body>
</html>