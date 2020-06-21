package com.ssafy.happyhouse.service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseDao;
import com.ssafy.happyhouse.dto.AreaInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseDealXML;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.Location;
import com.ssafy.happyhouse.util.PageDTO;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	private HouseDao dao;

	@Override
	public List<HouseDeal> listdeal() {
		return dao.deal_list();
	}

	@Override
	public HouseDeal infodeal(int no) {
		return dao.deal_info(no);
	}

	@Override
	public List<AreaInfo> selectSido() {
		return dao.selectSido();
	}


	@Override
	public List<AreaInfo> selectGugun(String sido) {
		return dao.selectGugun( sido);
	}

	@Override
	public List<HouseInfo> selectDong(String gugun) {
		return dao.selectDong(gugun);
	}
	@Override
	public List<HouseInfo> selectApt(String dong) {
		return dao.selectApt( dong);
	}

	@Override
	public List<HouseDeal> search(HouseDealXML dto) {
		return dao.search(dto);
	}

	@Override
	public Location findGuCenterLocation(String guname) {
		return dao.findGuCenterLocation(guname);
	}

	@Override
	public List<GreenInfo> findGreenList(String code) {
		return dao.findGreenList(code);
	}

	@Override
	public AreaInfo findaddress(String dong) {
		return dao.findaddress(dong);
	}

	@Override
	public List<HouseInfo> sliderRangeList(Map<String, String> map) {
		return dao.sliderRangeList(map);
	}

	@Override
	public List<HouseDeal> paging(PageDTO p) {
		return dao.paging(p);
	}

	@Override
	public PageNavigation makePageNavigation(PageDTO p) {
		int currentPage = p.getPg();
		int sizePerPage = 10;
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; //페이지갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = dao.totalcnt(p);//총 게시글 수(?)
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount-1)/ sizePerPage+1; // 총 페이지수(?)
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize; // startRange true : 이전x false:이전 o
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount -1) / naviSize * naviSize < currentPage; // endRange true : 다음 x false : 다음 o
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public HouseDeal infodongAptToDeal(HouseInfo a) {
		return dao.infodongAptToDeal(a);
	}

	@Override
	public HouseInfo noToDongApt(int no) {
		return dao.noToDongApt(no);
	}

	@Override
	public void updateclick(int no) {
		dao.updateclick(no);
	}

	@Override
	public List<HouseDeal> hotlist() {
		return dao.hotlist();
	}



}
