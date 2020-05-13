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
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top"
		role="navigation">
		<a class="navbar-brand active ps-font" href="./index.htm">PIS
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
				<li class="nav-item"><a class="nav-link" href="challengeManage.htm">Challenge Management<span
						class="sr-only">Home</span></a></li>
				<li class="nav-item"><a class="nav-link" href="adminPanel/userManage.htm">User Management</a></li>
				<li class="nav-item"><a class="nav-link" href="rank.htm">Ranking</a></li>
				<li class="nav-item"><a class="nav-link text-success"
					href="userInfo.htm">Admin Info</a></li>
				<li class="nav-item"><a class="nav-link" href="logout.htm">Logout</a></li>		
				
			</ul>
		</div>
	</nav>
	<div class="container-fluid bg-dark text-white" style="margin-top:100px">
    	<h2>ADMIN MANAGE TOOLS</h2>
	</div>
</body>
</html>