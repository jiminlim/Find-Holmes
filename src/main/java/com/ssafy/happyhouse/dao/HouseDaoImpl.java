package com.ssafy.happyhouse.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.AreaInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseDealXML;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.Location;
import com.ssafy.happyhouse.util.PageDTO;

@Repository
public class HouseDaoImpl implements HouseDao {

	@Autowired
	private SqlSession sqlSession;
	String ns = "housedeal.";
	
	@Override
	public List<HouseDeal> deal_list() {
		return sqlSession.selectList("housedeal.deal_list");
	}
	@Override
	public HouseDeal deal_info(int no) {
		return sqlSession.selectOne("housedeal.deal_info", no);
	}
	@Override
	public List<AreaInfo> selectSido() {
		return sqlSession.selectList(ns+"selectSido");
	}

	@Override
	public List<AreaInfo> selectGugun(String sido) {
		return sqlSession.selectList(ns+"selectGugun",sido);
	}

	@Override
	public List<HouseInfo> selectDong(String gugun) {
		return sqlSession.selectList(ns+"selectDong",gugun);
	}

	@Override
	public List<HouseInfo> selectApt(String dong) {
		return sqlSession.selectList(ns+"selectApt",dong);
	}
	@Override
	public List<HouseDeal> search(HouseDealXML dto) {
		return sqlSession.selectList(ns+"search",dto);
	}
	@Override
	public Location findGuCenterLocation(String code) {
		return sqlSession.selectOne("housedeal.findGuCenterLocation", code);
	}
	@Override
	public List<GreenInfo> findGreenList(String code) {
		return sqlSession.selectList(ns+"findGreenList",code);
	}
	@Override
	public AreaInfo findaddress(String dong) {
		return sqlSession.selectOne(ns+"findaddress",dong);
	}
	@Override
	public List<HouseInfo> sliderRangeList(Map<String, String> map) {
		List<HouseDeal> deallist = sqlSession.selectList(ns+"sliderRangeList", map);
		List<HouseInfo> infolist = new ArrayList<HouseInfo>();
		for (HouseDeal hd : deallist) {
			HouseInfo info = new HouseInfo();
			HouseInfo info2 = new HouseInfo();
			info.setAptName(hd.getAptName());
			info.setDong(hd.getDong());
			info2 =sqlSession.selectOne(ns+"dongANameHouseinfo",info);
			if(info2!=null) {
				infolist.add(info2);
			}
		}
		return infolist;
	}
	@Override
	public List<HouseDeal> paging(PageDTO page) {
		int result = (page.getPg()-1)*10;
		page.setPg(result);
		return sqlSession.selectList(ns+"pageList", page);
	}
	@Override
	public int totalcnt(PageDTO p) {
		return sqlSession.selectOne(ns+"totalcnt",p);
	}
	@Override
	public HouseDeal infodongAptToDeal(HouseInfo a) {
		return sqlSession.selectOne(ns+"infodongAptToDeal", a);
	}
	@Override
	public HouseInfo noToDongApt(int no) {
		return sqlSession.selectOne(ns+"noToDongApt", no);
	}
	@Override
	public void updateclick(int no) {
		sqlSession.update(ns+"updateclick", no);
		System.out.println("업데이트 완료!!");
	}
	@Override
	public List<HouseDeal> hotlist() {
		return sqlSession.selectList(ns+"hotlist");
	}


}
