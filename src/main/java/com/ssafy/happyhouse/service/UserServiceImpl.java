package com.ssafy.happyhouse.service;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.UserDao;
import com.ssafy.happyhouse.dto.UserInfo;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public UserInfo login(String id, String pwd) throws Exception {
		if(id ==null || pwd == null) {
			throw new Exception();
		}
		return userDao.login(id,pwd);
	}

	@Override
	public void join(UserInfo userinfo) {
		userDao.join(userinfo);
	}


	@Override
	public String idCheck(String id) throws SQLException {
		String result = null;
		boolean flag = userDao.isExist(id);
		//false -> 사용가능 / true -> 중복아이디 있음 사용불가
		if(flag) {
			result = "no";
		}else {
			result = "yes";
		}
		return result;
	}

	@Override
	public void manUpdate(UserInfo userinfo) {
		userDao.updateInfo(userinfo);
	}

	@Override
	public void manDelete(String id) {
		userDao.deleteInfo(id);
	}

	@Override
	public int findpwd(UserInfo userinfo) throws SQLException {
		int pwd = userDao.findpwd(userinfo);
		return pwd;
	}

	@Override
	public void updatePassword(String id, String password) throws SQLException {
		userDao.updatePassword(id, password);
	}

	@Override
	public int idChecked(String idFromAjax) throws Exception {
		int idCount = 0;
		idCount = userDao.idCheck(idFromAjax);
		return idCount;
	}

	@Override
	public List<UserInfo> test() throws Exception {
		return userDao.test();
	}

	@Override
	public UserInfo searchInfo(String id) {
		return userDao.searchInfo(id);
	}

}
