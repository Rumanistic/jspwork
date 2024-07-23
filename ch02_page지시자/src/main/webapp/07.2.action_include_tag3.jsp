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
	String siteName = request.getParameter("siteName");
	String siteTel = request.getParameter("siteTel");
%>
	<h1>Action include tag top</h1>
	
	top: <%=siteName %><br>
	top: <%=siteTel %><br>
</body>
</html>