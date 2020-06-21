package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.UserInfo;
@Repository
public class UserDaoImpl implements UserDao {

	String ns="userinfo.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void updatePassword(String id, String password) throws SQLException {
		UserInfo user = new UserInfo();
		user.setId(id);
		user.setPassword(password);
		sqlSession.update(ns+"updatePassword",user);
	}
	
	@Override
	public boolean isExist(String id) throws SQLException {
		boolean flag = false;
		String isId = sqlSession.selectOne(ns+"isExist",id);
		if(isId!=null) {
			flag = true;
		}
		return flag;
	}

	@Override
	public void join(UserInfo userinfo) {
		sqlSession.insert(ns+"join",userinfo);
	}

	@Override
	public UserInfo login(String id, String pwd) {
		UserInfo user = new UserInfo();
		user.setId(id);
		user.setPassword(pwd);
		user = (UserInfo) sqlSession.selectOne(ns+"login",user);
		return user;
	}

	
	@Override
	public void updateInfo(UserInfo userinfo) {
		sqlSession.update(ns+"updateInfo",userinfo);
	}

	@Override
	public void deleteInfo(String id) {
		sqlSession.delete(ns+"deleteInfo",id);
	}
	@Override
	public int findpwd(UserInfo userinfo) throws SQLException {
		System.out.println(userinfo.getId()+" "+userinfo.getTel1());
		int pwd = sqlSession.selectOne(ns+"findpwd",userinfo);
		System.out.println("pwd"+pwd);
		return pwd;
	}	

	@Override
	public int idCheck(String idFromAjax) throws Exception {
		int cnt = sqlSession.selectOne(ns+"idCheck",idFromAjax);
		return cnt ;
	}

	@Override
	public List<UserInfo> test() throws Exception {
		
		return sqlSession.selectList(ns+"test");
	}

	@Override
	public UserInfo searchInfo(String id) {
		UserInfo user = (UserInfo) sqlSession.selectOne(ns+"searchInfo",id);
		return user;
	}	
	

}
