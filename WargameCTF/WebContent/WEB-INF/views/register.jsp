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
					href="challenge.htm">Challenge<span class="sr-only">Home</span></a></li>
				<li class="nav-item"><a class="nav-link nav-a" href="rank.htm">Ranking</a>
				</li>
				<li class="nav-item"><a class="nav-link nav-a" href="login.htm">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link nav-a"
					href="register.htm">Register</a></li>
			</ul>
		</div>
	</nav>
	<div>
		<form:form action="register.htm" modelAttribute="user" cssClass="box">
			<h1>REGISTER</h1>
			<!-- không cho phép nhập những kí tự đặc biệt, sợ bị hack
				Không cho phép nhập quá nhiều,sợ bị hack
				Không cho phép không nhập -->
			<h6 class="text-warning">${messageMail}</h6>
			<input type="email" name="mail" required="required"
				placeholder="Email"
				pattern="(([^<>()\[\]\\.,;:\s@]+(\.[^<>()\[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$">
			<h6 class="text-warning">${messageUsername }</h6>
			<input type="text" name="userName" required="required"
				placeholder="Username" pattern="\w+" maxlength="15">
			<input type="password" name="passWord" required="required"
				placeholder="Password" maxlength="20">
			<input type="submit" name="submit" value="Register">
		</form:form>
	</div>
</body>

</html>