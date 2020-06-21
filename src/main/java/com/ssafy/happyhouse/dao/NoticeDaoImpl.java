package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.NoticeDto;
@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeDto> getlist() throws SQLException {
		return sqlSession.selectList("notice.getlist");
	}
	@Override
	public void write(NoticeDto dto) throws SQLException {
		sqlSession.selectOne("notice.write",dto);
	}
	@Override
	public void mvmodify(NoticeDto dto, int no) throws SQLException {
		sqlSession.selectOne("notice.mvmodify",dto);
	}
	
	@Override
	public void delete(int no) throws SQLException {
		sqlSession.selectOne("notice.delete", no);
		
	}
	@Override
	public NoticeDto info(int no) throws SQLException {
		return sqlSession.selectOne("notice.info", no);
	}

}
