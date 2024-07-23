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
	Cookie[] cookie = request.getCookies();
	if(cookie != null) {
		for(int i = 0; i < cookie.length; i++){
			if(cookie[i].getName().equals("myCookie"))
				out.print("Cookie name = :" + cookie[i].getName() + "<br> Cookie value = " + cookie[i].getValue() + "<p/>");
		}
	}
%>
</body>
</html>