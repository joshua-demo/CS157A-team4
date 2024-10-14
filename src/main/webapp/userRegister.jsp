<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="registerStyles.css">
<title>Study Smart</title>
</head>
<body>
	<header>
		<h1 id="study-smart-title">StudySmart</h1>
		<br> <br> <br>
	</header>
	
	<form action="URegister" method="post">
		<table class="register-fields">
			<tr>
				<td>Username</td>
				<td><input type="text" name="userID" /></td>
			</tr>
			<tr>
				<td>Full Name</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Register!" /></td>
			</tr>
		</table>
	</form>
</body>
</html>