package ch06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class OracleDBTest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection con = null; 
		Statement st = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
			System.out.println("Success");
			
			st = con.createStatement();
			// select문 사용 시 executeQuery() 메서드 사용
			
			rs = st.executeQuery("select * from department");
			
			while(rs.next()) {
				System.out.println(rs.getString("dept_id") + " | " + String.format("%-8s", rs.getString(2)) + "\t| " + rs.getString(3));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
				// TODO: handle exception
			}
			
		}
	}

}
