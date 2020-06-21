package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServlet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.protocol.x.Notice;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.service.NoticeService;

//@WebServlet("/apt.do")
@Controller
@RequestMapping(value = "/notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	private NoticeService noticeService;

	// 페이지 이동
	@RequestMapping("/mvwrite")
	public String mvwrite() {
		
		return "/notice/write";
	}
	
	
	@RequestMapping(value = "moveNoticeList",  method = RequestMethod.GET)
	public String AptList(Model model) throws Exception {
		model.addAttribute("articles", noticeService.getlist());
		return "/notice/noticelist";
	}
	
	@RequestMapping(value = "moveNoticeInfo/{no}",  method = RequestMethod.GET)
	public String moveAptInfo(Model model, @PathVariable int no) throws Exception {
		model.addAttribute("noinfo", noticeService.info(no));
		return "/notice/noticeinfo";
	}
	
	@RequestMapping(value = "noticedelete/{no}",  method = RequestMethod.GET)
	public String noticedelete(Model model, @PathVariable int no) throws Exception {
		noticeService.delete(no);
		return "redirect: /happyhouse/notice/moveNoticeList";
	}
	@RequestMapping(value = "write",  method = RequestMethod.GET)
	public String write(Model model, NoticeDto dto) throws Exception {
		noticeService.write(dto);
		return "redirect: /happyhouse/notice/moveNoticeList";
	}
	
	@RequestMapping(value = "noticemodify/{no}",  method = RequestMethod.GET)
	public String noticemodify(Model model, NoticeDto dto, @PathVariable int no) throws Exception {
		noticeService.mvmodify(dto, no);
		return "redirect: /happyhouse/notice/moveNoticeList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/indexnotice", method = RequestMethod.GET)
	private List<NoticeDto> indexnotice(Model model) {
		JSONArray arr = new JSONArray();
		
		try {
			List<NoticeDto> list = noticeService.getlist();
			for(NoticeDto data : list) {
				JSONObject obj = new JSONObject();
				obj.put("no", data.getNo());
				obj.put("subject", data.getSubject());
				arr.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return arr;
	}
}
