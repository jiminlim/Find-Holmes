package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.dto.AreaInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseDealXML;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.Location;
import com.ssafy.happyhouse.util.PageDTO;
import com.ssafy.happyhouse.util.PageNavigation;

public interface HouseService {

	public List<HouseDeal> listdeal();
	public HouseDeal infodeal(int no);
	public List<AreaInfo> selectSido();
	public List<AreaInfo> selectGugun(String sido);
	public List<HouseInfo> selectDong(String gugun);
	public List<HouseInfo> selectApt(String dong);
	public List<HouseDeal> search(HouseDealXML dto);
	public Location findGuCenterLocation(String guname);
	public List<GreenInfo> findGreenList(String code);
	public AreaInfo findaddress(String dong);
	public List<HouseInfo> sliderRangeList(Map<String, String> map);
	public List<HouseDeal> paging(PageDTO p);
	public PageNavigation makePageNavigation(PageDTO p);
	public HouseDeal infodongAptToDeal(HouseInfo a);
	public HouseInfo noToDongApt(int no);
	public void updateclick(int no);
	public List<HouseDeal> hotlist();
}
