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
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String type = request.getParameter("type");
%>
	<h1><%=name %>님의 혈액형은 <%=type.toUpperCase() %>형이고 성격은</h1>
	<ul>
      <li>이성적이고 합리적인 성격</li>
      <li>창의적이고 직관적임</li>
      <li>두 가지 성향을 동시에 가짐</li>
      <li>상황에 따라 성격이 변함</li>
    </ul>
    입니다.
</body>
</html>