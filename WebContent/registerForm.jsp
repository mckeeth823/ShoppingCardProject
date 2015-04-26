<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel="stylesheet" href="Scripts/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="style.css"></link>
</head>
<body>
<!-- Header -->
<div>
	<h1 class="page-header">Product Shopper</h1>
</div>
<!-- Body -->
<div class="container">
	<div class="row">
		<div class="col-md-4"></div>
	 	<div class="col-md-4" style="background-color:#DBECF9; margin:0 auto; text-align:center; box-shadow:0px 0px 2px 0px grey;">
			<form class="navbar-form" action="register" method="POST">
				<h1>Register</h1>
				<div class="input-group">
				<span class="input-group-addon">First Name:</span>
				<input class="form-control" type=text name=fName placeholder="Ex: John" required>
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Last Name:</span>
				<input class="form-control" type=text name=lName placeholder="Ex: Smith" required>
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Address:</span>
				<input class="form-control" type=text name=address placeholder="Ex: 123 Cherry Street" required>
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">City:</span>
				<input class="form-control" type=text name=city placeholder="Ex: Athens" required>
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">State:</span>
				<input class="form-control" type=text name=state placeholder="Ex: GA or Georgia" required>
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Zipcode:</span>
				<input class="form-control" type=text name=zip placeholder="Ex: 30606" required>
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Username:</span>
				<input class="form-control" type=text name=uName placeholder="Ex: jsmith123" required>
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Password:</span>
				<input class="form-control" type=password name=password placeholder="" required>
				</div>
				<br>
				<div class="input-group" style="margin-top:10px">
				<input class="form-control" type=submit name=submit value="Submit">
				</div>
				<br>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
</html>