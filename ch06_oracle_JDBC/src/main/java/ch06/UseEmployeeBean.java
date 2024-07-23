package ch06;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UseEmployeeBean {
	private DBConnectionMgr empPool = null;
	
	public UseEmployeeBean() {
		empPool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<EmployeeBean> getList(){
		ArrayList<EmployeeBean> aList = new ArrayList<EmployeeBean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = empPool.getConnection();
			st = con.createStatement();
			String q = "select emp_id, emp_name, email, phone, j.job_name as job_name"
					+ "	from employee e, job j"
					+ " where e.job_code = j.job_code";
			rs = st.executeQuery(q);
			
			while(rs.next()) {
				EmployeeBean b = new EmployeeBean();
				b.setEmp_id(rs.getString("emp_id"));
				b.setEmp_name(rs.getString("emp_name"));
				b.setEmail(rs.getString("email"));
				b.setPhone(rs.getString("phone"));
				b.setJob_name(rs.getString("job_name"));
				aList.add(b);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			empPool.freeConnection(con);
		}
		return aList;
	}
}
