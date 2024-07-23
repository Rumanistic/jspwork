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
	String type = request.getParameter("type");
	
	switch(type){
	case "a":
%>
		<jsp:forward page="ex03.typeA.jsp" />
<%
		break;
	case "b":
%>
		<jsp:forward page="ex03.typeB.jsp" />
<%
		break;
	case "o":
%>
		<jsp:forward page="ex03.typeO.jsp" />
<%
		break;
	case "ab":
%>
		<jsp:forward page="ex03.typeAB.jsp" />
<%
		break;
	}
%>
</body>
</html>