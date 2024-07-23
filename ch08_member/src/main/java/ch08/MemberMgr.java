package ch08;

import java.sql.*;

public class MemberMgr {
	private DBConnectionMgr pool;
	private Connection con = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean checkId(String id) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			
			flag = rs.next();
			System.out.println(rs.getString(1));
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		
		return flag;	
	}
	
	public boolean insertMember(Member m) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			
			String[] hobby = m.getHobby();
			char[] hb = {'0', '0', '0', '0', '0'};
			String[] lists = {"인터넷","여행","게임","영화","운동"};
			if(hobby != null) {
				for(int i = 0; i < hobby.length; i++) {
					for(int j = 0; j < lists.length; j++) {
						if(hobby[i].equals(lists[j])) {
							hb[j] = '1';
							break;
						}						
					}
				}
			}
			StringBuilder sb = new StringBuilder();
			sb.append(hb);
			
			sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pst = con.prepareStatement(sql);
			pst.setString(1, m.getId());
			pst.setString(2, m.getPwd());
			pst.setString(3, m.getName());
			pst.setString(4, m.getGender());
			pst.setString(5, m.getBirthday());
			pst.setString(6, m.getEmail());
			pst.setString(7, m.getZipcode());
			pst.setString(8, m.getAddress());
			pst.setString(9, m.getDetail_address());
			pst.setString(10, sb.toString());
			pst.setString(11, m.getJob());
			
			if(pst.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst);
		}
		return flag;
	}
	
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id=? and pwd=?";
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pwd);
			rs = pst.executeQuery();
			
			if(rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		
		return flag;
	}
}
