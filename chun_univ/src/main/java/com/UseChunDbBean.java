package com;

import java.sql.*;

public class UseChunDbBean {
	private DBConnectionMgr chunPool = null;
	
	public UseChunDbBean() {
		chunPool = DBConnectionMgr.getInstance();
	}
	
	public ChunBean getStudent(String stdNo, String stdPw) {
		ChunBean cb = new ChunBean();
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		if(stdPw.equals("1234")) {
			try {
				con = chunPool.getConnection();
				st = con.createStatement();
				String q = "select STUDENT_NO, DEPARTMENT_NO, STUDENT_NAME, STUDENT_SSN, STUDENT_ADDRESS, ENTRANCE_DATE, ABSENCE_YN, COACH_PROFESSOR_NO"
						+ " from tb_student"
						+ " where STUDENT_NO = '" + stdNo + "'";
				rs = st.executeQuery(q);
				
				cb.setSTUDENT_NO(rs.getString("STUDENT_NO"));
				cb.setDEPARTMENT_NO(rs.getString("DEPARTMENT_NO"));
				cb.setSTUDENT_NAME(rs.getString("STUDENT_NAME"));
				cb.setENTRANCE_DATE(rs.getString("ENTRANCE_DATE"));
				cb.setABSENCE_YN(rs.getString("ABSENCE_YN"));
				cb.setCOACH_PROFESSOR_NO(rs.getString("COACH_PROFESSOR_NO"));
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				chunPool.freeConnection(con);
			}			
			return cb;
		}
		else {
			return null;
		}
		
	}
}
