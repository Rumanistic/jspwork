package ch06;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleDBTest1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("oracle.jdbc.OracleDriver");
//			Class.forName("com.mysql.jdbc.Driver");		<< MySQL 사용시
//			Class.forName("org.mariadb.jdbc.Driver");	<< MariaDB 사용시
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
			System.out.println("Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}