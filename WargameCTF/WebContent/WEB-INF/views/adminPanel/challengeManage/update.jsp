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
			<h1>EDIT CHALLENGE</h1>
		</div>

		<div class="container">
			<br>
			<h6 class="text-primary">${message }</h6>
			<form:form action="adminPanel/editChallenge.htm"
				modelAttribute="chall" enctype="multipart/form-data">
				<div class="form-group" hidden="true">
					<label for="name">ID</label>
					<form:input path="id" cssClass="form-control"
						maxlength="50" />
				</div>
				<div class="form-group">
					<label for="name">Name</label>
					<form:input path="challengeName" cssClass="form-control"
						maxlength="50" pattern="[._-\w]+" />
				</div>
				<!--  
				<div class="form-group">
					<label for="fileAttach">File</label><br>
					<form:input path="fileAttach" cssClass="form-control"/>
				</div>-->
				<div class="form-group">
					<label for="fileAttach">Current file</label>
					<select class="form-control" name="fileAttach">
						<c:forEach var="c" items="${filelist}" >
							<option value="${c }">${c }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="fileAttach">New File</label><br> <input type="file"
						name="files" multiple="multiple">
				</div>
				<div class="form-group">
					<label for="major">Major</label>
					<form:input cssClass="form-control" path="major" maxlength="20" pattern="\w+" />
				</div>
				<div class="form-group">
					<label for="flag">Flag</label>
					<form:input cssClass="form-control" path="flag" maxlength="100" pattern="[0-9a-zA-Z_.-]+"/>
				</div>
				<div class="form-group ">
					<label for="score">Score</label>
					<h6 class="text-warning">${messageUsername }</h6>
					<form:input cssClass="form-control" path="score" min="0" max="1000" type="number" />
				</div>
				<div class="form-group">
					<label for="description">Description</label>
					<!-- <input type="text" class="form-control" name="description" maxlength="200"> -->
					<form:textarea path="description" cssClass="form-control"
						cssStyle="width: 100%" rows="3" maxlength="200"></form:textarea>
				</div>
				<div class="form-group">
					<label>Hint</label>
					<!--<input type="text"
						class="form-control" name="hint" maxlength="200">-->
						<!--  custom hint là id để tránh id hint mặc định của css :(  -->
					<form:textarea id = "customHint" cssClass="form-control" path="hint" cssStyle="width: 100%"
						rows="3" maxlength="200"></form:textarea>
				</div>
				<div>
					<form:button name="update" class="btn btn-primary">Update</form:button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>