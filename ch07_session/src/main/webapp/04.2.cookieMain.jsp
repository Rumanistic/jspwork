<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String id = "";
	for(int i = 0; i < cookies.length; i++) {
		if(cookies[i].getName().equals("idKey")) {
			id = cookies[i].getValue();
		}
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
	<a href="04.3.cookieLogout.jsp">로그아웃</a>
</body>
</html>