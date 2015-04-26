<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%
	//@author Conner McKeeth
	double total = (Double)request.getAttribute("total");
	String errorMessage = (String)request.getAttribute("errorMessage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Cart</title>
<link rel="stylesheet" href="Scripts/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="style.css"></link>
</head>
<body>
	<!-- Title -->
	<div style="text-align:center;">
		<h1 class="page-header">My Cart</h1>
		<div class="page-header">
			<a href="products.jsp"><h3>Back to Products</h3></a>
		</div>
	</div>
	<!-- Body -->
	<div class="container" style="text-align:center; margin:0 auto;">
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
		<c:choose>
			<c:when test="${cart.size() != 0 }">
				<c:forEach var="current" items="${cart}" varStatus="loop">
					<c:choose >
						<c:when test="${cart.size() % 3 == 0 }">
							<form action="deleteProduct" method=POST> 
								<div class="col-md-4 product">
									<h2>${current.name}</h2>
									<div><img class="productImage" src="images/${current.url}"></div>
									<div class="productDetails">
										<h3>Price: <small>$${current.price }</small></h3>
										<h3>Quantity: <small>${current.quantity }</small></h3>
										<h3>Item Total: <small>$${current.getTotal() }</small></h3>
										<input class="form-control" type=hidden name="id" value=${current.id }>
										<input class="form-control" type=hidden name="quantity" value=${current.quantity }>
										<button type="submit" class="btn btn-default">Remove from Cart</button>
									</div>
								</div>
							</form>
						</c:when>
						<c:when test="${cart.size() % 3 == 2 }">
							<c:choose>
								<c:when test="${loop.index+1 >= fn:length(cart) - 1 }">
									<form action="deleteProduct" method=POST> 
										<div class="col-md-6 product">
											<h2>${current.name}</h2>
											<div><img class="productImage" src="images/${current.url}"></div>
											<div class="productDetails">
												<h3>Price: <small>$${current.price }</small></h3>
												<h3>Quantity: <small>${current.quantity }</small></h3>
												<h3>Item Total: <small>$${current.getTotal() }</small></h3>
												<input class="form-control" type=hidden name="id" value=${current.id }>
												<input class="form-control" type=hidden name="quantity" value=${current.quantity }>
												<button type="submit" class="btn btn-default">Remove from Cart</button>
											</div>
										</div>
									</form>
								</c:when>
								<c:otherwise>
									<form action="deleteProduct" method=POST> 
										<div class="col-md-4 product">
											<h2>${current.name}</h2>
											<div><img class="productImage" src="images/${current.url}"></div>
											<div class="productDetails">
												<h3>Price: <small>$${current.price }</small></h3>
												<h3>Quantity: <small>${current.quantity }</small></h3>
												<h3>Item Total: <small>$${current.getTotal() }</small></h3>
												<input class="form-control" type=hidden name="id" value=${current.id }>
												<input class="form-control" type=hidden name="quantity" value=${current.quantity }>
												<button type="submit" class="btn btn-default">Remove from Cart</button>
											</div>
										</div>
									</form>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${cart.size() % 3 == 1 }">
							<c:choose>
								<c:when test="${loop.index+1 == fn:length(cart) }">
									<form action="deleteProduct" method=POST> 
										<div class="col-md-12 product">
											<h2>${current.name}</h2>
											<div><img class="productImage" src="images/${current.url}"></div>
											<div class="productDetails">
												<h3>Price: <small>$${current.price }</small></h3>
												<h3>Quantity: <small>${current.quantity }</small></h3>
												<h3>Item Total: <small>$${current.getTotal() }</small></h3>
												<input class="form-control" type=hidden name="id" value=${current.id }>
												<input class="form-control" type=hidden name="quantity" value=${current.quantity }>
												<button type="submit" class="btn btn-default">Remove from Cart</button>
											</div>
										</div>
									</form>
								</c:when>
								<c:otherwise>
									<form action="deleteProduct" method=POST> 
										<div class="col-md-4 product">
											<h2>${current.name}</h2>
											<div><img class="productImage" src="images/${current.url}"></div>
											<div class="productDetails">
												<h3>Price: <small>$${current.price }</small></h3>
												<h3>Quantity: <small>${current.quantity }</small></h3>
												<h3>Item Total: <small>$${current.getTotal() }</small></h3>
												<input class="form-control" type=hidden name="id" value=${current.id }>
												<input class="form-control" type=hidden name="quantity" value=${current.quantity }>
												<button type="submit" class="btn btn-default">Remove from Cart</button>
											</div>
										</div>
									</form>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<h2>You currently have no products!</h2>
				</div>
				<div class="col-md-4"></div>
			</c:otherwise>
		</c:choose>
		
		
	</div>
	<c:choose>
		<c:when test="${cart.size() != 0 }">
			<div class="container" style="text-align:center; margin:0 auto;">
				<h1>Total Price: $<%=total %></h1><a href="#" class="btn btn-primary" role="button">Purchase</a>
			</div>
		</c:when>
	</c:choose>
	<!-- Footer -->
	<div class="page-header">
		<a href="products.jsp"><h3>Back to Products</h3></a>
	</div>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
</html>