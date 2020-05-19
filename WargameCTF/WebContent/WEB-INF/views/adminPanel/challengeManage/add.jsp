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
<body class="bg-dark text-white ">
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top"
		role="navigation">
		<a class="navbar-brand active ps-font" href="./index.htm">PIS
			WARGAME</a>
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link text-primary"
					href="adminPanel/challengeManage.htm">Back</a></li>
			</ul>
		</div>
	</nav>
	<div class="text-white offset-md-4 col-md-4"
		style="padding-top: 100px;">

		<div class=" text-center">
			<!-- tạo 1 offset là 1 cột 4  -->
			<!-- chỉnh center text  -->
			<h1>NEW CHALLENGE</h1>
		</div>

		<div class="container">
			<br>
			<h6 class="text-primary">${message }</h6>
			<form:form action="adminPanel/addChallenge.htm"
				modelAttribute="chall" enctype="multipart/form-data">
				<div class="form-group">
					<label for="name">Name</label> <input type="text"
						class="form-control" name="challengeName" required="required"
						maxlength="50">
				</div>
				<div class="form-group">
					<label for="fileAttach">File</label><br> <input type="file"
						name="files" multiple="multiple">
				</div>
				<div class="form-group">
					<label for="major">Major</label> <input type="text"
						class="form-control" name="major" required="required"
						maxlength="20">
				</div>
				<div class="form-group ">
					<label for="score">Score</label>
					<h6 class="text-warning">${messageUsername }</h6>
					<input type="number" class="form-control" name="score"
						required="required" min="0" max="1000">
				</div>
				<div class="form-group">
					<label for="description">Description</label>
					<!-- <input type="text" class="form-control" name="description" maxlength="200"> -->
					<textarea class="form-control" name="description"
						style="width: 100%" rows="3" maxlength="200"></textarea>
				</div>
				<div class="form-group">
					<label for="hint">Hint</label>
					<!--<input type="text"
						class="form-control" name="hint" maxlength="200">-->
					<textarea class="form-control" name="hint" style="width: 100%"
						rows="3" maxlength="200"></textarea>
				</div>
				<div>
					<form:button name="submit" class="btn btn-primary">Submit</form:button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>