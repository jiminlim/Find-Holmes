package com.ssafy.happyhouse.controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.dto.EnvironmentInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.PinArea;
import com.ssafy.happyhouse.dto.UserInfo;
import com.ssafy.happyhouse.service.AreaService;
import com.ssafy.happyhouse.util.PageNavigation;


//@WebServlet("/area.do")
@Controller
@RequestMapping(value = "/area")
public class AreaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private AreaService areaService;

	private void findarea(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/area.do?act=list&pg=1";
		String dong = request.getParameter("dd");
		
		String[] cbox = request.getParameterValues("areaCheck");
		List<GreenInfo> green = new ArrayList<GreenInfo>();
		List<EnvironmentInfo> envi = new ArrayList<EnvironmentInfo>();
		int currentPage = Integer.parseInt(request.getParameter("pg"));
		int sizePerPage = 10;

		if (cbox.length != 0) {
			try {
				green = areaService.getGreen(dong, cbox);
				envi = areaService.getEnvi(currentPage, sizePerPage, dong, cbox);
				if (!envi.isEmpty()) {
					PageNavigation pageNavigation = areaService.makePageNavigation(currentPage, sizePerPage, dong);
					request.setAttribute("navigation", pageNavigation);
				}
				request.setAttribute("dd", dong);
				request.setAttribute("greeninfo", green);
				request.setAttribute("enviinfo", envi);
				path = "/area.do?act=list&pg=1";
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
				path = "/error/error.jsp";
			}
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/area/arealist.jsp";
		HttpSession session = request.getSession();

		try {
			UserInfo user = (UserInfo) session.getAttribute("userinfo");
			String id = user.getId();
			List<PinArea> pinArea = areaService.chooseList(id);
			if (pinArea != null) {
				request.setAttribute("areainfo", pinArea);
			}
			path = "/area/arealist.jsp";
		} catch (SQLException e) {
			request.setAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void setting(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String si = request.getParameter("si");
		String gu = request.getParameter("gu");
		String dong = request.getParameter("dong");

		PinArea pinArea = new PinArea();
		pinArea.setSi(si);
		pinArea.setGu(gu);
		pinArea.setDong(dong);

		HttpSession session = request.getSession();
		UserInfo user = (UserInfo) session.getAttribute("userinfo");
		String msg = "";
		try {
			msg = areaService.setting(pinArea, user.getId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String path = "/area.do?act=list";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
