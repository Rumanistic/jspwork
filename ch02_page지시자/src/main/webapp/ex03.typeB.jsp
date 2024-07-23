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
      <li>자유롭고 창의적인 성격</li>
      <li>개성적이고 독립적임</li>
      <li>감정 표현이 솔직함</li>
      <li>변덕스러울 때가 있음</li>
    </ul>
    입니다.
</body>
</html>