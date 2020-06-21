package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.EnvironmentInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.PinArea;


public interface AreaDao {

	public void setting(String code, String id) throws SQLException;
	public String searchCode(PinArea pinArea) ;
	public int check(String code, String id);
	public List<String> searchPcode(String id)throws SQLException;
	public PinArea pList(String code) throws SQLException;
	public List<GreenInfo> getGreen()throws SQLException;
	public List<EnvironmentInfo> getEnvi(int currentPage, int sizePerPage,String dong)throws SQLException;
	
	public int getTotalCount(String dong) throws SQLException;

}
