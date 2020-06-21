package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.EnvironmentInfo;
import com.ssafy.happyhouse.service.EnviService;

@Repository
public class EnviDaoImpl implements EnviDao {

	@Autowired
	private SqlSession sqlSession;
	String ns = "envi.";
	@Override
	
	public List<EnvironmentInfo> bizcount(String dong) {
		return sqlSession.selectList(ns+"bizcount",dong);
	}
	@Override
	public List<EnvironmentInfo> getAddress(EnvironmentInfo en) {
		return sqlSession.selectList(ns+"getAddress",en);
	}

}
