package ch06;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDBPool6 {
	private DBConnectionMgr pool = null;
	
	public UseBeanDBPool6() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<Bean> getList(){
		ArrayList<Bean> aList = new ArrayList<Bean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from emp_01");
			
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setDept_name(rs.getString("dept_name"));
				aList.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			pool.freeConnection(con);
		}
		return aList;
	}
}
