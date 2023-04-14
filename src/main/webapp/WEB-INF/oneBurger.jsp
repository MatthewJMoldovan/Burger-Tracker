<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Burger Tracker</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light sticky-top justify-content-between m-2 mb-2 px-4 rounded border">
		<h1 class="navbar-brand mb-0 fs-1">View Burger</h1>
		<div>
			<a class="btn btn-success" href="/">Home</a>
		</div>
	</nav>
	<div class="w-75 p-4 mx-auto">
		<div class="shadow mb-4 rounded border p-4 text-start">
			<div>
				<h3>
					Burger Name:
					<c:out value="${oneBurger.burgerName }"></c:out>
				</h3>
			</div>
			<div>
				<h3>
					Restaurant Name:
					<c:out value="${oneBurger.restaurantName }"></c:out>
				</h3>
			</div>
			<div>
				<h3>
					Rating:
					<c:out value="${oneBurger.rating }"></c:out>
				</h3>
			</div>
			<div>
				<h3>
					Notes:
					<c:out value="${oneBurger.notes }"></c:out>
				</h3>
			</div>
		</div>
	</div>
</body>
</html>