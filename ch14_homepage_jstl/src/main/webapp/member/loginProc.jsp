<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <c:set var="userID" value="${id}" scope="request" />
	<c:set var="userPWD" value="${pwd}" scope="request" /> --%>
	<c:set var="result" value="<%=mMgr.loginMember(id, pwd) %>" scope="request" />
	<c:set var="msg" value="로그인에 실패하였습니다." />
	<c:if test="${result}">
		<c:set var="id" value="${id}" scope="session" />
		<c:set var="msg" value="로그인에 성공하였습니다." />
	</c:if>
	
	<script type="text/javascript">
	console.log("result: " + ${result});
	console.log("id: " + ${id});
	alert("${msg}");
	location.href = "../index.jsp";
	</script>
</body>
</html>