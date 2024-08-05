<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = "";

	result = (String)session.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학번 / 아이디 조회</title>
<link rel="stylesheet" href="../resources/css/login.css">
<script type="text/javascript">
	popupClose = () => {
<%
	session.removeAttribute("result");
%>
		close();
	}
</script>
</head>
<body style="margin: 5px;">
	<section>
	<%
		System.out.println(result);
		if(!(result == null || result.equals(""))){
	%>
		<div>
			<pre><%=result.trim() %></pre>
		</div>
	<%
		}
		else {
	%>
		<form action="stdNoFind" method="post">
			<div>
				<input name="name" placeholder="이름">
				<input name="ssn" placeholder="생년월일 (yyMMdd 형식)">
			</div>
			<button type="submit">조회</button>
		</form>
	<%
		}
	%>
	</section>
    <footer>
        <button type="button" onclick="popupClose();">닫기</button>
    </footer>
</body>
</html>