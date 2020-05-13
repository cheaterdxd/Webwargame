<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
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
		<a class="navbar-brand active ps-font" href="index.htm">PIS
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
				<li class="nav-item"><a class="nav-link" href="challenge.htm">Challenge<span
						class="sr-only">Home</span></a></li>
				<li class="nav-item"><a class="nav-link" href="rank.htm">Ranking</a>
				</li>
				<%
					if (session.getAttribute("user") != null) {
				%>

				<li class="nav-item"><a class="nav-link text-success"
					href="userInfo.htm">User <%=session.getAttribute("username")%></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="logout.htm">Logout</a>
				</li>

				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.htm">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="register.htm">Register</a></li>
				<%
					}
				%>
				<% if((boolean)session.getAttribute("admin")==true){
				%>
				<li class="nav-item"><a class="nav-link" href="adminPanel/adminPanel.htm">Admin Panel</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>
	<div class="text-white offset-md-4 col-md-4"
		style="padding-top: 100px;">

		<div class=" text-center">
			<!-- tạo 1 offset là 1 cột 4  -->
			<!-- chỉnh center text  -->
			<h1 style="padding-bottom: 100px;">USER INFORMATION</h1>
		</div>
		<div class="container">
			<form:form action="userInfo.htm" modelAttribute="user"> <!-- modelAttribute lấy từ session -->
			
				<div class="form-group ">
					<label for="mail"> Mail</label>
					<form:input cssClass="form-control" path="mail" readonly="true"></form:input>
				</div>
				
				<div class="form-group ">
					<label for="username"> Username</label>
					<form:input cssClass="form-control" path="userName" ></form:input>
				</div>
				
				<div class="form-group">
					<label for="password">Current password</label>
					<form:input cssClass="form-control" path="passWord" readonly="true"></form:input>
				</div>
				
				<div class="form-group">
					<label for="password">New password</label>
					<input type="password" class="form-control" name="newPassword" maxlength="20">
				</div>
				<button type="submit" class="btn btn-primary" name="update">Update</button>
				<a class="btn btn-primary" href="index.htm" role="button">Cancel</a>
				<button type="submit" class="btn btn-primary" name="delete">Delete account</button>
			</form:form>
		</div>
	</div>






</body>

</html>