<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<title>PIS wargame</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link href="https://fonts.googleapis.com/css?family=Press+Start+2P" rel="stylesheet">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./custom.css">
</head>

<body class="bg-dark">
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top" role="navigation">
		<a class="navbar-brand active ps-font" href="index.htm">PIS WARGAME</a>
		<!-- button sử dụng để thả navbar cho màn hình nhỏ-->
		<button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item"><a class="nav-link" href="challenge.htm">Challenge<span
							class="sr-only">Home</span></a></li>
				<li class="nav-item"><a class="nav-link" href="rank.htm">Ranking</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="login.htm">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="register.htm">Register</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="text-white offset-md-4 col-md-4" style="padding-top: 100px;">

		<div class=" text-center">
			<!-- tạo 1 offset là 1 cột 4  -->
			<!-- chỉnh center text  -->
			<h1>REGISTER</h1>
		</div>
		<div class="container">
			<form:form action="register.htm" modelAttribute="user">
				<div class="form-group">
				<!-- không cho phép nhập những kí tự đặc biệt, sợ bị hack
				Không cho phép nhập quá nhiều,sợ bị hack
				Không cho phép không nhập -->
					<label for="email">Email</label>
					<h6 class="text-warning">${messageMail}</h6>
					<input type="email" class="form-control" name="mail" required="required"
						pattern="(([^<>()\[\]\\.,;:\s@]+(\.[^<>()\[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$">
				</div>
				<div class="form-group ">
					<label for="username"> Username</label>
					<h6 class="text-warning">${messageUsername }</h6>
					<input type="text" class="form-control" name="userName" required="required" placeholder="User bao gồm chữ và số, độ dài nhỏ hơn 15" pattern="\w+" maxlength="15">
				</div>

				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" class="form-control" name="passWord" required="required" maxlength="20">
				</div>
				<div>
					<form:button name="submit" class="btn btn-primary">Submit</form:button>
				</div>
			</form:form>
		</div>
	</div>






</body>

</html>