<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>PIS wargame</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Press+Start+2P"
	rel="stylesheet">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./custom.css?version=1">
<link rel="stylesheet" href="./navbar.css?version=1">
</head>

<body class="bg-dark">
	<nav class="navbar navbar-expand-sm fixed-top"
		role="navigation">
		<a class="navbar-brand active ps-font nav-a" href="index.htm">PIS
			WARGAME</a>
		<!-- button sử dụng để thả navbar cho màn hình nhỏ-->
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link nav-a" href="challenge.htm">Challenge</a></li>
				<li class="nav-item"><a class="nav-link nav-a" href="rank.htm">Ranking</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.user !=null}">
						<c:if test="${sessionScope.user.isAdmin}">
							<li class="nav-item">
								<a class="nav-link nav-a" 
								   href="adminPanel/adminPanel.htm">
								   Admin Panel
								</a>
							</li>
						</c:if>
						<li class="nav-item">
							<a class="nav-link nav-a"
								href="userInfo.htm">
								Profile 
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link nav-a" href="logout.htm">
								Logout
							</a>
						</li>						
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link nav-a" href="login.htm">Login</a></li>
						<li class="nav-item"><a class="nav-link nav-a" href="register.htm">Register</a></li>
					</c:otherwise>
				</c:choose>

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
					<label for="name">Name</label> 
					<input type="text"
						class="form-control" name="challengeName" required="required"
						maxlength="50" pattern="[{}._-\w]+">
					<form:errors cssClass="text-danger" path="challengeName"></form:errors>
				</div>
				<div class="form-group">
					<label for="major">Major</label> 
					<input type="text"
						class="form-control" name="major" required="required"
						maxlength="20"  pattern="\w+">
						<form:errors cssClass="text-danger" path="major"></form:errors>
				</div>
				<div class="form-group">
					<label for="flag">Flag</label> <input type="text"
						class="form-control" name="flag" required="required"
						maxlength="100" pattern="[0-9a-zA-Z_.-]+">
						<form:errors cssClass="text-danger" path="flag"></form:errors>
				</div>
				<div class="form-group">
					<label for="fileAttach">File</label><br> 
					<input type="file" name="files" multiple="multiple">
				</div>
				
				<div class="form-group ">
					<label for="score">Score</label>
					<input type="number" class="form-control" name="score"
						required="required" min="0" max="1000">
						<form:errors cssClass="text-danger" path="score"></form:errors>
				</div>
				<!--  vì không phải thao tác với description và hint nên ko cần pattern -->
				<div class="form-group">
					<label for="description">Description</label>
					<!-- <input type="text" class="form-control" name="description" maxlength="200"> -->
					<textarea class="form-control" name="description"
						style="width: 100%" rows="3" maxlength="200"></textarea>
						<form:errors cssClass="text-danger" path="description"></form:errors>
				</div>
				<div class="form-group">
					<label for="hint">Hint</label>
					<!--<input type="text"
						class="form-control" name="hint" maxlength="200">-->
					<textarea class="form-control" name="hint" style="width: 100%"
						rows="3" maxlength="200"></textarea>
					<form:errors cssClass="text-danger" path="hint"></form:errors>	
				</div>
				
					<form:button name="submit" class="btn btn-primary">Submit</form:button>
				
			</form:form>
		</div>
	</div>
</body>
</html>