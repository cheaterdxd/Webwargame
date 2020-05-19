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
			<h1 style="padding-bottom: 100px;">ACCOUNT VALIDATION</h1>
		</div>
		<div class="container">
			<h6 class="text-warning">
			<br>Bước 1: Bấm vào nút Get code để lấy mã xác thực.
				<br>Bước 2: Đăng nhập mail đã đăng kí để nhận mã 6 chữ số.
				<br>Bước 3: Lấy mã đã nhận nhập vào ô bên dưới và bấm nút Send code.
				<br>${message }
			</h6>
			<form:form action="accountValidation.htm">
			<!-- kiểm tra code nhập vào, chỉ cho nhập đúng 6 chữ số, dư ra sợ bị hack -->
				<div class="form-group ">
					<label for="codeValidation"> Code ${code }</label> 
					<input type="text" class="form-control" name="code" maxlength="6" pattern="[(0-9)]+">
				</div>
				<button type="submit" class="btn btn-primary" name="validation">Send code</button>
				<button type="submit" class="btn btn-primary" name="getcode">Get code</button>
			</form:form>
		</div>
	</div>






</body>

</html>