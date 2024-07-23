<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Application</h1>
	서블릿 컨테이너의 이름과 버전 : <%=application.getServerInfo() %> <br>
	01.0.request.html파일의 MIME type : <%=application.getMimeType("01.0.request.html") %> <br>
	웹 어플리케이션 url 경로명 : <%=application.getContextPath() %> <br>
	로컬에 저장되어있는 경로명 : <%=application.getRealPath("/") %> <br>
	<% application.log("application 로그 확인"); %> <br>
</body>
</html>