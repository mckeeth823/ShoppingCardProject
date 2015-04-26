<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%
	Cart cart = (Cart)session.getAttribute("cart");
	ArrayList<Product> inventory = (ArrayList<Product>)session.getAttribute("inventory");
	String rowStart = "<div class=\"row\">";
	String rowEnd = "</div>";
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
	<div class="container" style="background-color:#DBECF9; margin:0 auto; text-align:center; box-shadow:0px 0px 2px 0px grey;">
		<div class="row">
		<form action="addProduct" method=POST> 
		<c:forEach var="current" items="${inventory}" varStatus="loop">
			<!-- Testing if it is going in the first column -->
			<c:if test="(getCategoryIndex(${loop.index}) % 3) == 1">
				<%=rowStart %>
				<div class="col-md-4">
					<h4>${current.name}</h4><br>
					<div><img src="images/${current.url}"></div><br>
					<h4>Price: $${current.price }</h4><br>
					<h4>Remaining Items: ${current.quantity}</h4>
					<input class="form-control" type=text name="quantity"><br>
					<input class="form-control" type=text name="id" value=${current.id }><br>
					<button type="submit" class="btn btn-default">Add to Cart</button>
				</div>
			</c:if>
			<!-- Testing if it is going in the middle column -->
			<c:if test="(getCategoryIndex(${loop.index}) % 3) == 2">
				<div class="col-md-4">
					<h4>${current.name}</h4><br>
					<div><img src="images/${current.url}"></div><br>
					<h4>Price: $${current.price }</h4><br>
					<h4>Remaining Items: ${current.quantity}</h4>
					<input class="form-control" type=text name="quantity"><br>
					<input class="form-control" type=text name="id" value=${current.id }><br>
					<button type="submit" class="btn btn-default">Add to Cart</button>
				</div>
			</c:if>
			<!-- Testing if it is going in the last column -->
			<c:if test="(getCategoryIndex(${loop.index}) % 3) == 0">
				<div class="col-md-4">
					<h4>${current.name}</h4><br>
					<div><img src="images/${current.url}"></div><br>
					<h4>Price: $${current.price }</h4><br>
					<h4>Remaining Items: ${current.quantity}</h4>
					<input class="form-control" type=text name="quantity"><br>
					<input class="form-control" type=text name="id" value=${current.id }><br>
					<button type="submit" class="btn btn-default">Add to Cart</button>
				</div>
				<%=rowEnd %>
			</c:if>
		</c:forEach>
		</form>
		</div>
	</div>
	<!-- Footer -->
	<div>
	</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
</body>
</html>