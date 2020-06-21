package com.ssafy.happyhouse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.UserInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
          "file:src/main/webapp/WEB-INF/spring/application-context.xml"
    })

public class HouseTest {
	@Autowired
	private SqlSession sqlSession;
	
	String ns="housedeal.";
	@Test
//	public void testSearchAll() {
//		System.out.println("test1111");
////		List<HouseDeal> list=sqlSession.selectList(ns+"searchall");
//		List<HouseDeal> list = sqlSession.selectList(ns+"selectall");
//		System.out.println(list.size());
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println(i);
//			System.out.println(list.get(i));
//		}
//	}
	
	public void searchtest() {
		System.out.println("test2");
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", "dong");
		map.put("word", "사직");
		List<String> list2 =new ArrayList<String>();
//		list2.add("1");
		list2.add("2");
//		list2.add("3");
		list2.add("4");
		map.put("typeList",list2);

		List<HouseDeal> list = sqlSession.selectList(ns + "search1",map);
		System.out.println(list.size());
		for (int i = 0; i < list.size(); i++) {
//			System.out.println(i);
			System.out.println(list.get(i));
		} 

	}


}