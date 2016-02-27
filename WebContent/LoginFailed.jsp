<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Failed</title>
</head>
<body>
		<h1>Please Try Again</h1>
		<p> Either your user name or password is incorrect. Please try again. </p>
		<form action="UserLogin" method="post">
		<p>User Name: <input type="text" name="userName" />
		<p>Password: <input type="text" name="password" />
		<input type="submit" value="Login"/></p>
		</form>
		<a href="createNewAccount.html"> Create New Account </a>
</body>
</html>