<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	boolean result = mMgr.loginMember(id, pwd);
	
	String msg = "로그인에 실패했습니다.";
	String location = "login.jsp";
	if(result) {
		session.setAttribute("idKey", id);
		msg = id + "님 환영합니다.";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "login.jsp";
</script>
</head>
<body>

</body>
</html>