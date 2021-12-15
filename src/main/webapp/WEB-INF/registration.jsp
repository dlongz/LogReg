<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registration</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
</head>
<body>
	<div class="container-sm">
		<nav>
			<a href="/home" class="btn btn-primary mb-3">Home</a>
		</nav>
		<h1>Welcome! Register Here!</h1>
		
		<p><form:errors path="user.*"/></p>
		
		<form:form actions="/registration" method="POST" modelAttribute="user">
			<div>
				<form:label path="email">Email:</form:label>
				<form:input type="email" path="email"/>
			</div>
			<div>
				<form:label path="password">Password:</form:label>
				<form:password path="password"/>
			</div>
			<div>
				<form:label path="passwordConfirmation">Password Confirmation:</form:label>
				<form:password path="passwordConfirmation"/>
			</div>
			<input type="submit" value="Register!" class="btn btn-success"/>
		</form:form>
	</div>
</body>
</html>