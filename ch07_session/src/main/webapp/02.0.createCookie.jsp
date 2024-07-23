<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 쿠키의 값에 띄어쓰기, 특수문자 안됨
	response.addCookie(new Cookie("NAME", "John"));
	response.addCookie(new Cookie("GENDER", "Male"));
	response.addCookie(new Cookie("AGE", "34"));
%>
	<h1>쿠키를 사용하여 연결 유지</h1>
		쿠키를 만듭니다<p/>
		쿠키 내용은 <a href="02.1.tasteCookie.jsp">클릭하세요</a>
	
</body>
</html>