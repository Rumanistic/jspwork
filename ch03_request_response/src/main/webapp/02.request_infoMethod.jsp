<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Request Info Method</h1>
	프로토콜 : <%=request.getProtocol() %> <br>
	서버의 이름 : <%=request.getServerName() %> <br>
	서버의 포트번호 : <%=request.getServerPort() %> <br>
	클라이언트의 주소 : <%=request.getRemoteAddr() %> <br>
	클라이언트의 이름 : <%=request.getRemoteHost() %> <br>
	사용한 Method : <%=request.getMethod() %> <br>
	요청 경로(URI) : <%=request.getRequestURI() %> <br>
	요청 경로(URL) : <%=request.getRequestURL() %> <br>
	현재 사용중인 브라우저 : <%=request.getHeader("User-Agent") %> <br>
	파일 type : <%=request.getHeader("Accept") %>
</body>
</html>