<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="ch06.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBConnectionPool</title>
</head>
<body>
	<h1>DBConnectionPool</h1>
<%
	DBConnectionMgr dbcm = DBConnectionMgr.getInstance();
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		con = dbcm.getConnection();
		st = con.createStatement();
		String sql = "select * from emp_01";
		rs = st.executeQuery(sql);
%> 
	<table border=1>
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>부서번호</th>
		</tr>
<%
		while(rs.next()){
%>
		<tr>
			<td><%=rs.getString("emp_id") %></td>
			<td><%=rs.getString("emp_name") %></td>
			<td><%=rs.getString("dept_name") %></td>
		</tr>
<% 
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try{
			if(con != null){
				dbcm.freeConnection(con);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>

	</table>
</body>
</html>