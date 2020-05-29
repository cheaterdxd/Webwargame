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

<body class="bg-dark text-white">
	<div class="container">
		<nav class="navbar navbar-expand-sm fixed-top" role="navigation">
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
					<li class="nav-item"><a class="nav-link nav-a"
						href="challenge.htm">Challenge</a></li>
					<li class="nav-item"><a class="nav-link nav-a" href="rank.htm">Ranking</a>
					</li>
					<c:choose>
						<c:when test="${sessionScope.user !=null}">
							<c:if test="${sessionScope.user.isAdmin}">
								<li class="nav-item"><a class="nav-link nav-a"
									href="adminPanel/adminPanel.htm"> Admin Panel </a></li>
							</c:if>
							<li class="nav-item"><a class="nav-link nav-a"
								href="userInfo.htm"> Profile </a></li>
							<li class="nav-item"><a class="nav-link nav-a"
								href="logout.htm"> Logout </a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link nav-a"
								href="login.htm">Login</a></li>
							<li class="nav-item"><a class="nav-link nav-a"
								href="register.htm">Register</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</nav>
		<div class="row">
			<div class="col-md-6" style="padding-top: 100px;">
				<h1 style="padding-bottom: 50px;">CHALLENGE SOLVED</h1>
				<table class="table">
					<thead>
						<tr>
							<th>Name</th>
							<th>Score</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${solves}">
							<tr>
								<td>${s.solvedKey.chall.challengeName }</td>
								<td>${s.solvedKey.chall.score }</td>
								<td>${s.dateSolved }</td>
							<tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-6" style="padding-top: 100px;">

				<div class=" text-center">
					<!-- tạo 1 offset là 1 cột 4  -->
					<!-- chỉnh center text  -->
					<h1 style="padding-bottom: 50px;">USER INFORMATION</h1>

				</div>

				<form:form action="userInfo.htm" modelAttribute="user">
					<!-- modelAttribute lấy từ session -->

					<div class="form-group ">
						<label for="mail"> Mail</label>
						<form:input cssClass="form-control" path="mail" readonly="true"></form:input>
					</div>

					<div class="form-group ">
						<label for="username"> Username</label>
						<form:input cssClass="form-control" path="userName"></form:input>
					</div>
<!--
					<div class="form-group">
						<label for="password">Current password</label>
						<form:input cssClass="form-control" path="passWord"
							readonly="true"></form:input>
					</div>
  
					<div class="form-group">
						<label for="password">New password</label> <input type="password"
							class="form-control" name="newPassword" maxlength="20">
					</div>
					-->
					<button type="submit" class="btn btn-primary" name="update">Cập nhật thông tin</button>
					<a class="btn btn-primary" role="button" href="changePassword.htm">Đổi mật khẩu</a>
					<button type="submit" class="btn btn-primary" name="delete">Xoá tài khoản</button>
					
				</form:form>
			</div>
		</div>
	</div>
</body>

</html>