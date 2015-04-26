<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%
	// @author: Conner McKeeth
	Cart cart = null;
	String errorMessage = (String)request.getAttribute("errorMessage");	

	if(session.getAttribute("cart") instanceof Cart)
	{
		cart = (Cart)session.getAttribute("cart");
	}
	else
	{
		@SuppressWarnings("unchecked")
		ArrayList<Product> cartProducts = (ArrayList<Product>) session.getAttribute("cart");
		cart = new Cart(cartProducts);
	}
	ArrayList<Product> inventory = (ArrayList<Product>)session.getAttribute("inventory");
	
	
%>
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
		<a class="btn btn-default btn-lg" style="background-color:yellow; margin:10px auto;" role="button" href="cart">
			<span class="glyphicon glyphicon-shopping-cart"></span> My Cart
			<%
				if(cart!=null)
				{
					if(cart.getProducts().size() > 0)
						out.println("<span class=\"badge\">" + cart.getSize() + "</span>");
				}
			%>
		</a>
	</div>
	<!-- Body -->
	<div class="container" style="text-align:center; margin:0 auto;">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 messageBox alert alert-danger" style="display:none"></div>
			<div class="col-md-4"></div>
		</div>
		<div class="row">
			<div class="col-md-4"></div>
			<%
				if(errorMessage != null)
				{
			%>
			<div class="alert alert-danger col-md-4" role="alert" style="margin:10px auto;">
  				<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span><%=errorMessage %></span>
			</div>
			<br>
			<%
				} 
			%>
			<div class="col-md-4"></div>
		</div>
		
		<c:forEach var="current" items="${inventory}" varStatus="loop">
			<c:if test="${current.getQuantity() >= 0 }">
				<c:choose>
					<c:when test="${(loop.index+1) % 3 == 1}">
						<form class="productForm" action="addProduct" method=POST> 
							<div class="col-md-4 product">
								<h2>${current.name}</h2>
								<div><img class="productImage" src="images/${current.url}"></div>
								<div class="productDetails">
									<h3>Price: <small> $${current.price }</small></h3>
									<h3>Remaining Items: <small>${current.quantity}</small></h3>
									<c:choose>
										<c:when test="${current.quantity == 0 }">
											<h3>Out of Stock</h3>
										</c:when>
										<c:otherwise>
											<h3>Quantity: </h3>
											<input class="form-control qInput" type=text name="quantity">
											<input class="form-control" type=hidden name="id" value=${current.id }>
											<button type="submit" class="btn btn-default">Add to Cart</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</form>
					</c:when>
					
					<c:when test="${(loop.index+1) % 3 == 2}">
						<form class="productForm" action="addProduct" method=POST> 
							<div class="col-md-4 product">
								<h2>${current.name}</h2>
								<div><img class="productImage" src="images/${current.url}"></div>
								<div class="productDetails">
									<h3>Price: <small>$${current.price }</small></h3>
									<h3>Remaining Items: <small>${current.quantity}</small></h3>
									<c:choose>
										<c:when test="${current.quantity == 0 }">
											<h3>Out of Stock</h3>
										</c:when>
										<c:otherwise>
											<h3>Quantity: </h3>
											<input class="form-control qInput" type=text name="quantity">
											<input class="form-control" type=hidden name="id" value=${current.id }>
											<button type="submit" class="btn btn-default">Add to Cart</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</form>
					</c:when>
					
					<c:when test="${(loop.index+1) % 3 == 0}">
						<form class="productForm" action="addProduct" method=POST> 
							<div class="col-md-4 product">
								<h2>${current.name}</h2>
								<div><img class="productImage" src="images/${current.url}"></div>
								<div class="productDetails">
									<h3>Price: <small>$${current.price }</small></h3>
									<h3>Remaining Items: <small>${current.quantity}</small></h3>
									<c:choose>
										<c:when test="${current.quantity == 0 }">
											<h3>Out of Stock</h3>
										</c:when>
										<c:otherwise>
											<h3>Quantity: </h3>
											<input class="form-control qInput" type=text name="quantity">
											<input class="form-control" type=hidden name="id" value=${current.id }>
											<button type="submit" class="btn btn-default">Add to Cart</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</form>
					</c:when>
				</c:choose>
			</c:if>
		</c:forEach>
	</div>
	<!-- Footer -->
	<div>
	</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
<script src="Scripts/js/jquery.validate.min.js"></script>
<script src="Scripts/js/validation/products.js"></script>
</body>
</html>