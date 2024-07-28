package board;

import java.sql.*;
import java.util.*;

public class BoardDAO {
	private DBConnectionMgr pool;
	Connection con = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql = "";
	
	public BoardDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public int getTotalBoards(String keyField, String keyWord) {
		int sum = 0;
		
		try {
			con = pool.getConnection();
			if(keyWord == null || keyWord.equals("")) {
				sql = "select count(*) from board";
			}
			else {
				sql = "select count(*) from board"
				+ " where " + keyField + " like '%" + keyWord + "%'";
			}
			System.out.println(sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);
			
			if(rs.next()) {
				sum = rs.getInt(1);
			}
			System.out.println("count = " + sum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return sum;
	}
	
	public ArrayList<Board> getBoardList(String keyField, String keyWord, int start, int end) {
		ArrayList<Board> aList = new ArrayList<Board>();
		System.out.println(start);
		try {
			con = pool.getConnection();
			
			if(keyWord == null || keyWord.equals("")) {
//				sql = "select * from (select rownum as rnum, t.* from (select * from board order by 1 desc) t where rownum <= " + end + ") where rnum > " + start;
				sql = "select * from("
						+ " select ROWNUM as RNUM, bt1.* from"
						+ " (select * from board order by ref desc, pos) bt1"
						+ " ) where RNUM between " + start + " and " + end;
			}
			else {
//				sql = "select * from (select rownum as rnum, t.* from (select * from board where "+ keyField + " like '%" + keyWord + "%' order by 1 desc) t where rownum <= " + end + ") where rnum > " + start;
				sql = "select * from("
						+ " select ROWNUM as RNUM, bt1.* from"
						+ " (select * from board order by ref desc, pos) bt1"
						+ " where bt1." + keyField + " like '%" + keyWord + "%'"
						+ " ) where RNUM between " + start + " and " + end;
			}
			st = con.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()) {
//				System.out.println(rs.getInt("num"));
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setSubject(rs.getString("subject"));
				b.setName(rs.getString("name"));
				b.setRegdate(rs.getString("regdate"));
				b.setCount(rs.getInt("count"));
				b.setDepth(rs.getInt("depth"));
				
				aList.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return aList;
	}
	
	public Board getBoardInfo(int num) {
		Board b = new Board();
		
		try {
			con = pool.getConnection();
			sql = "select * from board where num = ?";
			
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				b.setName(rs.getString("name"));
				b.setRegdate(rs.getString("regdate"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setIp(rs.getString("ip"));
				b.setPass(rs.getString("pass"));
				updateCount(num);
				b.setCount(rs.getInt("count") + 1);
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		return b;
	}
	
	public boolean updateCount(int num) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where num = " + num;
			int i = con.createStatement().executeUpdate(sql);
			if(i > 0) {
				System.out.println("Successfully update");
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return flag;
	}
	
	public void updateReplyPos(int ref, int pos) {
		try {
			con = pool.getConnection();
			sql = "update board set pos = pos + 1 where ref=? and pos > ?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, ref);
			pst.setInt(2, pos);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	public boolean insertBoard(Board b) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into board values(seq_board.nextval, ?, ?, ?, 0, seq_board.currval, 0, sysdate, ?, ?, default)";
			pst = con.prepareStatement(sql);
			pst.setString(1, b.getName());
			pst.setString(2, b.getSubject());
			pst.setString(3, b.getContent());
			pst.setString(4, b.getPass());
			pst.setString(5, b.getIp());
			
			if(pst.executeUpdate() > 0) {
				System.out.println("Insert success");
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst);
		}
		
		return flag;
	}
	
	public boolean updateBoard(Board b) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update board set name=?, subject=?, content=? where num="+b.getNum();
			pst = con.prepareStatement(sql);
			pst.setString(1, b.getName());
			pst.setString(2, b.getSubject());
			pst.setString(3, b.getContent());
			if(pst.executeUpdate() > 0) {
				System.out.println("Insert success");
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst);
		}
		
		return flag;
	}
	
	public void replyBoard(Board b) {
		try {
			con = pool.getConnection();
			sql = "insert into board values (seq_board.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, default)";
			int depth = b.getDepth() + 1;
			int pos = b.getPos() + 1;
			
			pst = con.prepareStatement(sql);
			pst.setString(1, b.getName());
			pst.setString(2, b.getSubject());
			pst.setString(3, b.getContent());
			pst.setInt(4, pos);
			pst.setInt(5, b.getRef());
			pst.setInt(6, depth);
			pst.setString(7, b.getPass());
			pst.setString(8, b.getIp());
			if(pst.executeUpdate() > 0) {
				System.out.println("Insert success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst);
		}
	}
	
	public boolean deleteBoard(int num) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select count(*) from board where ref = num";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				if(rs.getInt(1) <= 1) {
					sql = "delete from board where ";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return flag;
	}
}
