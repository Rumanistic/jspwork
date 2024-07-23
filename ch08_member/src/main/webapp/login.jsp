<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(id != null) {
		%>
		<h2><b><%=id %>님 환영합니다.</b></h2>
		<div class="content">
			<img alt="" src="https://media.istockphoto.com/id/1756562035/photo/university-campus.webp?b=1&s=170667a&w=0&k=20&c=y1T0bSXoIjeaDaazxJfr6WmtBRv_GDHg4Vw1Pn3E4q4=">
		</div>
		<a href="logout.jsp">로그아웃</a>
<%
	}
	else {
%>
	<form method="post" action="loginProc.jsp">
		<table>
			<tr>
				<th colspan=2><h3>로그인</h3></th>
			</tr>
			<tr>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" required></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="로그인">&emsp;
					<input type="button" value="회원가입" onclick="location.href='memberLogin.jsp'">
				</td>
			</tr>
		</table>
	</form>
<%
	} 
%>
</body>
</html>