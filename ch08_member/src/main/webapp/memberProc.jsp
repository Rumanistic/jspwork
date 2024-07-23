<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="ch08.Member" />
<jsp:useBean id="mMgr" class="ch08.MemberMgr" />
<jsp:setProperty name="mem" property="*" />
<%
	boolean result = mMgr.insertMember(mem);
	String msg = "회원가입에 실패하였습니다.";
	String location = "memberLogin.jsp";
	if(result) {
		msg = "회원가입 되었습니다.";
		location = "login.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg %>");
	location.href="<%=location %>";
</script>
</head>
<body>

</body>
</html>