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
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>
	<h1>Action 의 include tag</h1>
	<p><%=name %></p>
	<jsp:include page="06.2.action_include_tag3.jsp" /><p/>
	action 의 include body 입니다.
</body>
</html>