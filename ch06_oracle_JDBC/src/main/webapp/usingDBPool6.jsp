<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="ch06.*" %>
<jsp:useBean id="pool" class="ch06.UseBeanDBPool6" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBConnectionPool</title>
</head>
<body>
	<h1>DBConnectionPool</h1>
	<table border=1>
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>부서번호</th>
		</tr>
<%
	ArrayList<Bean> aList = pool.getList();
	for(int i = 0; i < aList.size(); i++){
%>
		<tr>
			<td><%=aList.get(i).getEmp_id() %></td>
			<td><%=aList.get(i).getEmp_name() %></td>
			<td><%=aList.get(i).getDept_name() %></td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>