package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.mapping.Environment;

import com.ssafy.happyhouse.dto.EnvironmentInfo;

public interface EnviService {
	List<EnvironmentInfo> bizcount(String dong);
	List<EnvironmentInfo> getAddress(EnvironmentInfo en);

}
