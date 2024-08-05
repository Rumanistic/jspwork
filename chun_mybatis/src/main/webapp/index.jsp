<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chun Univ.</title>
</head>
<body>
	<c:choose>
		<c:when test="${stdLogin == null}">
			<jsp:forward page="WEB-INF/views/login.jsp" />
		</c:when>
		
		<c:otherwise>
			<jsp:forward page="WEB-INF/views/main.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>