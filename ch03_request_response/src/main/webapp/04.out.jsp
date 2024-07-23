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
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int usedBuffer = totalBuffer - remainBuffer;
%>
	총 버퍼 사이즈 : <%=totalBuffer %>byte <br>
	잔여 버퍼 사이즈 : <%=remainBuffer %>byte <br>
	사용 버퍼 사이즈 : <%=usedBuffer %>byte
</body>
</html>