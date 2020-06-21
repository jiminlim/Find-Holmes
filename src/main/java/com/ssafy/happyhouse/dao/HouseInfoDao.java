package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.HouseInfo;


public interface HouseInfoDao {

	public List<HouseInfo> searchAllHouseInfo() throws  SQLException;
	
}
