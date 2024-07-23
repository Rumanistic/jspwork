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
      <li>신중하고 꼼꼼한 성격</li>
      <li>책임감이 강하고 성실함</li>
      <li>조용하고 내성적임</li>
      <li>다른 사람을 배려하고 협조적임</li>
    </ul>
    입니다.
</body>
</html>