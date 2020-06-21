package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.StoreInfo;
@Repository
public class StoreDaoImpl implements StoreDao {
//	String ns="phone.";
//	@Autowired
//	private SqlSession sqlSession;
	@Override
	public HashMap<String, List<StoreInfo>> searchAll(String ID) throws SQLException {
		return null;
	}
	
//	@Override
//	public HashMap<String, List<StoreInfo>> searchAll(String ID) throws SQLException {
//		HashMap<String, List<StoreInfo>> hm = new HashMap<>();
//		ArrayList<String> codeArr = new ArrayList<>();
//		
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		
//		try {
//			con = DBUtil.getConnection();
//			String sql = "select pcode from pinarea where user_id = ?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, ID);
//			
//			rs = ps.executeQuery();
//			while(rs.next()) {
//				codeArr.add(rs.getString("pcode"));
//			}
//			
//			sql = "select shopname, codename3, jibuaddress, dong from storeinfo where dongcode = ?";
//			ps = con.prepareStatement(sql);
//			
//			for(String code : codeArr) {
//				ps.setString(1, code);
//				rs = ps.executeQuery();
//				
//				List<StoreInfo> temp = new ArrayList<>();
//				
//				String dong = null;
//				while(rs.next()) {
//					dong = rs.getString("dong");
//					temp.add(new StoreInfo(rs.getString("shopname"), rs.getString("codename3"), rs.getString("jibuaddress")));
//				}
//				
//				hm.put(dong, temp);
//			}
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(ps);
//			DBUtil.close(con);
//		}
//		
//		return hm;
//	}

}
