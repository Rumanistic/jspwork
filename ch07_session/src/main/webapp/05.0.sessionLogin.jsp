<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Cookie 로그인</h1>
<%
	String id = (String)session.getAttribute("idKey");
	if(id.equals("")) {
		System.out.println(id);
%>
	<form action="04.1.cookieLoginProc.jsp" method="post">
		ID : <input name="userID"><p/>
		PW : <input name="userPW" type="password"><p/>
		<input type="submit" value="login">
		<input type="reset">
	</form>
<%
	}
	else{
		System.out.println(id);
%>
	<script type="text/javascript">
		location.href = "05.2.cookieMain.jsp";
	</script>
<%
	}
%>
</body>
</html>