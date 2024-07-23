package ch07;

import java.sql.*;

public class RegisterMgr {
	private DBConnectionMgr pool;
	
	public RegisterMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean isValid(String id, String pw) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean loginCon = false;
		
		try {
			con = pool.getConnection();
			/*
			 * String q = "select count(*)" 
			 * 	+ " from mem" 
			 * 	+ " where mem_id = '" + id + "'" 
			 * 	+ " and mem_pwd = '" + pw + "'";
			 */
			String q = "select count(*)"
					+ " from mem"
					+ " where mem_id = ?"
						+ "	and mem_pwd = ?";
			pst = con.prepareStatement(q);
			pst.setString(1, id);
			pst.setString(2, pw);
			
			rs = pst.executeQuery();
			
			if(rs.next() && rs.getInt(1) == 1) {
				loginCon = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		return loginCon;
	}
}
