package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.UserInfo;


public interface UserDao {
	
    public UserInfo login(String id, String pwd);
	public void join(UserInfo userinfo);
	public boolean isExist(String id) throws SQLException;
	public void updateInfo(UserInfo userinfo);
	public void deleteInfo(String id);
	public int findpwd(UserInfo userinfo) throws SQLException;
	public void updatePassword(String ID, String password) throws SQLException;
	public int idCheck(String idFromAjax) throws Exception;
	public List<UserInfo> test() throws Exception;
	public UserInfo searchInfo(String id);
}
