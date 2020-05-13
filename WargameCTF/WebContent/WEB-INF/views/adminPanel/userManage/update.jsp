<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
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
<body class="bg-dark text-white m-4">
	<div class="container ">
		<h1 class="text-center">Account edit panel</h1>
		<form:form action="adminPanel/update.htm" modelAttribute="user">
			<div class="form-group">
				<label>Username</label>
				<h5>${usernameError }</h5>
				<form:input path="userName" cssStyle="width:100%" maxlength="15"/>
			</div>
			<div class="form-group">
				<label>Password</label>
				<form:input path="passWord" cssStyle="width:100%" maxlength="20"/>
			</div>
			<div class="form-group">
				<label>Mail</label>
				<h5>${passwordError }</h5>
				<form:input path="mail" cssStyle="width:100%" />
			</div>

			<a class="btn btn-secondary mt-4 " href="adminPanel/userManage.htm"
				role="button">Back to User Manage Page</a>
			<button class="btn btn-secondary float-right mt-4 " name="saveUpdate">Save
				update</button>

			<a class="btn btn-secondary mt-4 " href="adminPanel/userManage.htm"
				role="button">Cancel</a>
		</form:form>
	</div>

</body>
</html>