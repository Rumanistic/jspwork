<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sendRedirect Ex</h1>
	<%
		if(request.getProtocol().equals("HTTP/1.1")){
			response.setHeader("Cache-control", "no-store");	// HTTP/1.1			
		}
		else {
			response.setHeader("Pragma", "no-cache");			// HTTP/1.0
		}
	%>
</body>
</html>