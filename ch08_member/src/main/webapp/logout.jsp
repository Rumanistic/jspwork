<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("idKey");
	String location = "login.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("정상적으로 로그아웃되었습니다.");
	location.href = "login.jsp";
</script>
</head>
<body>

</body>
</html>