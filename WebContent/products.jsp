<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%
	Cart cart = (Cart)session.getAttribute("cart");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Products to Purchase</title>
<link rel="stylesheet" href="Scripts/css/bootstrap.min.css"></link>
</head>
<body>
	<!-- Title -->
	<div>
		<h1 class="page-header">Product Shopper</h1>
		<button class="btn btn-default" style="background-color:yellow; color:black;">My Cart</button>
	</div>
	<!-- Body -->
	<div>
		<form action="addProduct" method=POST>
		<!-- 
		<c:forEach var="current" items="${products}">
			<div>
				<h4>${current.name}</h4><br>
				<div><img src="images/${current.url}" style="height:200px; width:300px;"></div><br>
				<h4>Price: $${current.price }</h4><br>
				<h4>Remaining Items: ${current.quantity}</h4>
				<input class="form-control" type=text name="${current.name}Quantity"><br>
				<button type="submit" class="btn btn-default">Add to Cart</button>
			</div>
		</c:forEach>-->
		</form>
	</div>
	<!-- Footer -->
	<div>
	</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
</body>
</html>