<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="ch06.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* String[] employee = new String[13]; */
	Connection con = null; 
	Statement st = null;
	ResultSet rs = null;
	ResultSetMetaData rsmd = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
		st = con.createStatement();
		rs = st.executeQuery("select * from employee");
		rsmd = rs.getMetaData();
%>
	<table border=1>
		<tr>
			<th>EMP_ID</th>
			<th>EMP_NAME</th>
			<th>EMP_NO</th>
			<th>EMAIL</th>
			<th>PHONE</th>
			<th>DEPT_CODE</th>
			<th>JOB_CODE</th>
			<th>SALARY</th>
			<th>BONUS</th>
			<th>MANAGER_ID</th>
			<th>HIRE_DATE</th>
			<th>END_DATE</th>
			<th>ENT_YN</th>
		</tr>
<%
	while(rs.next()){
%>
		<tr>
<%
		for(int i = 0; i < rsmd.getColumnCount(); i++){
%>
			<td><%=rs.getString(i+1) %></td>
<%
		}
%>
		</tr>
<%
	}
%>
	</table>
<%
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(rs != null) {
				rs.close();
			}
			if(st != null) {
				st.close();
			}
			if(con != null) {
				con.close();
			}				
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
%>

</body>
</html>