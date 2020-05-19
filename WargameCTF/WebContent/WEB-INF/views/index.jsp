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
				<%
					if (session.getAttribute("admin") != null) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="adminPanel/adminPanel.htm">Admin Panel</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<div class="container-fluid bg-dark text-white mt-2">
		<div class="col-md-7 div-home">
			<!-- col-md-7 là chia grid thành 12 phần, div này chiếm 7 phần -->
			<!--  div-home là custom css -->
			<h3 class="ps-font">ABOUT</h3>
			<p class="ml-4">
				Đây là 1 sân chơi <a
					href="https://whitehat.vn/threads/ctf-cature-the-flag-la-gi.6717/">CTF</a>
				tạo điều kiện cho các bạn sinh viên nâng cao kĩ năng và kiến thức về
				hacking, exploiting.
			</p>
			<h3 class="ps-font">HOW TO</h3>
			<ul>
				<li>Hãy cố gắng tìm lỗi của tồn tài trong thử thách và khai
					thác nó để lấy được flag.</li>
				<li>Chúng tôi hỗ trợ các thử thách cho 4 mảng nhỏ:
					<ul>
						<li>Pwnable</li>
						<li>Web</li>
						<li>RE</li>
						<li>Crypto</li>
					</ul>
				</li>
				<li>Đa phần những challenge chạy trên ubuntu16.04/18.04</li>
			</ul>
			<h3 class="ps-font">RULES</h3>
			<ul>
				<li>Không được DDOS hoặc thực hiện các hành vi cố tình xâm hại
					hệ thống server của chúng tôi.</li>
				<li>Không được chia sẻ FLAGS 1 cách công khai giữa những người
					tham gia.</li>
				<li>Nếu bạn tìm ra được bugs, vui lòng thông báo cho chúng tôi
					qua contact.</li>
			</ul>
			<h3 class="ps-font">CONTACT</h3>
			<ul>
				<li>d17pis@gmail.com</li>
				<li>Discord Channel</li>
				<li>Nếu bạn thích chúng tôi, bạn có thể hỗ trợ chúng tôi 1 phần
					chi phí duy trì server ở <a href="#">đây</a>.
				</li>
			</ul>
		</div>
	</div>
</body>
</html>