<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Burger Tracker</title>
</head>
<body>
<div class="w-75 p-4 mx-auto">
		<h1 class ="text-center">Burger Tracker</h1>
			<div class="shadow mb-4 rounded border p-4 text-start">
				<Table class="table">
					<thead>
						<tr>
							<th class="text-center"> Burger Name </th>
							<th class="text-center"> Restaurant Name </th>
							<th class="text-center"> Rating (out of 5) </th>	
						</tr>	
					</thead>
					<tbody>
						<c:forEach var="eachBurger" items="${burgerList }">
							<tr>
								<td class="text-center"> <c:out value="${eachBurger.burgerName }"></c:out></td>
								<td class="text-center"> <c:out value="${eachBurger.restaurantName }"></c:out></td>
								<td class="text-center"> <c:out value="${eachBurger.rating }"></c:out></td>						
							</tr>
						</c:forEach>
					</tbody>
				</Table>
			</div>
			<div class="shadow mb-4 rounded border p-4 text-start">
			<form:form action="/process" method="POST" modelAttribute="newBurger">
			<div class="formGroup">
				<div >
					<form:label path="burgerName"> Burger Name </form:label>
					<form:input class="form-control" type="text" path="burgerName"/>
					<form:errors path="burgerName"/>
				</div>
				<div>
					<form:label path="restaurantName"> Restaurant Name </form:label>
					<form:input class="form-control" type="text" path="restaurantName"/>
					<form:errors path="restaurantName"/>
				</div>
				<div>
					<form:label path="rating">Rating</form:label>
					<form:input class="form-control" type="number" min="1" max="5" path="rating"/>
					<form:errors path="rating"/>
				</div>
				<div>
					<form:label path="notes"> Notes </form:label>
					<form:textarea class="form-control" path="notes"/>
					<form:errors path="notes"/>
				</div>
				<button class="mt-2 btn btn-primary" type="submit">Submit</button>
			</div>
		</form:form>
	</div>
</div>
	
</body>
</html>