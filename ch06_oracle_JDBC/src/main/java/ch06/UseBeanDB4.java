package ch06;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDB4 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PWD = "1234";
	
	
	
	public UseBeanDB4() {
		try {
			Class.forName(JDBC_DRIVER);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Bean> getList() {
		ArrayList<Bean> aList = new ArrayList<Bean>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PWD); 
			Statement st = con.createStatement();
			String query = "select * from emp_01";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				Bean bean = new Bean();
				// bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_id(rs.getString(1));
				bean.setEmp_name(rs.getString(2));
				bean.setDept_name(rs.getString(3));
				aList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return aList;
	}
}
