<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMem" class="ch07.RegisterMgr" /> 
<%
	String id = request.getParameter("userID");
	String pw = request.getParameter("userPW");
	
	if(regMem.isValid(id, pw)) {
		session.setAttribute("idKey", id);
%>
<script type="text/javascript">
	alert("로그인 되었습니다");
	location.href = "05.2.cookieMain.jsp";
</script>
<%
	}
	else {
%>
<script type="text/javascript">
	alert("로그인 정보가 올바르지 않습니다");
	location.href = "05.0.cookieLogin.jsp";
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>