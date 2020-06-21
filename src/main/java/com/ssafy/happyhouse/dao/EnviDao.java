package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.mapping.Environment;

import com.ssafy.happyhouse.dto.EnvironmentInfo;

public interface EnviDao {

	List<EnvironmentInfo> bizcount(String dong);
	List<EnvironmentInfo> getAddress(EnvironmentInfo en);

}
