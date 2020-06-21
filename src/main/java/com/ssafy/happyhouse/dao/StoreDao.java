package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ssafy.happyhouse.dto.StoreInfo;


public interface StoreDao {
	public HashMap<String, List<StoreInfo>> searchAll(String ID) throws SQLException;
}
