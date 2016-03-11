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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>

<title>Create New Account</title>
</head>
<body style="height:800px;background-image:url(loginBackground.jpg);background-size: 100%;"">
		<h1 style="text-align:center;">Create Your Account</h1>

	<div
		style="border-radius: 20px; border: 2px solid #73AD21; padding: 40px; height: 610px; text-align: left; left: 50%; width: 500px; margin-left: -250px; top: 180px; position: absolute;opacity: 0.9;background-color:white;">
		<p>Please enter your ID, Password, and Info...</p>
		<hr style="border: none; border-top: 1px #CCCCCC solid; height: 1px;">
		<form action="CreateNewAccount" method="post" data-toggle="validator" role="form">
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
					<input type="text" class="form-control" placeholder="UserID"
						aria-describedby="basic-addon1" name="userID" required>
				</div>
			</div>
				<hr
					style="border: none; border-top: 1px #CCCCCC solid; height: 1px;">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">Password</span> <input
						type="text" class="form-control" placeholder="Password"
						aria-describedby="basic-addon1" name="password" required>
				</div>
				<hr
					style="border: none; border-top: 1px #CCCCCC solid; height: 1px;">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
					<input type="text" class="form-control" placeholder="Name"
						aria-describedby="basic-addon1" name="name" >
				</div>
				<hr
					style="border: none; border-top: 1px #CCCCCC solid; height: 1px;">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">Age&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
					<input type="text" class="form-control" placeholder="Age"
						aria-describedby="basic-addon1" name="age" >
				</div>
				<hr
					style="border: none; border-top: 1px #CCCCCC solid; height: 1px;">
				<select class="form-control" name="gender">
					<option value="Secret">Select Gender</option>
					<option value="Secret">Secret</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select>
				<div style="text-align: center">
					<br> <input type="submit" class="btn btn-danger"
						value="Create"></input>
				</div>
				<hr
					style="border: none; border-top: 1px #CCCCCC solid; height: 1px;">
				<div style="text-align: center">
					<p>Don't want to create an account?</p>
					<!-- Need to inform HomePage it's guest -->
					<a href="UserLogin.jsp"> Back to login</a> / <a href="GuestHomePage.jsp">
						Log in as guest</a>
				</div>
		</form>
	</div>
</body>
</html>