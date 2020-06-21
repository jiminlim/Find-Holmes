package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.EnvironmentInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.PinArea;
@Repository
public class AreaDaoImpl implements AreaDao {
	
//	String ns="phone.";
//	@Autowired
//	private SqlSession sqlSession;
	@Override
	public void setting(String code, String id) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String searchCode(PinArea pinArea) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int check(String code, String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<String> searchPcode(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public PinArea pList(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<GreenInfo> getGreen() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<EnvironmentInfo> getEnvi(int currentPage, int sizePerPage, String dong) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int getTotalCount(String dong) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
//	@Override
//	public void setting(String code,String id) throws SQLException {
//		Connection con = null;
//		PreparedStatement ps = null;
//		try {
//			con = DBUtil.getConnection();
//			String sql = "insert into pinarea(pcode,user_id) values(?,?)";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, code);
//			ps.setString(2, id);
//			ps.execute();
//		} finally {
//			DBUtil.close(con);
//			DBUtil.close(ps);
//		}
//	}
//
//	@Override
//	public String searchCode(PinArea pinArea) {
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String code = null;
//		try {
//			con = DBUtil.getConnection();
//			String sql = "select acode from areainfo where city=? and gu=? and dong=?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, pinArea.getSi());
//			ps.setString(2, pinArea.getGu());
//			ps.setString(3, pinArea.getDong());
//			rs = ps.executeQuery();
//			if(rs.next()) {
//				code = rs.getString(1);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(con);
//			DBUtil.close(ps);
//			DBUtil.close(rs);
//		}
//		return code;
//	}
//
//	@Override
//	public int check(String code, String id) {
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		int check = 0;
//		try {
//			con = DBUtil.getConnection();
//			String sql = "select count(*) from pinarea where pcode=? and user_id=?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, code);
//			ps.setString(2, id);
//			rs = ps.executeQuery();
//			if(rs.next()) {
//				check=rs.getInt(1);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(con);
//			DBUtil.close(ps);
//			DBUtil.close(rs);
//		}
//		return check;
//	}
//
//	@Override
//	public List<String> searchPcode(String id) throws SQLException {
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		List<String> code = new ArrayList<>();
//		try {
//			con = DBUtil.getConnection();
//			String sql = "select pcode from pinarea where user_id=?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, id);
//			rs = ps.executeQuery();
//			while(rs.next()) {
//				code.add(rs.getString(1));
//			}
//		}finally {
//			DBUtil.close(con);
//			DBUtil.close(ps);
//			DBUtil.close(rs);
//		}
//		return code;
//	}
//
//	@Override
//	public PinArea pList(String code) throws SQLException {
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		PinArea area = new PinArea();
//		try {
//			con = DBUtil.getConnection();
//			String sql = "select acode,city,gu,dong from areainfo where acode=?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, code);
//			rs = ps.executeQuery();
//			while(rs.next()) {
//				area.setCode(rs.getString("acode"));
//				area.setSi(rs.getString("city"));
//				area.setGu(rs.getString("gu"));
//				area.setDong(rs.getString("dong"));
//			}
//		}finally {
//			DBUtil.close(con);
//			DBUtil.close(ps);
//			DBUtil.close(rs);
//		}
//		return area;
//	}
//
//	@Override
//	public List<GreenInfo> getGreen() throws SQLException {
//		List<GreenInfo> list = new ArrayList<GreenInfo>();
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		try {
//			con = DBUtil.getConnection();
//			String sql = "select dong,name,address from greenbelt";
//			ps = con.prepareStatement(sql);
//			rs = ps.executeQuery();
//			while(rs.next()) {
//				GreenInfo info = new GreenInfo();
//				info.setDong(rs.getString("dong"));
//				info.setName(rs.getString("name"));
//				info.setAddress(rs.getString("address"));
//				list.add(info);
//			}
//		}finally {
//			DBUtil.close(con);
//			DBUtil.close(ps);
//			DBUtil.close(rs);
//		}
//		return list;
//	}
////	@Override
////	public List<GreenInfo> getGreen(String dong) throws SQLException {
////		List<GreenInfo> list = new ArrayList<GreenInfo>();
////		Connection con = null;
////		PreparedStatement ps = null;
////		ResultSet rs = null;
////		try {
////			con = DBUtil.getConnection();
////			String sql = "select name,address from greenbelt where dong=?";
////			ps = con.prepareStatement(sql);
////			ps.setString(1, dong);
////			rs = ps.executeQuery();
////			while(rs.next()) {
////				GreenInfo info = new GreenInfo();
////				info.setName(rs.getString("name"));
////				info.setAddress(rs.getString("address"));
////				list.add(info);
////			}
////		}finally {
////			DBUtil.close(con);
////			DBUtil.close(ps);
////			DBUtil.close(rs);
////		}
////		return list;
////	}
//
//	@Override
//	public List<EnvironmentInfo> getEnvi(int currentPage, int sizePerPage,String dong) throws SQLException {
//		List<EnvironmentInfo> list = new ArrayList<EnvironmentInfo>();
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		try {
//			con = DBUtil.getConnection();
//			String sql = "select name,address from enviroment where dong=? limit ?,?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, dong);
//			ps.setInt(2, (currentPage - 1) * sizePerPage);
//			ps.setInt(3, sizePerPage);
//			rs = ps.executeQuery();
//			System.out.println(sql+" - "+((currentPage - 1) * sizePerPage)+" / "+sizePerPage);
//			while(rs.next()) {
//				EnvironmentInfo info = new EnvironmentInfo();
//				info.setName(rs.getString("name"));
//				info.setAddress(rs.getString("address"));
//				list.add(info);
//				System.out.println(info);
//			}
//		}finally {
//			DBUtil.close(con);
//			DBUtil.close(ps);
//			DBUtil.close(rs);
//		}
//		return list;
//	}
//
//	@Override
//	public int getTotalCount(String dong) throws SQLException {
//		int cnt = 0;
//		Connection con = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		
//		try {
//			con = DBUtil.getConnection();
//			String sql ="select count(*) from enviroment where dong=? ";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, dong);
//			rs = ps.executeQuery();
//			rs.next();
//			cnt = rs.getInt(1);
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(ps);
//			DBUtil.close(con);
//		}
//		System.out.println("total count_   "+cnt);
//		return cnt;
//	}

}
