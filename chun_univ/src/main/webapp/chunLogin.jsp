<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chun Univ. Log-in</title>
<link href="./style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="div-main">
		<div class="div-content">
			<img alt="" src="https://media.istockphoto.com/id/1756562035/photo/university-campus.webp?b=1&s=170667a&w=0&k=20&c=y1T0bSXoIjeaDaazxJfr6WmtBRv_GDHg4Vw1Pn3E4q4=">
		</div>
		<div class="div-content">
			<h1 class="univ">Chun Univ.</h1>
			<hr>
			<form action="doLogin.jsp" id="loginForm">
				<div class="div-login">
					<p></p>
					<input name="id" placeholder="학번/아이디">
					<input name="pwd" type="password" placeholder="비밀번호">
				</div>
			</form>
		</div>
	</div>
</body>
</html>