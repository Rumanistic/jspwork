<%@page import="java.util.Enumeration"%>
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
	Enumeration eName = session.getAttributeNames();
	while(eName.hasMoreElements()) {
		String name = (String)eName.nextElement();
		String value = (String)session.getAttribute(name);
		out.print("session name: " + name + "<p/>");
		out.print("session value: " + value + "<p/>");
	}
%>
</body>
</html>