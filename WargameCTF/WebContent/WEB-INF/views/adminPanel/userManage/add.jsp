<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
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
<body>
<form:form action="adminPanel/addUser.htm" modelAttribute="user">
	<form:input path=""/>
</form:form>
</body>
</html>