<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isVerified = false;
	boolean result = false;
	String stdNo = "";

	if(session.getAttribute("isVerified") != null && !session.getAttribute("isVerified").equals("null"))
		isVerified = (boolean)session.getAttribute("isVerified");
	if(session.getAttribute("result") != null && !session.getAttribute("result").equals("null"))
		result = (boolean)session.getAttribute("result");
	
	if(isVerified)
		stdNo = (String)session.getAttribute("stdNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../resources/css/login.css">
<script type="text/javascript">
	popupClose = () => {
<%
	session.removeAttribute("isVerified");
	session.removeAttribute("result");
%>
		close();
	}
</script>
</head>
<body style="margin: 5px;">
	<header>
		
	</header>
	<section>
	<%
		System.out.println(isVerified);
		System.out.println(result);
		if(!result) {
			if(!isVerified) {
	%>
		<form action="stdInfoVerify" method="post">
			<div>
				<input name="no" placeholder="학번">
				<input name="name" placeholder="이름">
				<input name="ssn" placeholder="생년월일 (yyMMdd 형식)">
			</div>
			<button type="submit">조회</button>
		</form>
	<%
			}
			if(isVerified){
			%>
				<form action="stdPwdUpdate" method="post">
					<div>
						<input type="password" name="newPwd" placeholder="새로운 비밀번호">
						<input type="password" name="newPwdChk" placeholder="비밀번호 확인">
						<input type="hidden" name="stdNo" value="<%=stdNo %>">
					</div>
					<button type="submit">조회</button>
				</form>
			<%
			}
		}
		if(result){
	%>
		<div>
			<pre>정상적으로 변경되었습니다.</pre>
		</div>
	<%
		}
	%>
	</section>
    <footer>
        <button type="button" onclick="popupClose();">닫기</button>
    </footer>
</body>
</html>