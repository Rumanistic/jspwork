<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	if(id == null) {
%>
<script>
	location.href="05.0.sessionLogin.jsp";
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cookie Login</h2>
	<h3><%=id %>님이 로그인하셨습니다.</h3>
	<a href="05.3.cookieLogout.jsp">로그아웃</a>
</body>
</html>