<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello</title>
</head>
<body>
	jsp 처음 시작 
	<br>
	<% String name = "홍길동"; %>
	이름 : <%= %>
	
	<!-- 주석 1 -->
	<%-- 주석 2 --%>
	<%-- 선언문 :
				메서드 생성 및 멤버 변수 생성 시 사용
				<%! 프로그램 %>
	 --%>
	<%
		// 한줄 주석
		/* 주석 3 */ 
	%>
</body>
</html>