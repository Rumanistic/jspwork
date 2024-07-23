package ch09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VoteDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql = "";
	
	public VoteDao() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean insertVote(VoteList vList, VoteItem vItem) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into votelist values(seq_vote.nextval, ?, ?, ?, sysdate, ?, default)";
//			System.out.println(vList.getQuestion() + " | " + vList.getSdate() + " | " + vList.getEdate() + " | " + vList.getType());
			pst = con.prepareStatement(sql);
			pst.setString(1, vList.getQuestion());
			pst.setString(2, vList.getSdate());
			pst.setString(3, vList.getEdate());
			pst.setInt(4, vList.getType());
			
			int listResult = pst.executeUpdate();
			int itemResult = 0;
			if(listResult == 1) {
				sql = "insert into voteitem values(seq_vote.currval, ?, ?, default)";
				pst = con.prepareStatement(sql);
				String[] item = vItem.getItem();
				for(int i = 0; i < item.length; i++) {
					if(item[i] == null || item[i].equals(""))
						break;
					pst.setInt(1, i+1);
					pst.setString(2, item[i]);					
					itemResult = pst.executeUpdate();
				}
				itemResult = 1;
			}
			if(itemResult == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst);
		}
		return flag;
	}

	public VoteList getOneVote(int num) {
		VoteList vList = new VoteList();
		
		try {
			con = pool.getConnection();
			if(num == 0) {
				sql = "select * from votelist where num= (select max(num) from votelist)";
//				System.out.println(sql);
			}
			else {
				sql = "select * from votelist where num=" + num;				
			}
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				vList.setQuestion(rs.getString("question"));
//				System.out.println(vList.getQuestion());
				vList.setType(rs.getInt("type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return vList;
	}
	
	
	
	public ArrayList<String> getVoteItem(int num) {
		ArrayList<String> aList = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			if(num == 0)
				sql = "select item from voteitem where listnum= (select max(num) from votelist)";
			else
				sql = "select item from voteitem where listnum=" + num;
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				aList.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return aList;
	}
	
	public ArrayList<VoteList> getList(){
		ArrayList<VoteList> aList = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by 1 desc";
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				VoteList vl = new VoteList();
				vl.setNum(rs.getInt("num"));
				vl.setQuestion(rs.getString("question"));
				vl.setSdate(rs.getString("sdate"));
				vl.setEdate(rs.getString("edate"));
				
				aList.add(vl);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return aList;
	}
	
	public boolean updateVoteCount(int num, String[] itemNum) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			if(num == 0) {
				String mSql = "select max(num) from votelist";
				rs = con.prepareStatement(mSql).executeQuery();
				rs.next();
				num = rs.getInt(1);
			}
			sql = "update voteitem set count = count + 1 where listnum = ? and itemnum = ?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, num);
			
			for(int i = 0; i < itemNum.length; i++) {
				if(itemNum[i] == null || itemNum[i].equals(""))
					break;
				System.out.println(itemNum[i]);
				pst.setInt(2, Integer.parseInt(itemNum[i]) + 1);
				if(pst.executeUpdate() == 1)
					flag = true;
			}
			pst.setInt(1, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		return flag;
	}
	
	public int sumVoteCount(int num) {
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "select sum(count) from voteitem where listnum=?";
			pst = con.prepareStatement(sql);
			if(num == 0) {
				String mSql = "select max(num) from votelist";
				rs = con.prepareStatement(mSql).executeQuery();
				rs.next();
				num = rs.getInt(1);
			}
			pst.setInt(1, num);
			rs = pst.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		
		return count;
	}
	
	public ArrayList<VoteItem> getVoteCount(int num){
		ArrayList<VoteItem> aList = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			sql = "select item, count from voteitem where listnum=?";
			pst = con.prepareStatement(sql);
			if(num == 0) {
				String mSql = "select max(num) from votelist";
				rs = con.prepareStatement(mSql).executeQuery();
				rs.next();
				num = rs.getInt(1);
			}
			pst.setInt(1, num);
			rs = pst.executeQuery();
			while(rs.next()) {
				VoteItem vi = new VoteItem();
				String[] item = new String[1];
				item[0] = rs.getString(1);
				vi.setItem(item);
				vi.setCount(rs.getInt(2));
				aList.add(vi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pst, rs);
		}
		
		return aList;
	}
}
