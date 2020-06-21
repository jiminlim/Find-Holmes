package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.EnviDao;
import com.ssafy.happyhouse.dto.EnvironmentInfo;

@Service
public class EnviServiceImpl implements EnviService {

	@Autowired 
	private EnviDao dao;
	
	@Override
	public List<EnvironmentInfo> bizcount(String dong) {
		return dao.bizcount(dong);
	}

	@Override
	public List<EnvironmentInfo> getAddress(EnvironmentInfo en) {
		return dao.getAddress(en);
	}

}
