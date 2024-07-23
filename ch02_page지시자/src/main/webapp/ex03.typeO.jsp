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
      <li>외향적이고 사교적인 성격</li>
      <li>자신감이 넘침</li>
      <li>리더십이 강함</li>
      <li>단순하고 명쾌함</li>
    </ul>
    입니다.
</body>
</html>