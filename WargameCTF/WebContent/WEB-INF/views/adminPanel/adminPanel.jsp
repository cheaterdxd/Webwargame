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
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../custom.css?version=1">
<link rel="stylesheet" href="../navbar.css?version=1">
</head>

<body class="bg-dark text-white">
	<nav class="navbar navbar-expand-sm fixed-top"
		role="navigation">
		<a class="navbar-brand active ps-font nav-a" href="../index.htm">PIS
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
				<li class="nav-item"><a class="nav-link nav-a" href="../challenge.htm">Challenge</a></li>
				<li class="nav-item"><a class="nav-link nav-a" href="../rank.htm">Ranking</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.user !=null}">
						<c:if test="${sessionScope.user.isAdmin}">
							<li class="nav-item">
								<a class="nav-link nav-a" 
								   href="../adminPanel/adminPanel.htm">
								   Admin Panel
								</a>
							</li>
						</c:if>
						<li class="nav-item">
							<a class="nav-link text-success"
								href="../userInfo.htm">
								User ${sessionScope.user.userName} 
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link nav-a" href="../logout.htm">
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
	<div class="container-fluid bg-dark text-white" style="margin-top:100px">
    	<h2>ADMIN MANAGE TOOLS</h2>
    	<a class="btn btn-primary" href="challengeManage.htm">Challenge Management</a>
		<a class="btn btn-primary" href="userManage.htm">User Management</a>
	</div>
</body>
</html>