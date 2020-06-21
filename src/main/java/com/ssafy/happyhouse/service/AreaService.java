package com.ssafy.happyhouse.service;
import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.EnvironmentInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.PinArea;
import com.ssafy.happyhouse.util.PageNavigation;

public interface AreaService {

	public String setting(PinArea pinArea, String id) throws SQLException;
	public List<PinArea> chooseList(String id) throws SQLException;
	public List<GreenInfo> getGreen(String dong, String[] cbox)throws SQLException;
	public List<EnvironmentInfo> getEnvi(int currentPage, int sizePerPage, String dong, String[] cbox) throws SQLException;
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String id);

}
