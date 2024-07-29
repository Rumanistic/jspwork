package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDao {
	private DBConnectionMgr pool;
	private Connection con = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public ReplyDao() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<Reply> getRelpyList(int ref) {
		ArrayList<Reply> rList = new ArrayList<Reply>();
		
		try {
			con = pool.getConnection();
			sql = "select * from reply where ref = ? order by no";
			pst = con.prepareStatement(sql);
			pst.setInt(1, ref);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Reply r = new Reply();
				r.setNo(rs.getInt("no"));
				r.setContent(rs.getString("content"));
				r.setRef(rs.getInt("ref"));
				r.setName(rs.getString("name"));
				r.setRedate(rs.getString("redate"));
				
				rList.add(r);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		return rList;
	}
	
	public void insertReply(Reply r) {
		try {
			con = pool.getConnection();
			sql = "insert into reply values(seq_reply.nextval, ?, ?, ?, sysdate)";
			pst = con.prepareStatement(sql);
			pst.setString(1, r.getContent());
			pst.setInt(2, r.getRef());
			pst.setString(3, r.getName());
			
			if(pst.executeUpdate() > 0) {
				System.out.println("정상 등록되었습니다.");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
