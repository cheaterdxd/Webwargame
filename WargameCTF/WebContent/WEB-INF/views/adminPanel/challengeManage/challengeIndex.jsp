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
<body>
	<div class=" text-white" style="margin-top: 100px">
		<h2>Challenge management</h2>
		<h3 class="text-success">${message }</h3>
		<h3 class="text-warning">${error }</h3>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Score</th>
					<th>File attach</th>
					<th>Description</th>
					<th>Hint</th>
					<th>Major</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="chall" items="${challenges}">
					<tr>
						<td scope="row">${chall.id}</td>
						<td>${chall.challengeName}</td>
						<td>${chall.score}</td>
						<td>${chall.fileAttach}</td>
						<td>${chall.description}</td>
						<td>${chall.hint}</td>
						<td>${chall.major}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>