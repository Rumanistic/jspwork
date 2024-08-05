<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chun Univ. Login</title>
</head>
<body>
	<div class="div_main">
		<div>
			<span class="div_background left">
				<img alt="" src="https://media.istockphoto.com/id/1756562035/photo/university-campus.webp?b=1&s=170667a&w=0&k=20&c=y1T0bSXoIjeaDaazxJfr6WmtBRv_GDHg4Vw1Pn3E4q4=">
			</span>
		</div>
		<div class="div_content">
			<h1 class="univ">Chun Univ.</h1>
			<hr class="main">
			<form action="login.do" method="post">
				<div class="div_login">
					<p></p>
					<input name="id" placeholder="학번/아이디">
					<input name="pwd" type="password" placeholder="비밀번호">
				</div>
				<div class="div_id_pass">
					<ul>
						<li>➪<a href="javascript:void(0);" onclick="newWindow('./login/findid.jsp', '학번/아이디 찾기');">학번/아이디 찾기</a></li>
						<li>➪<a href="javascript:void(0);" onclick="newWindow('./login/findpwd.jsp', '비밀번호 찾기');">비밀번호 찾기</a></li>
					</ul>
				</div>
				<br>
				<button class="btn_login" type="submit" name="btn_login">Login</button>
				<br><br>
				<hr class="divide">
			</form>
		</div>
		<div>
			<span class="div_background right">
				
			</span>
		</div>
	</div>
	<%@ include file="./common/banner/footer.jsp" %>
</body>
</html>