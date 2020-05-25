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
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top"
		role="navigation">
		<a class="navbar-brand active ps-font" href="index.htm">PIS WARGAME</a>
		<!-- button sử dụng để thả navbar cho màn hình nhỏ-->
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
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
	<div class="text-white offset-md-4 col-md-4"
		style="padding-top: 100px;">

		<div class=" text-center">
			<!-- tạo 1 offset là 1 cột 4  -->
			<!-- chỉnh center text  -->
			<h1 style="padding-bottom: 100px;">ACCOUNT PASSWORD FORGET</h1>
		</div>
		<div class="container">
			<h6 class="text-primary">
				<br>Nhập vào mail của account mà bạn muốn lấy lại mật khẩu,
				chúng tôi sẽ gửi mật khẩu đến địa chỉ mail được đăng kí ban đầu.
			</h6>
			<form:form action="forgetPassword.htm">
				<div class="form-group ">
					<label for="username"> Mail</label>
					<!-- không cho phép nhập những kí tự đặc biệt, sợ bị hack
				Không cho phép nhập quá nhiều,sợ bị hack
				Không cho phép không nhập -->
					<input type="email" class="form-control" name="mail"
						required="required"
						pattern="(([^<>()\[\]\\.,;:\s@]+(\.[^<>()\[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$">
				</div>
				<h6 class="text-danger">${message }</h6>
				<button type="submit" class="btn btn-primary" name="forgetPassword">Submit</button>
			</form:form>
		</div>
	</div>






</body>

</html>