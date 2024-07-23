<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if_2</title>
<%!
	String cColor = "";
%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String color = request.getParameter("color");
	
	if(color.equals("red"))
		cColor = "빨간색";
	else if(color.equals("orange"))
		cColor = "주황색";
	else if(color.equals("yellow"))
		cColor = "노랑색";
	else if(color.equals("green"))
		cColor = "초록색";
	else
		cColor = "기타";
%>
</head>
<body bgcolor="<%=color.equals("etc") ? "" : color%>">
	<%=name %>님, <%=cColor %>을 좋아하시는군요!
</body>
</html>