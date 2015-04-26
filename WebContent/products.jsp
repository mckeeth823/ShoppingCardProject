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
<!-- Author: Conner McKeeth -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Products to Purchase</title>
<link rel="stylesheet" href="Scripts/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="style.css"></link>
</head>
<body>
	<!-- Title -->
	<div style="text-align:center;">
		<h1 class="page-header">Product Shopper</h1>
		<a class="btn btn-primary" role="button" href="cart">My Cart<span class="badge"><c:if test="${cart.getProducts().size() >= 1 }">${cart.getSize() }</c:if></span></a>
	</div>
	<!-- Body -->
	<div class="container" style="text-align:center; margin:0 auto;">
		
		<c:forEach var="current" items="${inventory}" varStatus="loop">
			<c:choose>
				<c:when test="${(loop.index+1) % 3 == 1}">
					<form action="addProduct" method=POST> 
						<div class="col-md-4 product">
							<h2>${current.name}</h2>
							<div><img class="productImage" src="images/${current.url}"></div>
							<div class="productDetails">
								<h3>Price: <small> $${current.price }</small></h3>
								<h3>Remaining Items:<small>${current.quantity}</small></h3>
								<h3>Quantity: </h3>
								<input class="form-control qInput" type=text name="quantity" required>
								<input class="form-control" type=hidden name="id" value=${current.id }>
								<button type="submit" class="btn btn-default">Add to Cart</button>
							</div>
						</div>
					</form>
				</c:when>
				
				<c:when test="${(loop.index+1) % 3 == 2}">
					<form action="addProduct" method=POST> 
						<div class="col-md-4 product">
							<h2>${current.name}</h2>
							<div><img class="productImage" src="images/${current.url}"></div>
							<div class="productDetails">
								<h3>Price: <small>$${current.price }</small></h3>
								<h3>Remaining Items: <small>${current.quantity}</small></h3>
								<h3>Quantity: </h3>
								<input class="form-control qInput" type=text name="quantity" required>
								<input class="form-control" type=hidden name="id" value=${current.id }>
								<button type="submit" class="btn btn-default">Add to Cart</button>
							</div>
						</div>
					</form>
				</c:when>
				
				<c:when test="${(loop.index+1) % 3 == 0}">
					<form action="addProduct" method=POST> 
						<div class="col-md-4 product">
							<h2>${current.name}</h2>
							<div><img class="productImage" src="images/${current.url}"></div>
							<div class="productDetails">
								<h3>Price: <small>$${current.price }</small></h3>
								<h3>Remaining Items: <small>${current.quantity}</small></h3>
								<h3>Quantity: </h3>
								<input class="form-control qInput" type=text name="quantity" required>
								<input class="form-control" type=hidden name="id" value=${current.id }>
								<button type="submit" class="btn btn-default">Add to Cart</button>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
		</c:forEach>
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