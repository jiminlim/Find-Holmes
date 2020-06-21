package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.NoticeDto;


public interface NoticeService {

	public List<NoticeDto> getlist() throws SQLException;
	public void write(NoticeDto dto) throws SQLException;
	public void mvmodify(NoticeDto dto, int no) throws SQLException;
	public void delete(int no)throws SQLException ;
	public NoticeDto info(int no)throws SQLException;
	
}
