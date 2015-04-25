<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%
	Cart cart = (Cart)session.getAttribute("cart");
	double total = (Double)request.getAttribute("total");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Scripts/css/bootstrap.min.css"></link>
</head>
<body>
	<!-- Title -->
	<div>
		<h1 class="page-header">Your Cart</h1>
	</div>
	<!-- Body -->
	<div>
	<c:forEach var="current" items="${cart}">
		<div>
			<h4>${current.name}</h4><br>
			<div><img src="images/${current.url}" style="height:200px; width:300px;"></div><br>
			<h4>Price: $${current.price }</h4><br>
			<h4>Quantity: ${current.quantity}</h4><br>
			<h4>Total: ${current.getTotal()}</h4><br>
		</div>
	</c:forEach>
	</div>
	<div>
		<h3>Total Price: <%=total %></h3>
	</div>
	<!-- Footer -->
	<div class="page-header">
		<a href="color:black"><h3>Back to Products</h3></a>
	</div>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="Scripts/jquery-1.11.x.min.js"></script>
<script src="Scripts/js/bootstrap.min.js"></script>
</html>