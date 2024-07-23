<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "ch06.*, java.util.*, java.sql.*"%>
<jsp:useBean id="emp" class="ch06.UseEmployeeBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Data</title>
</head>
<body>
	<h1>Employee Data</h1>
	<table border=1>
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>직급</th>
		</tr>
<%
	ArrayList<EmployeeBean> aList = emp.getList();

	for(int i = 0; i < aList.size(); i++){
%>
		<tr>
			<td><%=aList.get(i).getEmp_id() %></td>
			<td><%=aList.get(i).getEmp_name() %></td>
			<td><%=aList.get(i).getEmail() == null ? 
					"" : aList.get(i).getEmail() %></td>
			<td><%=aList.get(i).getPhone() == null ? 
					"" : aList.get(i).getPhone() %></td>
			<td><%=aList.get(i).getJob_name() == null ? 
					"" : aList.get(i).getJob_name() %></td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>
