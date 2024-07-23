<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include Body</title>
</head>
<body>
	<h1>Include Body</h1>
	<%@include file="05.1.page_include_header.jsp" %><br>
	include 지시자의 body 부분 입니다.<br>
	<%@include file="05.2.page_include_footer.jsp" %>
</body>
</html>