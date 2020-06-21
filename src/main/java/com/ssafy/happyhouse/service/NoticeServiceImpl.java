package com.ssafy.happyhouse.service;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.NoticeDao;
import com.ssafy.happyhouse.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao dao;

	@Override
	public List<NoticeDto> getlist() throws SQLException {
		return dao.getlist();
	}

	@Override
	public void write(NoticeDto dto) throws SQLException{
		dao.write(dto);
	}

	@Override
	public void mvmodify(NoticeDto dto,int no) throws SQLException {
		dao.mvmodify(dto,no);
	}

	@Override
	public void delete(int no) throws SQLException {
		dao.delete(no);
	}

	@Override
	public NoticeDto info(int no) throws SQLException{
		return dao.info(no);
	}

}
