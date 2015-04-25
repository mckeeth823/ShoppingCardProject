<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
	<form action="register" method="POST">
		<h1>Fill out the required fields.</h1>
		<label>First Name:</label>
		<input type=text name=fName placeholder="first name" required>
		<br>
		<label>Last Name:</label>
		<input type=text name=lName placeholder="last name" required>
		<br>
		<label>Address:</label>
		<input type=text name=address placeholder="street" required>
		<br>
		<label>City:</label>
		<input type=text name=city placeholder="city" required>
		<br>
		<label>State:</label>
		<input type=text name=state placeholder="state" required>
		<br>
		<label>Zip:</label>
		<input type=text name=zip placeholder="zip" required>
		<br>
		<label>Username:</label>
		<input type=text name=uName placeholder="username" required>
		<br>
		<label>Password:</label>
		<input type=password name=password placeholder="password" required>
		<br>
		<input type=submit name=submit value="Register">
		<br>
	
	</form>
</body>
</html>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
</body>
</html>