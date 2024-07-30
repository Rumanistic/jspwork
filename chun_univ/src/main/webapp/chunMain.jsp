<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.*" %>
<%
	ChunBean cb = null;

	cb = (ChunBean)session.getAttribute("stdInfo");
	session.setMaxInactiveInterval(60);
	int sessionExpireTimer = session.getMaxInactiveInterval();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="./resources/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	logout = () => {
<%
		session.invalidate();
%>
		location.href = "chunLogin.jsp";
	}
	
	let i = <%=sessionExpireTimer %>;
	
	updateTimer = () => {
		let min = Math.floor(i/60);
		let sec = i%60;
		
		sec = sec < 10 ? '0' + sec : sec;
		let curTime = min + ":" + sec;
		$("#timer").text(curTime);
		i--;
		
		if(i < 0){
			clearInterval(expireCounter);
			alert("세션 만료로 로그아웃 되었습니다.");
			logout();
		}
	}
	
	$(() => {
		$("button[name='timerReset']").click(() => {
			i = <%=sessionExpireTimer %>;
		})
		
		adjustBodyHeight();
	})
	
	adjustBodyHeight = () => {
        let footerHeight = $("footer").outerHeight();
        $("body").css("height", `calc(100% - ${footerHeight}px)`);
    };

    $(window).on('resize', () => {
        adjustBodyHeight();
    });
	
	let expireCounter = setInterval(updateTimer, 1000);
</script>
</head>
<body>
	<header>
		<p>
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
					<li><a href="#show=stdInfo">학생 정보</a></li>
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
		<%@ include file="./banner/footer.jsp" %>
</body>
</html>