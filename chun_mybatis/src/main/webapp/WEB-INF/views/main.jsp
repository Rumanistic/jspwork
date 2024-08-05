<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chun Univ. MainPage</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style type="text/css">
	<%@ include file="/WEB-INF/views/resources/css/main.css" %>
</style>
<script type="text/javascript">
	<%@ include file="/WEB-INF/views/resources/js/main.js" %>
</script>
</head>
<body>
	<header>
		<p>
			<span></span>
			<span id="timer"></span>
			<span "span_header span_btn">
				<button name="timerReset">새로고침</button>
			</span>
			<span class="span_header span_btn" id="logoutBtn">
				<button onclick="logout();">로그아웃</button>
			</span>
		</p>
	</header>
	<div class="content_holder">
		<aside>
			<nav>
				<ul>
					<li><a href="">학생 정보</a></li>
					<li><a href="#">지도 교수 정보</a></li>
					<li><a href="#">학과 정보</a></li>
					<li><a href="#">성적 조회</a></li>
					<li><a href="#">수강 신청</a></li>
					<li><a href="#">수강 신청 내역 조회</a></li>
					<li><a href="#">개인 정보 조회</a></li>
				</ul>
			</nav>
		</aside>
		<main>
			<%-- <%@ include file="./main/" %> --%>
		</main>
	</div>
		<%@ include file="./common/banner/footer.jsp" %>
</body>
</html>