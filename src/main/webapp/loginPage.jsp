<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="loginStyles.css"> <!-- You can create this stylesheet for styling the login page -->
<title>Study Smart - Login</title>
</head>
<body>
	<header>
		<h1 id="study-smart-title">StudySmart</h1>
		<br> <br> <br>
	</header>
	
	<form action="ULogin" method="post"> <!-- Update with your login servlet name -->
		<table class="login-fields">
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" required /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" required /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Login!" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
