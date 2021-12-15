<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Welcome</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<div class="container-sm">
		<h1>Welcome, ${user.email}</h1>
		
<!-- 		<a href="/login" class="btn btn-secondary mb-3">Login</a> -->
<!-- 		<a href="/registration" class="btn btn-success mb-3">Registration</a> -->
		<a href="/logout" class="btn btn-danger mb-3">Logout</a>
	</div>
</body>
</html>