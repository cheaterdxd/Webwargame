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
<body class="bg-dark">
<nav class="navbar navbar-expand-sm navbar-dark"
		role="navigation">
		<a class="navbar-brand active ps-font" href="./index.htm">PIS
			WARGAME</a>
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link" href="adminPanel/adminPanel.htm">Admin Panel</a></li>
			</ul>
		</div>
	</nav>
	<div class=" text-white" style="margin: 25px 20px;">
		<div>
			<h2 style="display: inline;float:center;" >Challenges manage page</h2>
			<a style="display: inline;float:right;" role="button" class="btn btn-danger" href="adminPanel/addChallenge.htm">Add new challenge</a>
		</div>
		<h3 class="text-success">${message }</h3>
		<h3 class="text-warning">${error }</h3>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Score</th>
					<!--  
					<th>File attach</th>
					<th>Description</th>
					<th>Hint</th>
					-->
					<th>Major</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="chall" items="${challenges}">
					<tr>
						<td scope="row">${chall.id}</td>
						<td>${chall.challengeName}</td>
						<td>${chall.score}</td>
						<!-- 
						<td>${chall.fileAttach}</td>
						<td>${chall.description}</td>
						<td>${chall.hint}</td>
						 -->
						<td>${chall.major}</td>
						<td><a href="adminPanel/editChallenge.htm?id=${chall.id }">Edit</a>
							| <a href="adminPanel/deleteChallenge.htm?id=${chall.id }">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>