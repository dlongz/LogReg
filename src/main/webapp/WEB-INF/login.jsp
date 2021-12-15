<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login Page</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<div class="container-sm">
		<nav>
			<a href="/home" class="btn btn-primary mb-3">Home</a>
		</nav>
		<h1>Welcome! Login Here!</h1>
		
		<p>${error}</p>
		
		<form action="/login" method="post">
			<div>
				<label for="email">Email</label>
				<input type="email" id="email" name="email"/>
			</div>
			<div>
				<label for="password">Password</label>
				<input type="password" id="password" name="password"/>
			</div>
			<input type="submit" value="Login!" class="btn btn-success"/>
		</form>
	</div>
</body>
</html>