<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch06.*" %>
<jsp:useBean id="uBean" class="ch06.UseBeanDB4"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1></h1>
	<table border=1>
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>부서번호</th>
		</tr>
<%
	ArrayList<Bean> aList = uBean.getList();
	
	for(int i = 0; i < aList.size(); i++){
		/* Bean bean = aList.get(i); */
%>
		<tr>
			<td><%=aList.get(i).getEmp_id() %></td>
			<td><%=aList.get(i).getEmp_name() %></td>
			<td><%=aList.get(i).getDept_code() %></td>
		</tr>
<% 
	}
%>
	</table>
</body>
</html>