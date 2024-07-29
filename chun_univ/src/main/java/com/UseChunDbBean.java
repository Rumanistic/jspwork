package com;

import java.sql.*;

public class UseChunDbBean {
	private DBConnectionMgr chunPool = null;
	Connection con = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql = "";
	
	public UseChunDbBean() {
		chunPool = DBConnectionMgr.getInstance(); 
	}
	
	public boolean doLogin(String stdId, String stdPwd) {
		boolean flag = false;

		try {
			con = chunPool.getConnection();
			sql = "select * from tb_student where student_no = ? and student_pwd = ?";
			pst = con.prepareStatement(sql);
			pst.setString(1, stdId);
			pst.setString(2, stdPwd);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
			else {
				return flag;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			chunPool.freeConnection(con, pst, rs);
		}
		
		return flag;
	}
	
	public String getStdId(String stdName, String stdSsn) {
		StringBuilder sb = new StringBuilder();
		
		try {
			con = chunPool.getConnection();
			sql = "select s.*, d.department_name as dept from tb_student s, tb_department d "
					+ " where s.department_no=d.department_no and s.student_name='" + stdName + "' and s.student_ssn like '" + stdSsn + "-%'";
			System.out.println(sql);
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs != null) {
				sb.append("입력하신 내용과 일치하는 학번/아이디는\n");
				while(rs.next()) {
					sb.append(rs.getString("student_no") + " (");
					sb.append(rs.getString("dept") + ", ");
					sb.append(rs.getString("entrance_date").substring(0, 10) + ")\n");
				}
				sb.append("입니다.");
			} else {
				sb.append("검색된 계정이 없습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			chunPool.freeConnection(con);
		}			
		return sb.toString();
	}
	
	public ChunBean getStdInfo(String stdId) {
		ChunBean cb = new ChunBean();
		
		try {
			con = chunPool.getConnection();
			sql = "select s.*, d.department_name, p.professor_name "
					+ " from tb_student s, tb_department d, tb_professor p"
					+ " where s.department_no=d.department_no "
					+ " and s.coach_professor_no=p.professor_no "
					+ " and s.student_no=" + stdId;
			System.out.println(sql);
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs != null) {
				cb.setStudent_no(rs.getString("student_no"));
				cb.setDepartment_no(rs.getString("department_no"));
				cb.setDepartment_name(rs.getString("department_name"));
				cb.setStudent_name(rs.getString("student_name"));
				cb.setEntrance_date(rs.getString("entrance_date"));
				cb.setAbsence_yn(rs.getString("absence_yn"));
				cb.setCoach_professor_no(rs.getString("coach_professor_no"));
				cb.setCoach_professor_name(rs.getString("coach_professor_name"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			chunPool.freeConnection(con);
		}
		
		return cb;
	}
	
	public boolean doVerify(String stdNo, String stdName, String stdSsn) {
		boolean b = false;
		
		try {
			con = chunPool.getConnection();
			sql = "select * from tb_student where student_no=? and student_name=? and student_ssn like '%" + stdSsn + "%'";
			pst = con.prepareStatement(sql);
			pst.setString(1, stdNo);
			pst.setString(2, stdName);
			System.out.println(sql);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			chunPool.freeConnection(con, pst);
		}
		
		return b;
	}
	
	public boolean updateStdPwd(String stdNo, String newPwd) {
		boolean b = false;
		
		try {
			con = chunPool.getConnection();
			sql = "update tb_student set student_pwd='" + newPwd + "' where student_no='" + stdNo +"'";
			pst = con.prepareStatement(sql);
			int result = pst.executeUpdate();
			
			if(result > 0) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			chunPool.freeConnection(con);
		}
		
		return b;
	}
}
