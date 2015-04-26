<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMessage = (String)request.getAttribute("errorMessage");
%>
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
			<form id="register" class="navbar-form" action="register" method="POST">
				<h1>Register</h1>
				<div class="input-group">
				<span class="input-group-addon">First Name:</span>
				<input class="form-control" type=text name=fName placeholder="Ex: John">
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Last Name:</span>
				<input class="form-control" type=text name=lName placeholder="Ex: Smith">
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Address:</span>
				<input class="form-control" type=text name=address placeholder="Ex: 123 Cherry Street">
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">City:</span>
				<input class="form-control" type=text name=city placeholder="Ex: Athens">
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">State:</span>
				<input class="form-control" type=text name=state placeholder="Ex: GA or Georgia">
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Zipcode:</span>
				<input class="form-control" type=text name=zip placeholder="Ex: 30606">
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Username:</span>
				<input class="form-control" type=text name=uName placeholder="Ex: jsmith123">
				</div>
				<br>
				<div class="input-group">
				<span class="input-group-addon">Password:</span>
				<input class="form-control" type=password name=password placeholder="">
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
	<div class="row">
		<div class="col-md-4"></div>
		<%
			if(errorMessage != null)
			{
		%>
		<div class="alert alert-danger col-md-4" role="alert" style="margin-top:5px;">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span><%=errorMessage %></span>
		</div>
		<br>
		<%
			} 
		%>
		<div class="col-md-4"></div>
	</div>
</div>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
<script src="Scripts/jquery.validate.min.js"></script>
<script src="Scripts/js/validation/register.js"></script>
</html>