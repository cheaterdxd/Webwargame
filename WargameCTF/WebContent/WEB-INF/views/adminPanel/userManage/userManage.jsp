<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<base href="${pageContext.servletContext.contextPath}/">
<title>PIS wargame</title>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Press+Start+2P"
	rel="stylesheet">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./custom.css">
</head>

<body class="m-4 bg-dark">
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top"
		role="navigation">
		<a class="navbar-brand active ps-font" href="./index.htm">PIS
			WARGAME</a>
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link" href="adminPanel/adminPanel.htm">Admin Panel</a></li>
			</ul>
		</div>
	</nav>
	<div class=" text-white" style="margin-top:100px">
	<div style="display: inline;">
		<h2 style="float:left;">User account management</h2>
		<a style="float:right;" href="adminPanel/addUser.htm" role="button" class="btn btn-danger">Add</a>
	</div>
		<h3 class="text-success">${message }</h3>
		<h3 class="text-warning">${error }</h3>
		<table class="table">
			<thead>
				<tr>
					<th>Mail</th>
					<th>Username</th>
					<th>Password</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="u" items="${users}">
					<c:if test="${u.isAdmin ==false}">
						<tr>
							<td scope="row">${u.mail}</td>
							<td>${u.userName}</td>
							<td>${u.passWord}</td>
							<td><a href="adminPanel/update.htm?email=${u.mail}">Update</a> <a
								href="adminPanel/delete.htm?email=${u.mail}">Delete</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>