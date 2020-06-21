package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.UserInfo;


public interface UserService {

	public UserInfo login(String id, String pwd) throws Exception;
	public void join(UserInfo userinfo);
	public String idCheck(String id) throws SQLException;
	public void manUpdate(UserInfo userinfo);
	public void manDelete(String id);
	public int findpwd(UserInfo userinfo) throws SQLException;
	public void updatePassword(String id, String password) throws SQLException;
	public int idChecked(String idFromAjax) throws Exception;
	public List<UserInfo> test()  throws Exception;
	public UserInfo searchInfo(String id);
}
