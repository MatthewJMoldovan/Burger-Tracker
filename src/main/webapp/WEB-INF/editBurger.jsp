<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Burger Tracker</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light sticky-top justify-content-between m-2 mb-2 px-4 rounded border">
		<h1 class="navbar-brand mb-0 fs-1">Edit Burger</h1>
		<div>
			<a class="btn btn-success" href="/">Home</a>
		</div>
	</nav>
	<div class="w-75 p-4 mx-auto">
		<div class="shadow mb-4 rounded border p-4 text-start">
			<form:form action="/process/edit/${oneBurger.id }" method="PUT"
				modelAttribute="oneBurger">
				<div class="formGroup">
					<div>
						<form:label path="burgerName"> Burger Name </form:label>
						<form:input class="form-control" type="text" path="burgerName" />
						<form:errors path="burgerName" />
					</div>
					<div>
						<form:label path="restaurantName"> Restaurant Name </form:label>
						<form:input class="form-control" type="text" path="restaurantName" />
						<form:errors path="restaurantName" />
					</div>
					<div>
						<form:label path="rating">Rating</form:label>
						<form:input class="form-control" type="number" min="1" max="5"
							path="rating" />
						<form:errors path="rating" />
					</div>
					<div>
						<form:label path="notes"> Notes </form:label>
						<form:textarea class="form-control" path="notes" />
						<form:errors path="notes" />
					</div>
					<button class="mt-2 btn btn-primary" type="submit">Submit</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>