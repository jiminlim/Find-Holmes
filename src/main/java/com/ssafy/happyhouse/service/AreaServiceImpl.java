package com.ssafy.happyhouse.service;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.AreaDao;
import com.ssafy.happyhouse.dto.EnvironmentInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.PinArea;
import com.ssafy.happyhouse.util.DongCompare;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class AreaServiceImpl implements AreaService {
	@Autowired
	private AreaDao dao;


	@Override
	public String setting(PinArea pinArea, String id) throws SQLException {
		String code = dao.searchCode(pinArea);
		String msg = "";
		if (code != null) {
			int ch = dao.check(code, id);
			if (ch == 0) {
				dao.setting(code, id);
				msg = "관심지역이 등록되었습니다.";
			} else {
				msg = "이미 등록되었습니다.";
			}
		}
		return msg;
	}

	@Override
	public List<PinArea> chooseList(String id) throws SQLException {
		List<String> code = new ArrayList<>();
		code = dao.searchPcode(id);
		List<PinArea> area = new ArrayList<>();
		if (code.size() != 0) {
			for (int i = 0; i < code.size(); i++) {
				area.add(dao.pList(code.get(i)));
			}
		}
		return area;
	}

	@Override
	public List<GreenInfo> getGreen(String dong, String[] cbox) throws SQLException {
		if (cbox[0].equals("green")) {
			List<GreenInfo> get =dao.getGreen();
			DongCompare dc = new DongCompare();
			dc.setDong(dong);
			dc.setList(get);
			dc.compare();
			return dc.getResult();
		}
		else return new ArrayList<>();
	}
//	@Override
//	public List<GreenInfo> getGreen(String dong, String[] cbox) throws SQLException {
//		if (cbox[0].equals("green")) {
//			return dao.getGreen(dong);
//		}
//		else return new ArrayList<>();
//	}

	@Override
	public List<EnvironmentInfo> getEnvi(int currentPage, int sizePerPage, String dong, String[] cbox)
			throws SQLException {
		if(cbox[0].equals("envi"))
			return dao.getEnvi(currentPage, sizePerPage, dong);
		else if(cbox.length==2 &&cbox[1].equals("envi"))
			return dao.getEnvi(currentPage, sizePerPage, dong);
		else return new ArrayList<>();
		
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String dong) {
		int naviSize = 10;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount=0;
		try {
			totalCount = dao.getTotalCount(dong);
		} catch (SQLException e) {
			e.printStackTrace();
		}//총게시글 수
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;//총페이지 수
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;// true면 이전클릭 x . false면 이전클릭o
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;// true면 다음클릭 x . false면 다음클릭o
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
}
