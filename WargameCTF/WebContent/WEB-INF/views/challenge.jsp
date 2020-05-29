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

<body class="bg-dark text-white">
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
					href="challenge.htm">Challenge</a></li>
				<li class="nav-item"><a class="nav-link nav-a" href="rank.htm">Ranking</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.user !=null}">
						<c:if test="${sessionScope.user.isAdmin}">
							<li class="nav-item"><a class="nav-link nav-a"
								href="adminPanel/adminPanel.htm"> Admin Panel </a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link nav-a"
							href="userInfo.htm"> Profile </a></li>
						<li class="nav-item"><a class="nav-link nav-a"
							href="logout.htm"> Logout </a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link nav-a"
							href="login.htm">Login</a></li>
						<li class="nav-item"><a class="nav-link nav-a"
							href="register.htm">Register</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</nav>
	<div class="container offset-md-2 col-md-8 text-center"
		style="margin-top: 100px">
		<div style="padding-bottom: 50px">
			<h1>CHALLENGES</h1>
		</div>
		<c:if test="${flagError==true }">
			<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>Sai flag!</strong> Vui lòng kiểm tra lại độ dài và định dạng flag.
			</div>
		</c:if>
		<c:if test="${wrongFlag==true }">
			<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>Sai flag!</strong> Vui lòng kiểm tra lại flag.
			</div>
		</c:if>
		<c:if test="${rightFlag ==true}">
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>Đúng rồi!</strong> Chúc mừng bạn đã giải được bài mới.
			</div>
		</c:if>
		<c:forEach var="c" items="${challs}" varStatus="counts">
			<div class="my-4">
				<!-- khối điều khiển collapse -->
				<div class="challenge-block py-2" data-toggle="collapse"
					data-target="#${ counts.count}">
					${c.challengeName} - Score: ${c.score } <span
						class="badge badge-info float-right mr-2">${c.major} </span>
					<c:if test="${c.isSovledBy(sessionScope.user.mail)}">
						<span class="badge badge-success float-right mr-2">Solved </span>
					</c:if>
				</div>
				<!-- khối collapse -->
				<div id="${counts.count}" class="collapse">
					<div class="card bg-white text-dark border border-light py-2"
						style="border-radius: 25px;">
						<div class="py-2">${c.description }</div>
						<c:forEach var="f" items="${c.changeStringFileToList()}">
							<a href="files/${f }" download>${f }</a>
						</c:forEach>
						<!-- hint -->
						<div>
							<!-- khối điều khiển collapse của hint -->
							<button class="btn btn-info my-3" data-toggle="collapse"
								data-target="#id${counts.count}" style="width: 62%">
								Hint</button>
							<!-- khối collapse của hint -->
							<div id="id${ counts.count}" class="collapse">${c.hint }</div>
						</div>
						<!-- form submit flag -->
						<c:if test="${c.isSovledBy(sessionScope.user.mail)!=true}">
							<div>
								<form>
									<div>
										<input type="text" name="id" value="${c.id }" hidden /> <input
											type="text" name="flag" style="width: 50%" />
										<button name="submitFlag" class="btn btn-success">Submit
											flag</button>
									</div>
								</form>
							</div>
						</c:if>
					</div>

				</div>
			</div>
		</c:forEach>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>