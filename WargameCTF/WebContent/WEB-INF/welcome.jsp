<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Spring MVC</title>
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
hello main page <a href="../index.html"> main page</a>
<nav class="navbar navbar-expand-sm navbar-dark fixed-top" role="navigation">
      <a class="navbar-brand active ps-font" href="#">PIS WARGAME</a>
        <!-- button sử dụng để thả navbar cho màn hình nhỏ-->
          <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="challenge.html">Challenge<span class="sr-only">Home</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="rank.html">Ranking</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="login.html">Login</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="register.html">Register</a>
              </li> 
            </ul>
          </div>
    </nav>
</body>
</html>