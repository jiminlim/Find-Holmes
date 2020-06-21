package com.ssafy.happyhouse.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.AreaInfo;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseDealXML;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.util.PageDTO;
import com.ssafy.happyhouse.util.PageNavigation;


@Controller
@RequestMapping(value = "/apt")
public class AptController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	private HouseService houseService;

	@RequestMapping(value = "moveAptList",  method = RequestMethod.GET)
	public String moveAptList(Model model) throws Exception {
		return "apt/list";
	}
	
	@ResponseBody
	@RequestMapping("/alllistPaging")
	public JSONArray alllistPaging(@RequestParam(value = "pg") String pg,
			@RequestParam(value = "key") String key,
			@RequestParam(value = "word") String word,
			@RequestParam(value = "checkArr[]") String[] types) throws Exception {
		PageNavigation page = new PageNavigation();
		int pg1 = Integer.parseInt(pg);
		PageDTO p = new PageDTO(pg1, key, word, types);
		List<HouseDeal> list = houseService.paging(p);
		p.setPg(pg1);
		PageNavigation pageNavigation = houseService.makePageNavigation(p);
		JSONArray arr = new JSONArray();
		for(HouseDeal data : list) {
			JSONObject obj = new JSONObject();
			obj.put("no", data.getNo());
			obj.put("dong", data.getDong());
			obj.put("aptName", data.getAptName());
			obj.put("dealAmount", data.getDealAmount());
			obj.put("type", data.getType());
			obj.put("click", data.getClick());
			obj.put("navigation", pageNavigation);
			arr.add(obj);
		}
	return arr;
	}
	
	@RequestMapping(value = "moveAptInfo/{no}",  method = RequestMethod.GET)
	public String moveAptInfo(Model model, @PathVariable int no) throws Exception {
		HouseDeal deal = houseService.infodeal(no);
		houseService.updateclick(deal.getNo());
		model.addAttribute("noinfo", deal);
		String str = deal.getDong().trim();
		System.out.println(str);
		AreaInfo area = houseService.findaddress(str);
		model.addAttribute("address", area);
		return "apt/info";
	}
	
	@RequestMapping(value = "moveHouseInfo/{no}",  method = RequestMethod.GET)
	public String moveHouseInfo(Model model, @PathVariable int no) throws Exception {
		HouseInfo vo = houseService.noToDongApt(no);
		houseService.updateclick(vo.getNo());
		vo.setDong(vo.getDong().trim());
		vo.setAptName(vo.getAptName().trim());
		HouseDeal deal = houseService.infodongAptToDeal(vo);
		model.addAttribute("noinfo", deal);
		String str = deal.getDong().trim();
		AreaInfo area = houseService.findaddress(str);
		model.addAttribute("address", area);
		return "apt/info";
	}
	
	@ResponseBody
	@RequestMapping("/hotlist")
	public JSONArray hotlist() throws Exception {
		List<HouseDeal> deal = houseService.hotlist();
		JSONArray arr = new JSONArray();
		for(HouseDeal data : deal) {
			JSONObject obj = new JSONObject();
			obj.put("no", data.getNo());
			obj.put("dong", data.getDong());
			obj.put("aptName", data.getAptName());
			arr.add(obj);
		}
	return arr;
	}
	
}
